require_relative '../cookies_and_ovens'

## Generate Objects						  ##
##										  ##
beginning_bakery = Bakery.new			  ##
a_bakery = Bakery.new				      ##
a_bakery.get_recipes('cookies.csv')		  ##
a_batch = a_bakery.prep_batch('2') 		  ##
############################################

describe Bakery do
	describe '.oven' do
		it 'has an empty oven' do
			expect(beginning_bakery.oven).to eq([])
		end
	end

	describe '.recipes' do
		it 'has an empty recipe holder' do
			expect(beginning_bakery.recipes).to eq([])
		end
	end

	describe '.get_recipes' do
	  it 'reads csv file, and puts each recipe into the recipe array' do
		expect(a_bakery.recipes.length).to be >= 1      
	  end
	end
  
	describe '.find_recipe_by_id' do
      it 'find a recipe by id from .recipes array' do
        expect(a_bakery.find_recipe_by_id('2').name).to eq('Oatmeal Raisin')
      end
	end
  
    describe '.display_menu' do
	  it 'displays recipe id and recipe name' do
        expect(a_bakery.display_menu).to eq("- - - - - - M E N U - - - - - -\n1. Chocolate Chip\n2. Oatmeal Raisin\n3. White Chocolate Macademia\n4. Sugar\n5. Peanut Butter\n0. Return to Main Menu\n- - - - - - - - - - - - - - - -\n\n\n")
     	end
    end
  
	describe '.prep_batch' do
      it 'creates a batch of cookies by id' do
        expect(a_bakery.prep_batch('2').name).to eq('Oatmeal Raisin')
        expect(a_bakery.prep_batch('2').ingredients).to eq("butter, brown sugar, sugar, eggs, vanilla, all-purpose flour, baking soda, ground cinnamon, salt, quaker oats, raisins")
      end
	end
  
	describe 'bake' do
      it 'puts a batch of cookies in the oven (empty array)' do
      	a_bakery.bake(a_batch)
        expect(a_bakery.oven.length).to be >= 1    
      end
	end

	describe 'remove_cookies!' do
      it 'deletes a batch of cookies from the array' do
      	a_bakery.bake(a_batch)
      	a_bakery.remove_cookies!(a_batch)
      	expect(a_bakery.oven.length).to be (0)  
      end
	end

	describe 'get_batch_status' do
      it 'view a string describing the status of a batch' do
        expect(a_bakery.get_batch_status(a_batch)).to eq("raw")
      end
	end
end

