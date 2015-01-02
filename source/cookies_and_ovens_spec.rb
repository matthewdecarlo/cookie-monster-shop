require_relative 'cookies_and_ovens'

describe Bakery do
  it 'has an empty oven' do
    a_bakery = Bakery.new
    expect(a_bakery.oven).to eq([])
  end

  it 'has an empty recipe holder' do
    a_bakery = Bakery.new
    expect(a_bakery.recipes).to eq([])
  end
  
  describe '.get_recipes' do
    it 'reads csv file, and puts each recipe into the recipe array' do
      a_bakery = Bakery.new
      a_bakery.get_recipes('cookies.csv')
      expect(a_bakery.recipes.length).to be >= 1      
    end
  end
end