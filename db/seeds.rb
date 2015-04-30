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
  ['Simon', 'Lawrence', 'simon.lawrence@example.com', 'password'],
  ['Brandon', 'Lambert', 'brandon.lambert@example.com', 'password'],
  ['Jan', 'Kowalski', 'jan.kowalski@example.com', 'password'],
  ['Krzysztof', 'Nowak', 'krzysztof.nowak@example.com', 'password']
]

team_name_list = ["alfa", "beta", "gamma"]

industries = ['handel', 'IT', 'budownictwo', 'gastronomia', 'medycyna', 'marketing']



employee_list.each do |firstname, lastname, email, password|
  Employee.create! firstname: firstname, lastname: lastname, email: email, password: password, password_confirmation: password
end

class << self
  def contacts
    positions = ['prezes', 'członek zarządu', 'pracownik biurowy']
    contacts = []
    3.times do
      contacts << { name: Faker::Name.first_name, lastname: Faker::Name.last_name, position: positions[Random.rand(3)], email: Faker::Internet.email }
    end
    contacts
  end
end

ec_steps = Employee.count / team_name_list.count
start = 0

team_name_list.each_with_index do |name, i|
  start = i == 0 ? 1 : start + ec_steps
  puts "start : #{start} \n"
  puts "start : #{start + ec_steps} \n"
  Team.create!(
    team_name: name,
    employees: Employee.where('id>= ? AND id<=?',start, start + ec_steps)
    )
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
    date_of_birth: date_of_birth,
    team: Team.find(Random.rand(3))
    )
end

20.times do
  Business.create!(
    company_name: Faker::Company.name,
    industry:  industries[Random.rand(3)],
    email: Faker::Internet.email,
    krs: 10.times.map { Random.rand(10).to_s }.reduce(:+),
    nip: 10.times.map { Random.rand(10).to_s }.reduce(:+),
    regon: 10.times.map { Random.rand(10).to_s }.reduce(:+),
    contacts: contacts,
    phone_number: Faker::PhoneNumber.phone_number,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    postcode: Faker::Address.zip_code,
    team: Team.find(Random.rand(3))
    )
end

Employee.all.map do |employee|
  2.times do
    customer = Customer.find(Random.rand(40))
    Message.create!(
      sender: employee,
      recipient: customer,
      subject: Faker::Lorem.sentence(4),
      body: 'Dzień dobry, <br /> ' << Faker::Lorem.sentence(120),
      from: employee.email,
      to: customer.customerable.email,
      date:  DateTime.now + Random.rand(60).minutes
    )
  end

  3.times do
    employee2 = Employee.find(Random.rand(9))
    Message.create!(
      sender: employee2,
      recipient: employee,
      subject: Faker::Lorem.sentence(4),
      body: 'Dzień dobry, <br /> ' << Faker::Lorem.sentence(120),
      from: employee2.email,
      to: employee.email,
      date:  DateTime.now + Random.rand(60).minutes
    )
  end
end

Team.all.map do |team|
  ids = team.customers.ids
  3.times do
    customer = Customer.find(ids[Random.rand(ids.count)])
    Message.create!(
      sender: customer,
      recipient: team,
      subject: Faker::Lorem.sentence(4),
      body: 'Dzień dobry, <br /> ' << Faker::Lorem.sentence(120),
      from: customer.customerable.email,
      to: team.email,
      date:  DateTime.now + Random.rand(60).minutes
    )
  end

  3.times do
    customer = Customer.find(ids[Random.rand(ids.count)])
    Message.create!(
      sender: team,
      recipient: customer,
      subject: Faker::Lorem.sentence(4),
      body: 'Dzień dobry, <br /> ' << Faker::Lorem.sentence(120),
      from: employee.email,
      to: customer.customerable.email,
      date:  DateTime.now + Random.rand(60).minutes
    )
  end
end


