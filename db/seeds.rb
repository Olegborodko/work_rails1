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

a=Admin.create(email:'s@s.ua', first_name: '1', last_name:'1', password:'s', password_confirmation:'s');
r=Role.new(name: 'super_admin')
r.admin=a
r.save

a=Admin.create(email:'2@2.ua', first_name: '2', last_name:'2', password:'2', password_confirmation:'2');
r=Role.new(name: 'admin')
a.role=r
r.save

User.create(email:'1@1.ua', first_name: 'u', last_name:'u', password:'1', password_confirmation:'1');

#Role.create(name:'admin')

