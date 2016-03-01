User.create!(
  username: "alice", 
  display_name: "Alice", 
  password: "password",
)
louis = User.create!(
  username: "louis", 
  display_name: "Louis", 
  password: "password",
)

Image.create!(
  image_url: "/images/image1.jpg",
  comment: "test",
  user: louis,
)
