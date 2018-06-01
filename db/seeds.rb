# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chart_counts = ['5', '10', '50', '100']
query_counts = []
i = 0
c = ""
20.times do
  c = chart_counts[rand(4)]
  genre = Faker::Music.instrument
  title = "Top #{c} #{genre} Hits"
  Chart.create(title: title)
  query_counts << c.to_i
end

20.times do
  name = Faker::Science.scientist
  genre = Faker::Pokemon.move + ' Music'
  Artist.create(name: name, genre: genre)
end

q_count_i = 0
i = 1

Chart.all.each do
  query_counts[q_count_i].times do
    m = Faker::Food.measurement
    f = Faker::Food.spice
    title = m + " of " + f
    chart_id = i
    length = rand(20).to_f
    artist_id = rand(20) + 1
    Song.create(title: title, length: length, artist_id: artist_id, chart_id: chart_id)
  end
  i += 1
  q_count_i += 1
end
