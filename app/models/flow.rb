# t.string :name
# t.string :color
# t.integer :size

class Flow
  attr_accessor :name, :color, :size, :state

  def self.find(id)
    xattributes = FlowRepository.new(id).last_version.attributes.symbolize_keys.except!(:id)
    Flow.new(xattributes)
  end


# CREATED_AT IS WRONG
  def initialize(originator_id: (0...50).map { ('a'..'z').to_a[rand(26)] }.join, name:, color: nil, size:, created_at: nil, state: 'created')
    @originator_id = originator_id
    @name = name
    @color = color
    @size = size
    @state = state
  end

  def id
    @originator_id
  end

  #def self.create
  #  #FlowVersion.store(self)
  #  FlowRepository.new.add(self)
  #end

  def save
    FlowRepository.new(@originator_id).add(self)
    #FlowVersion.store(self)
  end


  def attributes
    instance_variables.each_with_object(Hash.new) do |ivar, attrs|
      attrs[ivar.to_s.gsub(/^@/, '').to_sym] = instance_variable_get(ivar)
    end
  end



  def update_state(state)
    state = state
    save
  end



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
