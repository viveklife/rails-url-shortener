require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe 'GET #index' do
    it 'build a new Url instance to @url' do
      get :index
      expect(assigns(:url)).to be_a_new(Url)
    end

    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    let(:url) { FactoryBot.create(:url) }

    it 'assigns the requested url to @url' do
      @url = url
      get :show, params: { short_url: @url.short_url }
      expect(assigns(:url)).to eq @url
    end
  end

  describe 'GET #short' do
    let(:url) { FactoryBot.create(:url) }

    it 'assigns the requested url to @url' do
      @url = url
      get :short, params: { short_url: @url.short_url }
      expect(assigns(:url)).to eq @url
    end

    it 'has a 302 status code' do
      @url = url
      get :short, params: { short_url: @url.short_url }
      expect(response.status).to eq(302)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      context 'with a new url' do
        it 'creates a new url entry' do
          expect{
            post :create, params: { url: FactoryBot.attributes_for(:url) }
          }.to change(Url, :count).by(1)
        end

        it 'redirects to the url shortened page' do
          post :create, params: { url: FactoryBot.attributes_for(:url) }
          expect(response).to redirect_to url_path(assigns[:url].short_url)
        end
      end

      context 'with a url that is already in the database' do
        let(:persisted_url) { FactoryBot.create(:url, original_url: 'google.com') }

        it 'does not create a new url entry' do
          persisted_url
          expect{
            post :create, params: { url: FactoryBot.attributes_for(:url, original_url: 'www.google.com') }
          }.to_not change(Url, :count)
        end
      end
    end
    context 'with invalid attributes' do
      it 'does not change the url count entry' do
        expect{
          post :create, params: { url: FactoryBot.attributes_for(:url, original_url: nil) }
        }.to_not change(Url, :count)
      end
      it 'does not create a new url entry' do
        post :create, params: { url: FactoryBot.attributes_for(:url, original_url: nil) }
        expect(response).to render_template :new
      end
    end
  end
end
