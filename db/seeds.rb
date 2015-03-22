# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# begin user accounts definition
employee_list = [
  ['Adminname', 'Adminlastname', 'admin@admin.com', 'qwertyui'],
  ['John', 'Doe', 'john.doe@example.com', 'password'],
  ['Christopher', 'Turner', 'hristopher.turner@example.com', 'password'],
  ['Brandon', 'Kelly', 'brandon.kelly@example.com', 'password'],
  ['Jessica', 'Lambert', 'jessica.lambert@example.com', 'password'],
  ['Simon', 'Lawrence', 'simon.lawrence@example.com', 'password']
]

employee_list.each do |firstname, lastname, email, password|
  Employee.create! email: email, password: password, password_confirmation: password
end
