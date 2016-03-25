# t.string :name
# t.string :color
# t.integer :size

class Flow
  attr_accessor :name, :color, :size

  def self.find(id)
    xattributes = FlowRepository.new(id).last.attributes.symbolize_keys.except!(:id)
    Flow.new(xattributes)
  end


# CREATED_AT IS WRONG
  def initialize(originator_id: (0...50).map { ('a'..'z').to_a[rand(26)] }.join, name:, color: nil, size:, created_at: nil)
    @originator_id = originator_id
    @name = name
    @color = color
    @size = size
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

  def versions
    FlowRepository.new(@originator_id).versions
  end


  def attributes
    instance_variables.each_with_object(Hash.new) do |ivar, attrs|
      attrs[ivar.to_s.gsub(/^@/, '').to_sym] = instance_variable_get(ivar)
    end
  end
end
