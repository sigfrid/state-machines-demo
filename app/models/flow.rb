# t.string :name
# t.string :color
# t.integer :size

class Flow < ApplicationRecord
  attr_accessor :step_ids

  def steps
    ids = latest_version.step_versions.map {|v| v.step_id}
    Step.where(id: ids)
  end

  #def step_versions
  #  current_version = FlowRepository.new(@originator_id).current_version
  #  current_version.step_versions
  #end


def latest_version
  FlowVersion.where(flow_id: id).last(1).first
end

#def attributes
#  x = super
#  x.except!("id", "created_at", "updated_at")
#end

def versionable_attributes
  attributes.except!("id", "created_at", "updated_at").merge({"flow_id": id})
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
