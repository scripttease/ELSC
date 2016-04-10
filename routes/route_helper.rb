require_relative "base_router"
require_relative "../app"

class Router < Sinatra::Base
  ROUTERS = {
    "/users" => UserRouter,
    "images" => ImageRouter,
    "/signup" => SignupRouter,
    "/session/" => SessionRouter,
    "/" => StaticRouter
  };

  helpers do
    array = []
    binding.pry
    array.push(ROUTERS)
    @routers = array[0]["/users"]
  end
  
  # helpers do
    # Router::ROUTERS.each do |path, router|
     #  name = name_from_router(router)
      # def #{name}_new_path
       #  path + "/new"
      # end
    # end
   # end
end
