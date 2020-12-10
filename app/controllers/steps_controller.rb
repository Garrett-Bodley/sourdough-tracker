class StepsController < ApplicationController

  # GET: /steps
  get "/steps" do
    erb :"/steps/index.html"
  end

  # GET: /steps/new
  get "/steps/new" do
    erb :"/steps/new.html"
  end

  # POST: /steps
  post "/steps" do
    redirect "/steps"
  end

  # GET: /steps/5
  get "/steps/:id" do
    erb :"/steps/show.html"
  end

  # GET: /steps/5/edit
  get "/steps/:id/edit" do
    erb :"/steps/edit.html"
  end

  # PATCH: /steps/5
  patch "/steps/:id" do
    redirect "/steps/:id"
  end

  # DELETE: /steps/5/delete
  delete "/steps/:id/delete" do
    redirect "/steps"
  end
end
