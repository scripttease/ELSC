User.create!(
  username: "alice", 
  display_name: "Alice", 
  email: "alice.dee@mail.com",
  password: "password",
  password_confirmation: "password",
)
louis = User.create!(
  username: "louis", 
  display_name: "Louis", 
  email: "louis.pil@mail.com",
  password: "password",
  password_confirmation: "password",
)

Image.create!(
  image_url: "/images/image1.jpg",
  comment: "test",
  user: louis,
)
