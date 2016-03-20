class ELSWC < Sinatra::Application

  get '/images' do
    @images = Image.all
    @title = "Welcome to ELSWC"
    slim :"image/index"
  end
 
end
