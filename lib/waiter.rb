class Waiter
    @@all = []
    attr_accessor :name, :years

    def initialize(name, years_experience)
        @name = name
        @years = years_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal|
            meal.waiter == self
        }
    end

    def best_tipper
        best_tip = meals.map{|meal|
            meal.tip
        }.max
        best_tip_customer = meals.find{|meal|
            meal.tip == best_tip
        }.customer
    end
end