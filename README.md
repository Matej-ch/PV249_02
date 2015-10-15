# Simple Api

Vasim ukolem je stahnout z Facebook API informace o poctu sdileni a poctu likes
u libovolne URL. (share_count, like_count)

Dotaz na Facebook API vypada napr. takto:

http://api.facebook.com/method/links.getStats?urls=https://github.com/municz&format=json

Vysledek (samozrejme ze cisla se budou lisit!):

[{"host"=>"github.com",
  "url"=>"https://github.com",
  "Počet likes článku"=>12406,
  "Počet sdílení článku"=>19605},
 {"host"=>"rubygems.org",
  "url"=>"http://rubygems.org",
  "Počet likes článku"=>49,
  "Počet sdílení článku"=>351}]

## Ne URL
```
$ bundle exec ./app.rb '12345678'
```
[{"host"=>"neznámý",
  "url"=>"12345678",
  "Počet likes článku"=>"neznámý",
  "Počet sdílení článku"=>"neznámý"}]

## Rozbite URL
```
$ bundle exec ./app.rb 'http://www.extra.cz/abc '
```
[{"host"=>"neznámý",
  "url"=>"http://www.extra.cz/abc ",
  "Počet likes článku"=>"neznámý",
  "Počet sdílení článku"=>"neznámý"}]

