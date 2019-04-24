# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

# load up everything in seeds/common
Dir[Rails.root.join('db', 'seeds', 'common', '*.rb')].each {|file| load file }
# load up everything in seeds/development in the correct order
load 'db/seeds/development/aaa_first.rb'
load 'db/seeds/development/instructors.rb'
load 'db/seeds/development/links.rb'
load 'db/seeds/development/private_notes.rb'
