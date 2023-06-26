require 'rails_helper'

RSpec.describe Friend, type: :model do
  it "should validate name" do
    friends = Friend.create
    expect(friends.errors[:name]).to_not be_empty
  end
  
  it "should validate age" do
    friends = Friend.create
    expect(friends.errors[:age]).to_not be_empty
  end

  it "should validate size" do
    friends = Friend.create
    expect(friends.errors[:size]).to_not be_empty
  end

  it "should validate diet" do
    friends = Friend.create
    expect(friends.errors[:diet]).to_not be_empty
  end

  it "should validate activities" do
    friends = Friend.create
    expect(friends.errors[:activities]).to_not be_empty
  end

  it "should validate personality" do
    friends = Friend.create
    expect(friends.errors[:personality]).to_not be_empty
  end

  it "should validate img" do
    friends = Friend.create
    expect(friends.errors[:img]).to_not be_empty
  end

  it "should validate species" do
    friends = Friend.create
    expect(friends.errors[:species]).to_not be_empty
  end

  it "activities should be at least 10 characters" do
    friends = Friend.create
    expect(friends.errors[:activities]).to_not be_empty
  end


end
