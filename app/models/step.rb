# t.string :name
# t.integer :position

class Step < ApplicationRecord

#  def associate_flows(objects)
#    @flow_version_ids = Array(objects).map{|f| FlowRepository.new(f.id).last_version.id}  #current_version
#  end

#  def flows
#    current_version = StepRepository.new(@originator_id).last_version
#    current_version.flow_versions.map { |fv| Flow.new(fv.attributes.symbolize_keys.except!(:id)) }
#  end


  # THIS MAY BE IN A REPOSITORY OBJECT
  def latest_version
    StepVersion.where(step_id: id).last(1).first
  end

  def event
    state_machine = StepStateMachine.new
    state_machine.target(self)
    state_machine
  end
end


class StepStateMachine < FiniteMachine::Definition
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
