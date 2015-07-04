# README

## Sortlist Backend Challenge

Developer: Loren Hale

### Ruby version
* ruby 2.2.1
* rails 4.2.3


### Configuration

Standard Rails setup

`
$ bundle install
`
`
$ rake db:setup
`

### How to run the test suite

Run specs via command line:

`
$ rspec
`
and
`
$ rake jasmine
`

### How to run the app

`
$ rails server
`
### How to deploy

This uses figaro and assumes production is on Heroku

* copy config/application.yml.example -> config/application.yml
* run the following:
`
$ RAILS_ENV=production rake secret
`
* copy the secret and add it to the application.yml
* run the following:
`
$ git push heroku master
$ heroku run rake db:migrate
$ heroku run rake db:seed
`

