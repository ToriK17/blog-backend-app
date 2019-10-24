require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before do 
    user = User.create(name: "test", email: "tt@gmail.com", password: "password")
    User.create(name: "test1", email: "tt1@gmail.com", password: "password")
    Post.create(title: "t1", body: "t2", image: "t3", user_id: user.id)  
    Post.create(title: "t11", body: "t22", image: "t33", user_id: user.id)
    Post.create(title: "t111", body: "t222", image: "t333", user_id: user.id)
  end   

  describe "GET /posts" do
    it "should return a list of all posts" do
      get "/api/posts"
      posts = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(posts.length).to eq(3)
    end
  end

  describe "GET /posts/:id" do
    it "should return a single post" do
      post_id = Post.first.id 
      get "/api/posts/#{post_id}"
      post = JSON.parse(response.body)
      expect(post["title"]).to eq("t1")
    end     
  end  

  describe "POST /posts" do 
    it "should create a post" do 
      jwt = JWT.encode({user: User.first.id}, "random",'HS256')
      post "/api/posts", 
      params: {
        title: "temp title",
        body: "temp body",
        image: "img url"
      },  
      headers: {
        Authorization: "Bearer #{jwt}"
      }
  
      post = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(post["title"]).to eq("temp title")
    end
    it "returns an unauthorized ststus without a jwt" do 
      post "/api/posts",
      params: {},
      headers: {}
      expect(response).to have_http_status(:unauthorized)
    end 
    it "returns an error status if jwt is invalid" do
      
      post "/api/posts", 
      params: {}, 
      headers: {
        Authorization: " "    
      }    

      expect(response).to have_http_status(401)
    end   
  end  

  describe "PATCH /posts/:id" do 
    it "updates a post" do
      post_id = Post.first.id
      jwt = JWT.encode({user: User.first.id}, "random",'HS256')

      patch "/api/posts/#{post_id}", 
      params: {
        title: "New Title"
      },
      headers: {
        Authorization: "Bearer #{jwt}"
      }
      posts = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(posts["title"]).to eq("New Title")
    end 
  end  

  describe "DELETE /posts/:id" do 
    it "deletes a post" do 
      post_id = Post.first.id
      jwt = JWT.encode({user: User.first.id}, "random",'HS256')
      delete "/api/posts/#{post_id}",
      headers: {
        Authorization: "Bearer #{jwt}"
      }
      expect(response).to have_http_status(200)
      expect(Post.count).to eq(2) 
    end 
  end       
end
