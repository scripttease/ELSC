require 'sinatra'

get '/' do
  erb(:index)
end
get '/about' do
  'All about world!'
end
get '/profile/:name' do
  name = params[:name]
  "Hello #{name.capitalize}"
end

