class StepsController < ApplicationController

  def index
    @steps = StepRepository.all
  end

  def new
  end

  def create
    # STORE NEW STEP

    ### This API has to be updated !!!!!  Use the Repository instead
    Step.new(name: params[:name], position: params[:position]).save

    redirect_to steps_path
  end


  def edit
    @step = Step.find(params[:id])
  end

  def update
    ids = StepRepository.new(params[:originator_id]).last_version.flow_versions.map(&:id)

    p ids

    Step.new(originator_id: params[:originator_id], name: params[:name], position: params[:position], flow_version_ids: ids).save

    redirect_to steps_path
  end
end
