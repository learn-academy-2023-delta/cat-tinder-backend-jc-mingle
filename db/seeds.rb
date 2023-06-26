# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

friends = [
  {
    name: 'Felix',
    species: 'Tiger',
    age: 2,
    personality: 'quiet',
    size: 'large',
    diet: 'meat',
    activities: 'Long naps on the couch, and a warm fire.',
    img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.worldwildlife.org%2Fspecies%2Ftiger&psig=AOvVaw3K1CpiMMkUwHoiC_DGB-hU&ust=1687890947546000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJCK0fXJ4f8CFQAAAAAdAAAAABAD'
  },
  {
    name: 'Roudy',
    species: 'Anteater',
    age: 4,
    personality: 'Rambunctious',
    size: 'medium',
    diet: 'ants',
    activities: 'Licking things.',
    img: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flickr.com%2Fphotos%2Fnationalzoo%2F5333631633&psig=AOvVaw2EbrVYOOxOcW1-rqbW5KJJ&ust=1687890900471000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCOjDj-HJ4f8CFQAAAAAdAAAAABAD'
  },
  {
    name: 'Nari',
    species: 'Cat',
    age: 9,
    personality: 'Standoff-ish',
    size: 'small',
    diet: 'tuna',
    activities: 'Likes to cuddle quiet dogs.',
    img: 'https://static.scientificamerican.com/sciam/cache/file/F766A67E-A8AA-4C90-A929C9AC67075D4B_source.jpg?w=390&h=520&8027B6C0-FF94-49F8-B44F07788CEF1BE1'
  },
  
]

friends.each do |each_friend|
  Friend.create each_friend
  puts "creating friend #{each_friend}"
end