# The following is a short description of an application that lets a customer
# place an order for a meal:

# - A meal always has three meal items: a burger, a side, and drink.
# - For each meal item, the customer must choose an option.
# - The application must compute the total cost of the order.

# 1. Identify the nouns and verbs we need in order to model our classes and methods.
# 2. Create an outline in code (a spike) of the structure of this application.
# 3. Place methods in the appropriate classes to correspond with various verbs.

# nouns: meal, customer, burger, side, drink
# verbs: choose_option, total_cost

class Customer
  attr_reader :order

  def initialize(name)
    @name = name
    @order = order
  end

  def order
    Meal.new
  end
end

class Meal
  def initialize
    @burger = Burger.new
    @side = Side.new
    @drink = Drink.new
  end

  def cost; end
end

class MealItem
  def initialize
    @option = choose
  end
end

class Burger
  def choose; end
end

class Side
  def choose; end
end

class Drink
  def choose; end
end

joel = Customer.new("joel")

p joel.order
