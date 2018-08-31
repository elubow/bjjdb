# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Creating Admin User'
User.create!(id: 42, email: 'eric@lubow.org', name: 'e', role: 'admin', password: 'test123', password_confirmation: 'test123')

puts 'Creating Links'
Link.create!(
  title: "Winter Camp 2018: 60 Minutes Wrestling Crash Course with Christian Graugart",
  url: 'https://www.bjjglobetrotters.com/winter-camp-2018-60-minutes-wrestling-crash-course-with-christian-graugart/',
  user_id: 42
)
Link.create!(
  title: "Summer Camp 2017: Turtle seminar with Priit Mihkelson",
  url: 'https://www.bjjglobetrotters.com/summer-camp-2017-turtle-seminar-with-priit-mihkelson/',
  user_id: 42
)
Link.create!(
  title: "Fall Camp 2018: Super Fundamental principles / White Belt Survival Course (for all belts) with Christian Graugart",
  url: 'https://www.bjjglobetrotters.com/fall-camp-2018-super-fundamental-principles-white-belt-survival-course-with-christian-graugart/',
  user_id: 42
)
Link.create!(
  title: "Omoplata Setup with Options",
  url: 'https://www.instagram.com/p/BnIMOvllheq/',
  user_id: 42
)
