# Load the rails application
require File.expand_path('../application', __FILE__)
require 'skills'
require 'blocking'
require 'meta_extensions'
require 'open-uri'
require 'board'
require 'actions'
# Initialize the rails application
Dungeonbowl::Application.initialize!
