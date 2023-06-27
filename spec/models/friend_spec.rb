require 'rails_helper'

# friend = Friend.create(
#         name: 'Felix',
#         species: 'Tiger',
#         age: 2,
#         personality: 'quiet',
#         size: 'large',
#         diet: 'meat',
#         activities: 'Long naps on the couch, and a warm fire.',
#         img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
#       )
      
RSpec.describe Friend, type: :model do
  it "should validate name" do
    friend = Friend.create(
        species: 'Tiger',
        age: 2,
        personality: 'quiet',
        size: 'large',
        diet: 'meat',
        activities: 'Long naps on the couch, and a warm fire.',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
    expect(friend.errors[:name]).to_not be_empty
  end
  
  it "should validate age" do
    friend = Friend.create(
        name: 'Felix',
        species: 'Tiger',
        personality: 'quiet',
        size: 'large',
        diet: 'meat',
        activities: 'Long naps on the couch, and a warm fire.',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
    expect(friend.errors[:age]).to_not be_empty
  end

  it "should validate size" do
    friend = Friend.create(
        name: 'Felix',
        species: 'Tiger',
        age: 2,
        personality: 'quiet',
        diet: 'meat',
        activities: 'Long naps on the couch, and a warm fire.',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
    expect(friend.errors[:size]).to_not be_empty
  end

  it "should validate diet" do
    friend = Friend.create(
        name: 'Felix',
        species: 'Tiger',
        age: 2,
        personality: 'quiet',
        size: 'large',
        activities: 'Long naps on the couch, and a warm fire.',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
    expect(friend.errors[:diet]).to_not be_empty
  end

  it "should validate activities" do
    friend = Friend.create(
        name: 'Felix',
        species: 'Tiger',
        age: 2,
        personality: 'quiet',
        size: 'large',
        diet: 'meat',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
    expect(friend.errors[:activities]).to_not be_empty
  end

  it "should validate personality" do
    friend = Friend.create(
        name: 'Felix',
        species: 'Tiger',
        age: 2,
        size: 'large',
        diet: 'meat',
        activities: 'Long naps on the couch, and a warm fire.',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
    expect(friend.errors[:personality]).to_not be_empty
  end

  it "should validate img" do
    friend = Friend.create(
        name: 'Felix',
        species: 'Tiger',
        age: 2,
        personality: 'quiet',
        size: 'large',
        diet: 'meat',
        activities: 'Long naps on the couch, and a warm fire.',
      )
    expect(friend.errors[:img]).to_not be_empty
  end

  it "should validate species" do
    friend = Friend.create(
        name: 'Felix',
        age: 2,
        personality: 'quiet',
        size: 'large',
        diet: 'meat',
        activities: 'Long naps on the couch, and a warm fire.',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
    expect(friend.errors[:species]).to_not be_empty
  end

  it "activities should be at least 10 characters" do
    friend = Friend.create(
        name: 'Felix',
        species: 'Tiger',
        age: 2,
        personality: 'quiet',
        size: 'large',
        diet: 'meat',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
    expect(friend.errors[:activities]).to_not be_empty
  end


end
