# t.string :name
# t.string :color
# t.integer :size

class Step
  attr_accessor :name, :position

  def self.find(id)
    xattributes = StepRepository.new(id).last.attributes.symbolize_keys.except!(:id)
    Step.new(xattributes)
  end


# CREATED_AT IS WRONG
  def initialize(originator_id: (0...50).map { ('a'..'z').to_a[rand(26)] }.join, name:, position:, created_at: nil)
    @originator_id = originator_id
    @name = name
    @position = position
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
end
