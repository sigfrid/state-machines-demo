# t.string :name
# t.string :color
# t.integer :size

class Flow
  include ActiveModel::Model

  attr_accessor :name
  attr_accessor :color
  attr_accessor :size
  attr_accessor :state
  attr_accessor :step_version_ids

  def initialize(attributes={})
    super
    @originator_id ||= (0...50).map { ('a'..'z').to_a[rand(26)] }.join
    @state ||= 'created'
  end

  def id
    @originator_id
  end


  def current_steps
    current_version = FlowRepository.new(@originator_id).current_version
    current_version.current_step_versions.map {|v| Step.new(v.attributes.symbolize_keys.except!(:id))}
  end

  def step_versions
    current_version = FlowRepository.new(@originator_id).current_version
    current_version.step_versions
  end

  def event
    state_machine = FlowStateMachine.new
    state_machine.target(self)
    state_machine
  end
end


class FlowStateMachine < FiniteMachine::Definition
  initial :created

  alias_target :step

  events {
    event :approve, :created => :approved
    event :implement, :approved => :implemented
    event :verify, :implemented => :verified
  }

  callbacks {
    on_transition do |event|
      step.state = event.to.to_s
    end
  }

  handlers {
    handle FiniteMachine::InvalidStateError do |exception|
      p "INVALID !!!! #{exception}"
    end
  }
end
