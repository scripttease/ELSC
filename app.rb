require 'sinatra'

get '/' do
  @title = 'Welcome to ELSWC' 
  erb(:index)
end
get '/about' do
  @title = 'About the ELSW'
end
get '/people' do
  "Meet the workers!"
end
get '/TsAndCs' do
  "What you get from us and what we get from you"
end
get '/join' do
  "Sign up (client)"
end
get '/contact' do
  "Get in touch"
end
get '/profile/:name' do
  name = params[:name]
  "Hello #{name.capitalize}"
end

