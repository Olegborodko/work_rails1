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
Picture.delete_all

a=Admin.new(email:'s@s.ua', first_name: '1', last_name:'1', password:'ssssss', password_confirmation:'ssssss');
r=Role.create(name: 'super_admin')
a.role=r
a.save

a=Admin.new(email:'2@2.ua', first_name: '2', last_name:'2', password:'222222', password_confirmation:'222222');
r=Role.create(name: 'admin')
a.role=r
a.save

User.create(email:'1@1.ua', first_name: 'u', last_name:'u', password:'111111', password_confirmation:'111111', secret: '111', position: 1);

#Role.create(name:'admin')

