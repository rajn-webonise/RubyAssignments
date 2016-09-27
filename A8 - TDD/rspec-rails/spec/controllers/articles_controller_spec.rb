require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do

    before(:each) do
      articleA = Article.create!(title: "A Test Title", text: "Lots of text body!")
      get :show, id: 1
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("show")
    end
  end

  describe "GET #create" do

    it "adds a valid article" do
      expect{
        post :create, article: {title: "A Test Title", text: "Lots of text body!"}
      }.to change(Article,:count).by(1)
    end

    it "re-renders /new for an invalid article" do
      expect{
        post :create, article: {title: "A", text: "Lots of text body!"}
      }.to change(Article,:count).by(0)
      expect(response).to render_template(:new)
    end

  end

end
