require "pry"
class Waiter

    attr_accessor :name, :years_of_experience

@@all = []

def initialize (name, years_of_experience)
    @name = name 
    @years_of_experience = years_of_experience

    @@all << self
end ## initialize

def self.all
    @@all
end  ### all


def new_meal (customer, total, tip)
    Meal.new(self, customer, total, tip)

end ## new meal

def meals
    Meal.all.select do |meal|
    meal.waiter == self
    end ##select
end ###meals





def best_tipper
   
    #a.max { |a, b| a.length <=> b.length }
    best_tipper_meal = meals.max do |meal_a,meal_b|
     
    meal_a.tip <=> meal_b.tip
    end ##max
    best_tipper_meal.customer
   
end ## best tipper



end ### class waiter