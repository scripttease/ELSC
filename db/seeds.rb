User.create!(name: "Alice", slug: "alice")
louis = User.create!(name: "Louis", slug: "louis")

Image.create!(
  image_url: "/images/image1.jpg",
  comment: "test",
  user: louis,
)
