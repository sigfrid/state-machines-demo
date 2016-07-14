# t.string :name
# t.integer :position

class Step
  attr_accessor :name, :position, :state



# CREATED_AT IS WRONG
  def initialize(originator_id: SecureRandom.uuid, name:, position:, state: 'created', flow_version_ids: nil)
    @originator_id = originator_id
    @name = name
    @position = position
    @state = state
    @flow_version_ids = flow_version_ids
  end

  def id
    @originator_id
  end

  #def self.create
  #  #StepVersion.store(self)
  #  StepRepository.new.add(self)
  #end

  def save
    StepRepository.new(@originator_id).add(self)
    #StepVersion.store(self)
  end


  def attributes
    instance_variables.each_with_object(Hash.new) do |ivar, attrs|
      attrs[ivar.to_s.gsub(/^@/, '').to_sym] = instance_variable_get(ivar)
    end
  end

  def associate_flows(objects)
    @flow_version_ids = Array(objects).map{|f| FlowRepository.new(f.id).last_version.id}  #current_version
  end

  def flows
    current_version = StepRepository.new(@originator_id).last_version
    current_version.flow_versions.map { |fv| Flow.new(fv.attributes.symbolize_keys.except!(:id)) }
  end


  def event
    state_machine = StepStateMachine.new
    state_machine.target(self)
    state_machine
  end

  #def method_missing(sym, *args, &block)
  #  current_version = StepRepository.new(id).last
  #  current_version.send sym, *args, &block
  #end
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
