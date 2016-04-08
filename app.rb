require_relative "routes/init"

ELSWC = Rack::URLMap.new(
  "/users" => UserRouter,
  "/images" => ImageRouter,
  "/signup" => SignupRouter,
  "/session/" => SessionRouter,
  "/" => MainRouter,
)

