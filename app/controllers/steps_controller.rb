class StepsController < ApplicationController

  # GET: /bakes/4/steps/new
  get "/bakes/:id/steps/new" do
    get_bake
    erb :"/steps/new.html"
  end

  # POST: /bakes/4/steps
  post "/bakes/:id/steps" do
    @step = Step.create(sanitize_params(params[:step]))
    redirect "/bakes/#{@step.bake_id}"
  end

  # GET: /bakes/4/steps/7
  get "/bakes/:id/steps/:step_id" do
    set_step
    erb :"/steps/show.html"
  end

  # GET: /steps/5/edit
  get "/bakes/:id/steps/:step_id/edit" do
    set_step
    erb :"/steps/edit.html"
  end

  # PATCH: /bakes/4/steps/5
  patch "/bakes/:id/steps/:step_id" do
    set_step.update(sanitize_params(params[:step]))
    redirect "/bakes/#{@step.bake_id}/steps/#{@step.id}"
  end

  # DELETE: /steps/5/delete
  delete "/bakes/:id/steps/:step_id" do
    set_step.destroy
    redirect "/bakes/#{@step.bake_id}"
  end

  private

  def get_bake
    @bake = Bake.find_by(id: params[:id], user_id: set_user.id)
  end

  def set_step
    @step = Step.find_by(id: params[:step_id], bake_id: get_bake.id)
  end

end
