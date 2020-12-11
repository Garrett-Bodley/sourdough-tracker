class StepsController < ApplicationController

  # GET: /bakes/4/steps/new
  get "/bakes/:id/steps/new" do
    set_user
    set_bake
    erb :"/steps/new.html"
  end

  # POST: /bakes/4/steps
  post "/bakes/:id/steps" do
    @step = Step.create(params[:step])
    redirect "/bakes/#{@step.bake.id}"
  end

  # GET: /bakes/4/steps/7
  get "/bakes/:id/steps/:step_id" do
    set_user
    set_bake
    set_step
    erb :"/steps/show.html"
  end

  # GET: /steps/5/edit
  get "/bakes/:id/steps/:step_id/edit" do
    set_user
    set_bake
    set_step
    erb :"/steps/edit.html"
  end

  # PATCH: /bakes/4/steps/5
  patch "/bakes/:id/steps/:step_id" do
    set_step.update(params[:step])
    redirect "/bakes/#{set_bake.id}/steps/#{@step.id}"
  end

  # DELETE: /steps/5/delete
  delete "/bakes/:id/steps/:step_id" do
    set_step.destroy
    redirect "/bakes/#{set_bake.id}"
  end

  private

  def set_bake
    @bake = Bake.find(params[:id])
  end

  def set_step
    @step = Step.find(params[:step_id])
  end

end
