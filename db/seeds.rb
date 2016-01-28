# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

color = %w(red orange yellow green blue indigo violet rainbow)
gender = ["M", "F"]
birthday = ('1940'..'2015').to_a

10.times do
  Cat.create!(
    name: Faker::Name.name,
    color: color.sample,
    sex: gender.sample,
    birth_date: Time.now,
    description: Faker::Hipster.paragraph
  )
end
