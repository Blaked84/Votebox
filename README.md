# README

[![Build Status](https://travis-ci.org/Blaked84/Votebox.svg?branch=master)](https://travis-ci.org/Blaked84/Votebox)
[![Code Climate](https://codeclimate.com/github/Blaked84/Votebox.png)](https://codeclimate.com/github/Blaked84/Votebox)
[![Test Coverage](https://codeclimate.com/github/Blaked84/Votebox/badges/coverage.svg)](https://codeclimate.com/github/Blaked84/Votebox/coverage)
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
