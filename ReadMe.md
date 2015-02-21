Sinatra Authentication Example
==============================
This Sinatra application demonstrates a simple authentication scheme. See [Sinatra Authentication](https://sideprojectsoftware.com/blog/2015/02/22/sinatra-authentication) for a full explanation.

Prerequisites
-------------
The application depends on the following RubyGems:

* [bcrypt](https://github.com/codahale/bcrypt-ruby)
* [sinatra](https://github.com/sinatra/sinatra)
* [sinatra-flash](https://github.com/SFEley/sinatra-flash)

Running
-------
To run the application in development use:

 `ruby webapp/app.rb`

and access using [http://localhost:4567](http://localhost:4567)

Alternatively, to run the web application using a [Rackup](http://rack.github.io/) file use:

 `rackup config.ru` (the `config.ru` may be omitted as Rack looks for this file by default)

and access using [http://localhost:9292](http://localhost:9292)

Credentials
-----------
The credentials for signing in to the app are:

* Username: user
* Password: secret123
