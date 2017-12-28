# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# JSON 파일 watcha.json 파일들에 들어있는 영화 정보를 읽어와서

movies = JSON.parse(File.read('watcha.json'))

# ap Rails.root.to_s
# ap movies["cards"][0]["items"][0]["item"]["directors"][0]["name"]

# Movie.create(
#   title: movies["cards"][0]["items"][0]["item"]["title"],
#   poster: movies["cards"][0]["items"][0]["item"]["poster"]["original"],
#   genre: movies["cards"][0]["items"][0]["item"]["main_genre"],
#   nation: movies["cards"][0]["items"][0]["item"]["nation"],
#   directors: movies["cards"][0]["items"][0]["item"]["directors"][0]["name"]
# )

list = movies["cards"]
# ap list
list.each do |movie|
  # ap movie["items"][0]["item"]["title"]
  Movie.create(
    title: movie["items"][0]["item"]["title"],
    remote_poster_url: movie["items"][0]["item"]["poster"]["original"],
    genre: movie["items"][0]["item"]["main_genre"],
    nation: movie["items"][0]["item"]["nation"],
    directors: movie["items"][0]["item"]["directors"][0]["name"]
  )
end
# 
# User.create(
#   email: "admin@admin.com",
#   password: "123123",
#   password_confirmation: "123123",
#   nickname: "관리자",
#   role: "admin"
# )
#
# User.create(
#   email: "man@man.com",
#   password: "123123",
#   password_confirmation: "123123",
#   nickname: "매니저",
#   role: "manager"
# )
#
# User.create(
#   email: "asd@asd.com",
#   password: "123123",
#   password_confirmation: "123123",
#   nickname: "일반유저",
# )


# Movie.create(
#   title:
#   poster:
#   genre:
#   nation:
#   director:
# )
