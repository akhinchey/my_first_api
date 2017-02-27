# My First API

A simple API with two endpoints: 
- a POST that receives a url and 'indexes the content' (in this case storing the contents of any h1, h2, h3 and link tags that are present on the page)
- a GET that lists previously stored urls 

Things to know:

* Requirements:
ruby ~> 2.2.4
Rails 5
PostgreSQL

* Deployment instructions
- Make sure PostgreSQL is running on your machine 
- Clone and download this repo
- cd into the repo in your terminal 
- run 'bundle install'
```
$ bundle install
``` 
- create and migrate the database
```
$ rails db:create

$ rails db:migrate
``` 
- start the server!
```
$ rails s
```

To use the POST endpoint to store a url, you can use the following command in your terminal:
```
$ curl -i -H "Accept: application/json" -H "Content_type: application/json" -X POST -d '{"name": "https://www.facebook.com"}' http://localhost:3000/api/v1/urls
```

To use the GET endpoint to view stored urls, you can either visit the following url in your browser:

'http://localhost:3000/api/v1/urls'

or use the following command in your terminal:
```
$ curl -i -H "Accept: application/json" -H "Content_type: application/json" http://localhost:3000/api/v1/urls
```