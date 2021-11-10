require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
class Employee < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_numericality_of :hourly_rate, :greater_than => 40, :less_than => 200, :only_integer => true
  validates :store, presence: true
end

class Store < ActiveRecord::Base
  validates :name, length: { minimum: 3 }
  validates_numericality_of :annual_revenue, :only_integer => true, :greater_than => 0
end

puts "please enter for store name"
input_name = gets.chomp
newStore = Store.create(name: input_name)
newStore.valid?
puts newStore.errors.full_messages
