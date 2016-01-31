require 'sinatra/base'
require 'tilt/erb'

class ELSWC < Sinatra::Application

  get '/' do
    erb :index, locals: { title: 'Welcome to ELSWC' }
  end

  get '/about' do
    erb :about, locals: { title: 'About the ELSW' }
  end

  get '/people' do
    erb :people, locals: { title: 'Meet the workers!' }
  end

  get '/terms-and-conditions' do
    erb :terms_and_conditions, locals: {
      title: 'What you get from us and what we get from you'
    }
  end

  get '/join' do
    erb :join, locals: { title: 'Sign up (client)' }
  end

  get '/contact' do
    erb :contact, locals: { title: 'Get in touch' }
  end

  get '/profile/:name' do
    name = params[:name]
    erb :profile, locals: { title: "Hello #{name.capitalize}" }
  end

end
