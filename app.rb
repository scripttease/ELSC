require 'sinatra'

get '/' do
  @title = 'Welcome to ELSWC' 
  erb(:index)
end
get '/about' do
  @title = 'About the ELSW'
  erb(:about)
end
get '/people' do
  @title = 'Meet the workers!'
  erb(:people)
end
get '/terms-and-conditions' do
  @title = 'What you get from us and what we get from you'
  erb(:terms_and_conditions)
end
get '/join' do
  @title = 'Sign up (client)'
  erb(:join)
end
get '/contact' do
  @title = 'Get in touch'
  erb(:contact)
end
get '/profile/:name' do
  name = params[:name]
  @title = '"Hello #{name.capitalize}"'
  #erb(:profile)
end

