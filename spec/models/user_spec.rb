require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "is not valid if password don't match" do
      user = User.new(name: "One", email:"one@mail.com", password: "TEST", password_confirmation:"TEST")
      expect(user.password).to eql user.password_confirmation
    end

    it "is not valid if name is absent" do
     user1 = User.new(name: nil, email:"one1@mail.com", password: "TEST", password_confirmation:"TEST")
     expect(user1).to_not be_valid
    end

    it "is not valid if email is absent" do
     user2 = User.new(name: "Joe", email:nil, password: "TEST", password_confirmation:"TEST")
     expect(user2).to_not be_valid
    end

    it "is not valid if password is not unique" do
      user3 = User.new(name: "One", email:"TWO@mail.com", password: "TEST", password_confirmation:"TEST")
      user4 = User.new(name: "One", email:"three@mail.com", password: "TEST", password_confirmation:"TEST")

      expect(user3.email.downcase).to_not eq user4.email.downcase
    end

    it "is not valid if password doesn not meet password length requirements" do
      user5 = User.new(name: "One", email:"five@mail.com", password: "TEST", password_confirmation:"TEST")
      expect(user5).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it "is not valid unless they match" do
    user6 = User.create(name: "One", email:"TWO@mail.com", password: "TESTING", password_confirmation:"TESTING")

    user7 = User.authenticate_with_credentials( "TWO@mail.com", "TESTING" )

    expect(user7).to_not be_nil

    end





  end


end



