# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
15.times do
  genre = Faker::Music.instrument
  title = "Top #{rand(1000)+100} #{genre} Hits"
  Chart.create(title: title)
end

50.times do
  name = Faker::Science.scientist
  genre = Faker::Pokemon.move
  Artist.create(name: name, genre: genre)
end

i = 1
choice = 0
Artist.all.each do
  rand(20).times do
    title = Faker::BossaNova.song
    artist_id = i
    length = rand(20).to_f
    chart_id = rand(15) + 1
    Song.create(title: title, length: length, artist_id: artist_id, chart_id: chart_id)
  end
  i += 1
end
