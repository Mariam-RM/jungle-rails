require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "is valid with all four fields" do
      catx = Category.new(name: "testCat")
      product = Product.new(name: "Bob", price: 25, quantity: 5, category: catx)
      expect(product).to be_valid
    end

    it "is not valid if name is absent" do
      cat1 = Category.new(name: "test1")
      product = Product.new(name: nil, price: 100, quantity: 5, category: cat1)
      expect(product).to_not be_valid

      # expect(product.errors[:name].messages.first).to eq "can't be blank"
    end

    it "is not valid if price is not present or not a number" do
      cat2 = Category.new(name: "test1")
      product = Product.new(name: "item", price: nil, quantity: 5, category: cat2)
      expect(product).to_not be_valid
    end

    it "is not valid if quantity is not an integer, or not present" do
      cat3 = Category.new(name: "test1")
      product = Product.new(name: "item", price: 100, quantity: nil, category: cat3)
      expect(product).to_not be_valid
    end

     it "is not valid if category in not present" do
      product = Product.new(name: "item", price: 1000, quantity: 2, category: nil)
      expect(product).to_not be_valid

    end

  end
end

