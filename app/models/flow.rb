# t.string :name
# t.string :color
# t.integer :size

class Flow
  include ActiveModel::Model

  attr_accessor :name, :color, :size, :state, :created_at
  attr_writer :originator_id  # :step_version_ids



  #def defaults
   # @id = SecureRandom.uuid
   # @state =  'created'
  #end

  def id
    @originator_id
  end

  #def created_at
   # Time.now
  #end





  def current_steps
    []
    ##flow = FlowRepository.new(id).current
    ##flow.step_versions.map {|v| Step.new(v.attributes.symbolize_keys.except!(:id))}
  end

  def step_versions
    []
    ##flow = FlowRepository.new(id).current
    ##flow.step_versions
  end

  #def self.create
  #  #FlowVersion.store(self)
  #  FlowRepository.new.add(self)
  #end

  #def save
  #  FlowRepository.new(@originator_id).add(self)
    #FlowVersion.store(self)
  #end


  def attributes
    instance_variables.each_with_object(Hash.new) do |ivar, attrs|
      attrs[ivar.to_s.gsub(/^@/, '').to_sym] = instance_variable_get(ivar)
    end
  end



  #def update_state(state)
   # state = state
   # FlowRepository.new(id).add(self)
  #end



# STATE MACHINE

def event
    flow = self
    FiniteMachine.define do
      target flow

  ###    initial :created
      restore!(target.state.to_sym)


      events {
        event :approve, :created => :approved
        event :implement, :approved => :implemented
        event :verify, :implemented => :verified
      #  event :back,  [:neutral, :one] => :reverse
      }

      callbacks {
        on_transition do |event|
          target.update_state(event.to.to_s)
          #puts "shifted from #{event.from} to #{event.to}"
        end
      }
    end
  end






end
