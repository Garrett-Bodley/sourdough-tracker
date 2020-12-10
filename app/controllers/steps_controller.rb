class StepsController < ApplicationController

  # GET: /steps
  get "/steps" do
    erb :"/steps/index.html"
  end

  # GET: /steps/new
  get "/bakes/:id/steps/new" do
    set_bake
    erb :"/steps/new.html"
  end

  # POST: /steps
  post "/steps" do
    @step = Step.create(params[:step])
    redirect "/bakes/#{@step.bake.id}"
  end

  # GET: /steps/5
  get "/bakes/:id/steps/:step_id" do
    set_bake
    set_step
    erb :"/steps/show.html"
  end

  # GET: /steps/5/edit
  get "/bakes/:id/steps/:step_id/edit" do
    set_bake
    set_step
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

  private

  def set_bake
    @bake = Bake.find(params[:id])
  end

  def set_step
    @step = Step.find(params[:step_id])
  end

end
