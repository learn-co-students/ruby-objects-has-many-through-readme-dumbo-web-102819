require "pry"

class Customer
    attr_accessor :name, :age
    @@all = []
def initialize (name, age)
    @name = name
    @age = age
  
    @@all << self
end ## initialize

def self.all
    @@all
end ### all


def new_meal(waiter, total, tip)
   Meal.new(waiter, self, total, tip)

end ### new meal

def meals
    Meal.all.select do |meal|
    meal.customer == self
    end ## select

end ### meals

def waiters
    meals.map do |meal|
    meal.waiter
    end ## map
    
end ### waiters


end ## customer class