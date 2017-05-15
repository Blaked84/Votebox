# README

[![Build Status](https://travis-ci.org/Blaked84/Votebox.svg?branch=master)](https://travis-ci.org/Blaked84/Votebox)
## Initial Configuration

Before first use, you need to configure /config/secrets.yml

An example file is available in /config/secretes.yml.template

### Database creation

Database configuration is in config/database.yml

You can find an examples of databases.yml in /config :

* database.yml.mysql2.template : config file based on mysql2

* database.yml.sqlite3.template : config file based on sqlite3

Then, use :
 RAILS_ENV=development bundle exec rake db:setup
 RAILS_ENV=test bundle exec rake db:setup
 RAILS_ENV=production bundle exec rake db:setup
