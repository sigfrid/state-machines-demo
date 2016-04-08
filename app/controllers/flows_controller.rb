class FlowsController < ApplicationController

  def index
    @flows = Flow.all #FlowRepository.current_flows
  end

  def new
    @flow = Flow.new
    @step_versions = [] #StepVersion.current
  end

  def create
    flow = Flow.create(flow_params)

    step_version_ids = flow.step_ids.each_with_object([]) do |step_id, version_ids|
      version_ids << Step.find(step_id).latest_version.id
    end
    version_attributes = flow.versionable_attributes.merge("step_version_ids": step_version_ids)

    FlowVersion.create(version_attributes)

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

private

  def flow_params
    params[:flow][:step_ids].reject!(&:blank?)
    params.require(:flow).permit(:name, :color, :size, step_ids: [])
  end
end
