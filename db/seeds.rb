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
  ['Adminname', 'Adminlastname', "admin@#{EMAIL_HOST}", 'qwertyui'],
  ['John', 'Doe', "john.doe@#{EMAIL_HOST}", 'password'],
  ['Christopher', 'Turner', "hristopher.turner@#{EMAIL_HOST}", 'password'],
  ['Brandon', 'Kelly', "brandon.kelly@#{EMAIL_HOST}", 'password'],
  ['Jessica', 'Lambert', "jessica.lambert@#{EMAIL_HOST}", 'password'],
  ['Simon', 'Lawrence', "simon.lawrence@#{EMAIL_HOST}", 'password'],
  ['Brandon', 'Lambert', "brandon.lambert@#{EMAIL_HOST}", 'password'],
  ['Jan', 'Kowalski', "jan.kowalski@#{EMAIL_HOST}", 'password'],
  ['Krzysztof', 'Nowak', "krzysztof.nowak@e#{EMAIL_HOST}", 'password']
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
  person = Person.create!(
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
  person.customer.team = Team.find(Random.rand(3) + 1)
  person.customer.save!
end

20.times do
  business = Business.create!(
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
    postcode: Faker::Address.zip_code
    )
  business.customer.team = Team.find(Random.rand(3) + 1)
  business.customer.save!
end

Employee.all.map do |employee|
  2.times do
    customer = Customer.find(Random.rand(40) + 1)
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
    employee2 = Employee.find(Random.rand(9) + 1)
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
      to: "#{team.team_name}@crm-prz.herokuapp.com",
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
      from: "#{team.team_name}@crm-prz.herokuapp.com",
      to: customer.customerable.email,
      date:  DateTime.now + Random.rand(60).minutes
    )
  end
end
