# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

friends = [
  {
    name: 'Ruby Mable',
    species: 'Red Maple',
    age: 14,
    personality: "I'm calm and love quiet winter nights when you can see the stars",
    size: 40,
    activities: 'Playing in the snow',
    img: 'https://images.unsplash.com/photo-1520262494112-9fe481d36ec3?ixlib=rb-4.0.3&ixid=M3wxM[…]dlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80'
  },
  {
    name: 'Deb Shoch',
    species: 'Red Oak',
    age: 4,
    personality: "I'm Rambunctious country tree and love to dye my hair.",
    size: 12,
    activities: 'Picnics, afternoon naps',
    img: 'https://images.unsplash.com/photo-1604820849194-837928614a4a?ixlib=rb-4.0.3&ixid=M3wxM[…]dlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80'
  },
  {
    name: 'Ruger Shyne',
    species: 'Sugar Pine',
    age: 9,
    personality: "I'm calm and stoic. I love to be near water",
    size: 16,
    activities: 'Bird watching',
    img: 'https://images.unsplash.com/photo-1421790500381-fc9b5996f343?ixlib=rb-4.0.3&ixid=M3wxM[…]WdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'
  },
  {
    name: 'Jenny Pier',
    species: 'Juniper',
    age: 15,
    personality: "I live on the edge and love a good adrenaline rush",
    size: 14,
    activities: 'Bird watching',
    img: 'https://images.unsplash.com/photo-1559313506-55cc3d498cba?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1335&q=80'
  },
  {
    name: "Saul D'Stiefless",
    species: 'Bald Cyprus',
    age: 60,
    personality: "I love to relax and dip my toes in the water, with a gentle breeze",
    size: 70,
    activities: 'Drinking',
    img: 'https://images.unsplash.com/photo-1502394202744-021cfbb17454?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1283&q=80'
  },
]

friends.each do |each_friend|
  Friend.create each_friend
  puts "creating friend #{each_friend}"
end