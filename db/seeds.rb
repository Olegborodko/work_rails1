# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.delete_all
Role.delete_all
User.delete_all

a=Admin.new(email:'s@s.ua', first_name: '1', last_name:'1', password:'s', password_confirmation:'s');
r=Role.create(name: 'super_admin')
a.role=r
a.save

a=Admin.new(email:'2@2.ua', first_name: '2', last_name:'2', password:'2', password_confirmation:'2');
r=Role.create(name: 'admin')
a.role=r
a.save

User.create(email:'1@1.ua', first_name: 'u', last_name:'u', password:'1', password_confirmation:'1', secret: '111');

#Role.create(name:'admin')

