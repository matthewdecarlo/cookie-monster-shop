<<<<<<< HEAD
#                                                                                                                                       ,---.
#  ,-----.              ,--.    ,--.           ,--.   ,--.                       ,--.                     ,---.  ,--.                   |   |
# '  .--./ ,---.  ,---. |  |,-. `--' ,---.     |   `.'   | ,---. ,--,--,  ,---.,-'  '-. ,---. ,--.--.    '   .-' |  ,---.  ,---.  ,---. |  .'
# |  |    | .-. || .-. ||     / ,--.| .-. :    |  |'.'|  || .-. ||      \(  .-''-.  .-'| .-. :|  .--'    `.  `-. |  .-.  || .-. || .-. ||  |
# '  '--'\' '-' '' '-' '|  \  \ |  |\   --.    |  |   |  |' '-' '|  ||  |.-'  `) |  |  \   --.|  |       .-'    ||  | |  |' '-' '| '-' '`--'
#  `-----' `---'  `---' `--'`--'`--' `----'    `--'   `--' `---' `--''--'`----'  `--'   `----'`--'       `-----' `--' `--' `---' |  |-' .--.
#                                                                                                                                `--'   '--'
# By M.M.Design and Matthewwho
=======
Logo = %q"
  🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪
🍪    __                       ,_ _                                                  🍪
🍪   / ()  _   _  |)  o  _    /| | |   _         , _|_  _  ,_      () |)    _      | 🍪
🍪  |     / \_/ \_|/) | |/     | | |  / \_/|/|  / \_|  |/ /  |     /\ |/\  / \_|/\_| 🍪
🍪   \___/\_/ \_/ | \/|/|_/    | | |_/\_/  | |_/ \/ |_/|_/   |/   /(_)|  |/\_/ |_/ o 🍪
🍪                                                                            (|     🍪
  🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪 🍪
"
# By M.M.Design and Matthewwho
require 'csv'
require 'time'

class Bakery
  attr_accessor :recipes, :oven

  def initialize
    @oven = []
    @recipes = []
  end

  def get_recipes(filename)
    CSV.foreach(filename, :headers => true, :header_converters => :symbol) do |recipe_attributes| recipes << Recipe.new(recipe_attributes)
    end
  end

  def find_recipe_by_id(id)
    recipes.each do |a_recipe|
      return a_recipe if a_recipe.id == id
    end
  end

  def display_menu
    puts "MENU"
    recipes.each do |a_recipe|
      print "#{a_recipe.id}: #{a_recipe.name}\n"
    end
  end

  def prep_batch(id)
    current_recipe = find_recipe_by_id(id)
    a_batch = Batch_of_Cookies.new({name:current_recipe.name, ingredients:current_recipe.ingredients})
  end

  def bake(a_batch)
    oven << a_batch
  end

  def remove_cookies!(a_batch)
    oven.delete(a_batch)
  end

  def get_batch_status(a_batch)
    current_time = Time.now
    if current_time < ( a_batch.start_time + (1 * 60) )
      return "Raw"
    elsif current_time < ( a_batch.start_time + (5 * 60) )
      return "Gooey"
    elsif current_time < ( a_batch.start_time + (8 * 60) )
      return "Almost Ready!"
    elsif current_time < ( a_batch.start_time + (8 * 60) + 30 )
      return "Done"
    elsif current_time < ( a_batch.start_time + (9 * 60) )
      return "A Little Bit Toasty"
    else
      return "Burnt"
    end
  end
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
  attr_reader :start_time

  def initialize(attributes)
    @name         = attributes[:name]
    @ingredients    = attributes[:ingredients]
    @start_time     = Time.now
  end

  def to_s
"
A batch of #{self.name} cookies.

Start Time: #{self.start_time}

Ingredients:
#{self.ingredients}
"
  end
end

#Runner

print "Welcome to:
#{Logo}
"

cookie_monster_shop = Bakery.new
cookie_monster_shop.get_recipes('cookies.csv')


cookie_monster_shop.display_menu
print "Enter recipe number to bake: "
user_input = gets.chomp


# 🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪 
# Answer These Questions:
>>>>>>> 06b78ae172d8c1ab7e5ca84ecf7c79baf37939d0

require 'csv'
require 'time'

<<<<<<< HEAD
class Bakery
  attr_accessor :recipes, :oven

  def initialize
    @oven = []
    @recipes = []
  end

  def get_recipes(filename)
    CSV.foreach(filename, :headers => true, :header_converters => :symbol) do |recipe_attributes| recipes << Recipe.new(recipe_attributes)
    end
  end

  def find_recipe_by_id(id)
    recipes.each do |a_recipe|
      return a_recipe if a_recipe.id == id
    end
  end

  def display_menu
    puts "MENU"
    recipes.each do |a_recipe|
      print "#{a_recipe.id}: #{a_recipe.name}\n"
    end
  end

  def prep_batch(id)
    current_recipe = find_recipe_by_id(id)
    a_batch = Batch_of_Cookies.new({name:current_recipe.name, ingredients:current_recipe.ingredients})
  end

  def bake(a_batch)
    oven << a_batch
  end

  def remove_cookies!(a_batch)
    oven.delete(a_batch)
  end

  def get_batch_status(a_batch)
    current_time = Time.now
    if current_time < ( a_batch.start_time + (1 * 60) )
      return "Raw"
    elsif current_time < ( a_batch.start_time + (5 * 60) )
      return "Gooey"
    elsif current_time < ( a_batch.start_time + (8 * 60) )
      return "Almost Ready!"
    elsif current_time < ( a_batch.start_time + (8 * 60) + 30 )
      return "Done"
    elsif current_time < ( a_batch.start_time + (9 * 60) )
      return "A Little Bit Toasty"
    else
      return "Burnt"
    end
  end
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
  attr_reader :start_time

  def initialize(attributes)
    @name         = attributes[:name]
    @ingredients    = attributes[:ingredients]
    @start_time     = Time.now
  end

  def to_s
"
A batch of #{self.name} cookies.

Start Time: #{self.start_time}

Ingredients:
#{self.ingredients}
"
  end
end

#RUNNER
cookie_monster_shop = Bakery.new
cookie_monster_shop.get_recipes('cookies.csv')

print "Welcome to:
The Cookie Monster Shop!

"

cookie_monster_shop.display_menu
print "Enter recipe number to bake: "
user_input = gets.chomp


#   case user_input
#   when "list"
#     print bistro.list_recipes
#     # raise "TODO: implement listing of recipes"
#   when "display"
#     print bistro.find_recipe_by_id(ARGV[1]).to_s
#   else
#     raise "enter list or display"
#   end
# end




#TESTING

# p cookie_monster_shop.find_recipe_by_id("2")

# creating two batch objects
# a_batch = cookie_monster_shop.prep_batch("2")
# another_batch = cookie_monster_shop.prep_batch("2")

# #printing out the two object id's for the batches we just created.
# p a_batch.object_id
# p another_batch.object_id

# # These are two different objects, so their id's are different.
# p a_batch.object_id == another_batch.object_id
# print cookie_monster_shop.bake(a_batch)



a_batch = cookie_monster_shop.prep_batch("2")
p cookie_monster_shop.bake(a_batch)
p cookie_monster_shop.remove_cookies!(a_batch)
p cookie_monster_shop.get_batch_status(a_batch)






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

=======
# 🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪
>>>>>>> 06b78ae172d8c1ab7e5ca84ecf7c79baf37939d0
