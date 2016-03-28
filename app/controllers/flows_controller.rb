class FlowsController < ApplicationController

  def index
    @flows = FlowRepository.all
  end

  def new
    @step_versions = StepVersion.current
  end

  def create
    # STORE NEW STEP

    ### This API has to be updated !!!!!  Use the Repository instead
    Flow.new(name: params[:name], color: params[:color], size: params[:size], step_version_ids: params[:step_version_ids]).save

    redirect_to flows_path
  end

  def edit
    @flow = Flow.find(params[:id])
    @step_versions = StepVersion.current
  end

  def update
    Flow.new(originator_id: params[:originator_id], name: params[:name], color: params[:color], size: params[:size], step_version_ids: params[:step_version_ids]).save

    redirect_to flows_path
  end
end
