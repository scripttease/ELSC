require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET show' do
    it 'returns a success status' do
      get :show
      expect(response).to have_http_status(:ok)
    end

    it 'renders the view for the homepage' do
      get :show
      expect(response).to render_template(:home_page)
    end
  end
end
