class BakesController < ApplicationController

  # GET: /bakes
  get "/bakes" do
    erb :"/bakes/index.html"
  end

  # GET: /bakes/new
  get "/bakes/new" do
    erb :"/bakes/new.html"
  end

  # POST: /bakes
  post "/bakes" do
    redirect "/bakes"
  end

  # GET: /bakes/5
  get "/bakes/:id" do
    erb :"/bakes/show.html"
  end

  # GET: /bakes/5/edit
  get "/bakes/:id/edit" do
    erb :"/bakes/edit.html"
  end

  # PATCH: /bakes/5
  patch "/bakes/:id" do
    redirect "/bakes/:id"
  end

  # DELETE: /bakes/5/delete
  delete "/bakes/:id/delete" do
    redirect "/bakes"
  end
end
