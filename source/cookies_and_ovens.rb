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
    puts "- - - - - - M E N U - - - - - -\n"

    recipes.each do |a_recipe|
      print "#{a_recipe.id}. #{a_recipe.name}\n"
    end

    print "0. Return to Main Menu\n"
    puts "- - - - - - - - - - - - - - - -\n\n"
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
      return "raw"
    elsif current_time < ( a_batch.start_time + (5 * 60) )
      return "gooey"
    elsif current_time < ( a_batch.start_time + (8 * 60) )
      return "almost ready"
    elsif current_time < ( a_batch.start_time + (8 * 60) + 30 )
      return "done"
    elsif current_time < ( a_batch.start_time + (9 * 60) )
      return "a little bit toasty"
    else
      return "burnt"
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