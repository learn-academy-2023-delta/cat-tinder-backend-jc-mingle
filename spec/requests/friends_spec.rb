require 'rails_helper'

RSpec.describe "Friends", type: :request do
  describe "GET /index" do
    it "gets a list of friends" do
      Friend.create(
        name: 'Felix',
        species: 'Tiger',
        age: 2,
        personality: 'quiet',
        size: 11,
        activities: 'Long naps on the couch, and a warm fire.',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )

      # Make a request
      get '/friends'
      friend = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(friend.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a friend" do
      friend_params = {
        friend: {
          name: 'Felix',
          species: 'Tiger',
          age: 2,
          personality: 'quiet',
          size: 10,
          activities: 'Long naps on the couch, and a warm fire.',
          img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
        }
      }
      
      post '/friends', params: friend_params
      friend = Friend.first
      expect(response).to have_http_status(200)
      expect(friend.name).to eq 'Felix'
    end
  end

  describe "PATCH /update" do
    it "updates a friend" do
      Friend.create(
        name: 'Felix',
        species: 'Tiger',
        age: 1,
        personality: 'quiet',
        size: 10,
        activities: 'Long naps on the couch, and a warm fire.',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
      friend_params = {
        friend: {
          name: 'Felix',
          species: 'Tiger',
          age: 3,
          personality: 'quiet',
          size: 12,
          activities: 'Long naps on the couch, and a warm fire.',
          img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
        }
      }
    
      friend = Friend.first  
      patch "/friends/#{friend.id}", params: friend_params
      updated_friend = Friend.first
      expect(response).to have_http_status(200)
      expect(updated_friend.age).to eq 3
    end
  end

  describe "DElETE /destroy" do
    it "deletes a friend" do
      Friend.create(
        name: 'Felix',
        species: 'Tiger',
        age: 2,
        personality: 'quiet',
        size: 8,
        activities: 'Long naps on the couch, and a warm fire.',
        img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
      )
      friend=Friend.first
      delete "/friends/#{friend.id}"
      friends = Friend.all
      expect(response).to have_http_status(200)
      expect(friends.length).to eq 0
    end
  end
#####################################################
#API Validations
  describe "cannot create a friend without valid attributes" do
    it "doesn't create a friend with activities shorter than 10 characters" do
      friend_params = {
        friend: {
          name: 'Someone',
          species: 'Tiger',
          age: 2,
          personality: 'quiet',
          size: 10,
          activities: 'Long',
          img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
        }
      }
      #sends request to the server adn passes friend_params
      post '/friends', params: friend_params
      #expects an error if friend_params is shorter than 10 characters
      expect(response.status).to eq 422
      #these two lines are only needed if you need a more specific error response
      json = JSON.parse(response.body)
      expect(json['activities']).to include "is too short (minimum is 10 characters)"
    end
  end

    describe "cannot update a friend without valid attributes" do
    it "cannot update a friend without a name" do
      friend_params = {
        friend: {
          name: 'Felix',
          species: 'Tiger',
          age: 2,
          personality: 'quiet',
          size: 10,
          activities: 'Long naps on the couch, and a warm fire.',
          img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
        }
      }
      post '/friends', params: friend_params
      friend = Friend.first

      updated_friend_params = {
        friend: {
          name: '',
          species: 'Tiger',
          age: 2,
          personality: 'quiet',
          size: 10,
          activities: 'Long naps on the couch, and a warm fire.',
          img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
        }
      }
      
      patch "/friends/#{friend.id}", params: updated_friend_params

      json = JSON.parse(response.body)
      expect(response).to have_http_status 422
      expect(json['name']).to include "can't be blank"
    end
  end
end
