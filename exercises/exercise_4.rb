require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'

puts "Exercise 4"
puts "----------"

# Your code goes here ...
burnaby = Store.create(annual_revenue: 300000, mens_apparel: true, womens_apparel: true)
richmond = Store.create(annual_revenue: 1260000, mens_apparel: false, womens_apparel: true)
gastown = Store.create(annual_revenue: 190000, mens_apparel: true, womens_apparel: false)
surrey = Store.create(annual_revenue: 224000, mens_apparel: false, womens_apparel: true)
whistler = Store.create(annual_revenue: 1900000, mens_apparel: true, womens_apparel: false)
yaletown = Store.create(annual_revenue: 430000, mens_apparel: true, womens_apparel: true)

puts Store.all.count

@mens_stores = Store.where(mens_apparel: true).order(created_at: :desc)
@mens_stores.each do |store|
  puts "each store: #{store.name}, #{store.annual_revenue}"
end

@womens_stores = Store.where(womens_apparel: true)
@womens_stores = @womens_stores.where("annual_revenue < ?", 1000000)
@womens_stores.each do |store|
  puts "each store: #{store.name}, #{store.annual_revenue}"
end
