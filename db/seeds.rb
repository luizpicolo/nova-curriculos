# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.new({
	:name => "admin",
	:email => "admin@novacurriculos.com.br",
	:password => "mamute153",
	:is_candidate => true,
	:password_confirmation => "mamute153",
	:admin => true
}).save
