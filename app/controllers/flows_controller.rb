class FlowsController < ApplicationController

  def index
    @flows = FlowRepository.current_flows
  end

  def new
    @step_versions = StepVersion.current
  end

  def create
    flow = Flow.new(name: params[:name], color: params[:color], size: params[:size], step_version_ids: params[:step_version_ids])
    FlowRepository.add(flow)

    redirect_to flows_path
  end

  def edit
    @flow = FlowRepository.current(params[:id])
    @step_versions = StepVersion.current
  end

  def update
    flow = Flow.new(originator_id: params[:originator_id], name: params[:name], color: params[:color], size: params[:size], step_version_ids: params[:step_version_ids])
    FlowRepository.add(flow)

    redirect_to flows_path
  end
end
