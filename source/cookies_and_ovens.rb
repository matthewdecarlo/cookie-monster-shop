#                                                                                                                                       ,---.
#  ,-----.              ,--.    ,--.           ,--.   ,--.                       ,--.                     ,---.  ,--.                   |   |
# '  .--./ ,---.  ,---. |  |,-. `--' ,---.     |   `.'   | ,---. ,--,--,  ,---.,-'  '-. ,---. ,--.--.    '   .-' |  ,---.  ,---.  ,---. |  .'
# |  |    | .-. || .-. ||     / ,--.| .-. :    |  |'.'|  || .-. ||      \(  .-''-.  .-'| .-. :|  .--'    `.  `-. |  .-.  || .-. || .-. ||  |
# '  '--'\' '-' '' '-' '|  \  \ |  |\   --.    |  |   |  |' '-' '|  ||  |.-'  `) |  |  \   --.|  |       .-'    ||  | |  |' '-' '| '-' '`--'
#  `-----' `---'  `---' `--'`--'`--' `----'    `--'   `--' `---' `--''--'`----'  `--'   `----'`--'       `-----' `--' `--' `---' |  |-' .--.
#                                                                                                                                `--'   '--'
# By M.M.Design and Matthewwho

require 'csv'

# class Oven #
#   attr_accessor :contents, :time_in_oven

#   def initialize
#     @contents = []
#     @number_of_batches = contents.length / 12
#   end

#   def empty?
#     contents.empty?
#   end

#   def bake(baking_time)
#     contents.each { |cookie| cookie.bake(baking_time) }
#   end

# end


class Bakery
  attr_accessor :prepped_cookies, :cookie_basket

  def initialize
    @cookie_sheet = []
    @recipes = []
  end

  def get_recipes(filename)
    CSV.foreach(filename, :headers => true, :header_converters => :symbol) do |recipe_attributes| recipes << Recipe.new(recipe_attributes)
    end
  end

  def find_recipe_by_id(id)
    recipes.each do |a_recipe|
      if a_recipe.id == id
        return a_recipe
      end
  end

  def prep_batch(id)
    current_recipe = find_recipe_by_id()
    a_batch = Batch_of_Cookies.new({current_recipe.name, current_recipe.ingredients})
  end

  def bake
    # put in oven (push batch into array
  end

  def remove_cookies
    # take out of oven (shift batch out of array)
  end

#   def get_batch_status
#     # return the current status of cookies (raw, almost ready, done, a little bit toasty)
#   end
end



class Recipe
  attr_accessor :id, :name, :ingredients, :bake_time, :baking_temperature

  def initialize(attributes)
    @id         = attributes[:id]
    @name         = attributes[:name]
    @ingredients    = attributes[:ingredients]
    @bake_time      = attributes[:bake_time]
    @baking_temperature = attributes[:baking_temperature]
  end

  def to_s
"
#{self.id}: #{self.name}

Bake Time: #{self.bake_time}

Temperature: #{self.baking_temperature}

Ingredients:
#{self.ingredients}
"
  end
end

class Batch_of_Cookies
  attr_accessor :name, :ingredients

  def initialize(attributes)
    @name         = attributes[:name]
    @ingredients    = attributes[:ingredients]
    @start_time     = Time.now
  end

  def to_s
"
A bacth of #{self.name} cookies.
Price: $#{'%.2f' % self.price}

Start Time: #{self.start_time}

Ingredients:
#{self.ingredients}
"
  end
end

# class Cookie
#   def bake(time)
#     self.cookie_time = cookie_time + time
#   end

#   def cookie_ready
#     if cookie_time <= baking_time / 2
#       "doughy"
#     elsif cookie_time < baking_time
#       "almost ready"
#     elsif cookie_time == baking_time
#       "ready"
#     else
#       "burned"
#     end
#   end

#   def done?
#     cookie_time == baking_time
#   end
# end
# end


#RUNNER
  cookie_monster_shop = Bakery.new
  cookie_monster_shop.get_recipes('cookies.csv')
#   << [b1,b2,b3,b4] <<
#   container.shift



#TESTING


# a_bakery.prepped_cookies.each { |cookie| print cookie.class}


# chocolate_chip_cookie = {id:          1,
#             name:         "Chocolate Chip",
#             ingredients:      "all-purpose flour, baking soda, unsalted butter, granulated sugar, light-brown sugar, salt, pure vanilla extract, eggs, semisweet chocolate chips",
#           bake_time:        10,
#             baking_temperature:   350,
#             price:          2.5}

# yummy = Cookie.new(chocolate_chip_cookie)
# print yummy.to_s






# Whiteboarding (psuedo code)

#MVP



#Advanced Final Result

# Recipe Class Attriutes:
# • ID
# • Bake Time
# • Name (Flavor/ Type)
# • Ingredients
# • to_s for self-status

# Batch_of_cookies Class Attriutes:
# • Start Time
# • Name
# • Price
# • Ingredients
# • to_s for self-status

# Bakery Class Attriutes:
# • Put in oven
# • Take out of oven
# • Display Menu of current cookies
# • Display current number of batches in oven
# • [Sell cookies]
# • to_s for self-status

# Oven Class Attriutes:
# • Bake Cookies
# • On?
# • Pre-heated?
# • to_s for self-status

# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?


# Your code here