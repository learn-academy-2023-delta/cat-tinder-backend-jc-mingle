# README

# Friend for a Minute
Goal: create an app where humans can swipe on rescue animals that they'd like to hang out with for a period of time. (afternoon, day etc)

### Animal Stats
- species
- name
- age
- personality
- activities
- food/treats
- size



# Process
set up back-end 
- rails new 'app'
- rails db:create
- bundle add rspec-rails
- rails generate rspec:install
- push repository from command line to github
- rails generate resource <Name> attribute:primitive-type
- check migration file for correctness/completeness
- rails db:migrate
- rspec spec (to test that it's working)
- rails s (check server is working)
- populate seeds file:
  `cats.each do |attributes|
    Cat.create attributes
    puts "creating cat #{attributes}"
  end`
- Friend.all (to check that everything )  


## Endpoints
- add index/create/update/destroy empty methods to the controller.rb file
- use `rails routes` to verify you're using the right syntax when referring to routes
- go to `spec/requests` folder to make tests
- first test is 'get'. 'gets a list of all friends'
  - `psql` gets us into postgres so you can look at your database list.  `\l` to exit 
- set up test and add `-f d` to the end of the command to show more info on the errors
- in `spec/requests/friends_spec.rb` 
  - Make an `index` test


  - rspec spec/requests (should fail)
- add code to index method `friends = Friend.all`
- make a `create` test
```ruby
  describe "POST /create" do
    it "creates a cat" do
      # The params we are going to send with the request
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      # Send the request to the server
      post '/cats', params: cat_params

      # Assure that we get a success back
      expect(response).to have_http_status(200)

      # Look up the cat we expect to be created in the db
      cat = Cat.first

      # Assure that the created cat has the correct attributes
      expect(cat.name).to eq 'Buster'
    end
  end
```

  - fail the `create` test

- back to controller and write the `create` method `friend = Friend.create(friend_params)`, `render...`
 - create private method `def friend_params - params.require(:friend).permit(:name, :img, :diet, :size, :species, :personality, :age, :activities)`

- make a test for `update`
  - make test fail
- add `update` method code



## Validations
API Validations
- Example Models validation:
```Ruby
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
```
- Example requests validation:
```ruby
  describe "cannot create a friend without valid attributes"
    it "doesn't create a friend with activities shorter than 10 characters" do
      friend_params = {
        friend: {
          name: 'Someone',
          species: 'Tiger',
          age: 2,
          personality: 'quiet',
          size: 'large',
          diet: 'meat',
          activities: 'Long',
          img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
        }
      }
      #sends request to the server adn passes friend_params
      post '/friends', params: friend_params
      #expects an error if friend_params is shorter than 10 characters
      expect(response.status).to eq 422
      #tehse two lines are only needed if you need a more specific error response
      json = JSON.parse(response.body)
      expect(json['activities']).to include "is too short (minimum is 10 characters)"
    end
```