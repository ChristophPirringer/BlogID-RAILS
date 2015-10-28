# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

food_list = [
  [ "Apple", 75 ],
  [ "Ramen", 350 ],
  [ "Scone", 150 ],
  [ "Pizza", 1200 ],
  [ "Muffin", 200 ],
  [ "Sandwich", 250],
  [ "Burito", 500]
]

food_list.each do |name, calories|
  Food.create( name: name, calories: calories )
end

exercise_list = [
  [ "Running", 350 ],
  [ "Biking", 300 ],
  [ "Walking", 150 ],
  [ "Weight Lifting", 200 ]
]

exercise_list.each do |name, calories|
  Exercise.create( name: name, calories: calories )
end
