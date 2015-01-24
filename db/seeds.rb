# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.delete_all
Role.delete_all

a=Admin.create(email:'s@s.ua', first_name: '1', last_name:'1', password:'111111', password_confirmation:'111111');
r=Role.new(name: 'super_admin')
r.admin=a
r.save

#Role.create(name:'admin')

