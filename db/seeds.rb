# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# begin user accounts definition
Faker::Config.locale = :pl


employee_list = [
  ['Adminname', 'Adminlastname', 'admin@admin.com', 'qwertyui'],
  ['John', 'Doe', 'john.doe@example.com', 'password'],
  ['Christopher', 'Turner', 'hristopher.turner@example.com', 'password'],
  ['Brandon', 'Kelly', 'brandon.kelly@example.com', 'password'],
  ['Jessica', 'Lambert', 'jessica.lambert@example.com', 'password'],
  ['Simon', 'Lawrence', 'simon.lawrence@example.com', 'password']
]

industries = ['handel', 'IT', 'budownictwo', 'gastronomia', 'medycyna', 'marketing']



employee_list.each do |firstname, lastname, email, password|
  Employee.create! email: email, password: password, password_confirmation: password
end

class << self
  def contacts
    positions = ['prezes', 'członek zarządu', 'pracownik biurowy']
    contacts = []
    3.times do
      contacts << { 'name' => Faker::Name.first_name, 'lastname' => Faker::Name.last_name, 'position' => positions[Random.rand(3)], email: Faker::Internet.email }
    end
    contacts
  end
end

20.times do
  date_of_birth = Faker::Date.birthday
  Person.create!(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    email: Faker::Internet.email,
    pesel: Rpg::Pesel.new(gender: :male, date: date_of_birth).generate,
    phone_number: Faker::PhoneNumber.phone_number,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    postcode: Faker::Address.zip_code,
    date_of_birth: date_of_birth
    )
end

20.times do
  Business.create!(
    name: Faker::Company.name,
    industry:  industries[Random.rand(3)],
    email: Faker::Internet.email,
    krs: 10.times.map{ Random.rand(10).to_s }.reduce(:+),
    nip: 10.times.map{ Random.rand(10).to_s }.reduce(:+),
    regon: 10.times.map{ Random.rand(10).to_s }.reduce(:+),
    contacts: contacts,
    phone_number: Faker::PhoneNumber.phone_number,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    postcode: Faker::Address.zip_code
    )
end

