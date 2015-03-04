# This file will load our environment.

# Make sure our default SINATRA_ENV is development if it has not been set
# by the global environment.
ENV['SINATRA_ENV'] ||= "development"

# It's goals are:
# 1. To load all gems via bundler.
# 2. To establish a database connection or Sequel to use.
# 3. To load all the files of our application, models, concerns, controllers

# Load Bundler
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# A little about ENV['SINATRA_ENV']
# ENV is a constant that is provided by ruby that stores Environmental
# variables in a hash. These variables cross the boundary of our application,
# to the system the application runs on. Thus, a command line argument
# or a BASH variable will be present in this object.

# Rack likes to store the mode our application should run within a variable
# called SINATRA_ENV with ENV. This allows our application to run in different
# modes with different settings and configurations.

# The two modes we are interested in are "development" and "test".

# Establish our Database connection.
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

# require_all is a gem that you pass it a directory
# and it loads all .rb in there.
# https://github.com/jarmo/require_all
require_all 'app'