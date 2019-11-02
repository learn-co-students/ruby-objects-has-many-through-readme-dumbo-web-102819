class Waiter
    attr_accessor :name, :yrs_experience
   @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end
   
    def meals
        Meal.all.select do |meal|
          meal.waiter == self
        end
    end

    def customers
        meals.map do |meal|
          meal.customer
        end
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def best_tipper
        largest_tip = 0
        instance_variable = nil
        meals.each do |instance|
            if instance.tip > largest_tip 
                largest_tip = instance.tip 
                instance_variable = instance.customer 
            end 
        end 
        instance_variable 
    end 


end