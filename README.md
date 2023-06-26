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