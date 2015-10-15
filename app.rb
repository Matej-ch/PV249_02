#!/usr/bin/env ruby
# encoding:utf-8
require 'net/http'
require 'json'
require 'uri'
require 'pp'

FACEBOOK_API_URL   = 'http://api.facebook.com/'
QUERY              = 'method/links.getStats?urls=#query#&format=json'
UNKNOWN            = 'neznámy'
results            = []

ARGV.each do |url|
   uri = URI(url)
   if uri.host
     req = Net::HTTP.new(uri.host, uri.port)

     if uri.path.to_s.strip.length == 0
       query_updated = QUERY.gsub(/#query#/,url)
       content = Net::HTTP.get(URI (FACEBOOK_API_URL + query_updated))
       json_hash = JSON.parse(content)
       results << {
           'host'                 => uri.host, # base domain,
           'url'                  => url,
           'Počet likes článku'   => json_hash[0]['like_count'], # likes_count#
           'Počet sdílení článku' => json_hash[0]['share_count'] # shares_count#
       }
     else
       res = req.request_head(uri.path)
        if res.code != '202'
          results << {
              'host'                 => UNKNOWN, # base domain,
              'url'                  => url,
              'Počet likes článku'   => UNKNOWN, # likes_count#
              'Počet sdílení článku' => UNKNOWN # shares_count#
          }
        end
     end
   else
     results << {
         'host'                 => UNKNOWN, # base domain,
         'url'                  => url,
         'Počet likes článku'   => UNKNOWN, # likes_count#
         'Počet sdílení článku' => UNKNOWN # shares_count#
     }
   end
end

pp results
