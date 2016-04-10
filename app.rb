require_relative "routes/init"

ELSC = Rack::URLMap.new(
  "/users"    => UserRouter,
  "/images"   => ImageRouter,
  "/signup"   => SignupRouter,
  "/session/" => SessionRouter,
  "/"         => MainRouter,
)

