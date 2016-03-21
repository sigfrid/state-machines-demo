class Flow < ApplicationRecord
  has_paper_trail class_name: 'FlowVersion'

  has_many :boxes
  has_many :tags, through: :boxes

  #state_machine :state, initial: :saved do

    #event :edit do
      #transition [:saved, :edited] => :edited
    #end

    #event :hide do
      #transition [:saved, :edited] => :hidden
    #end
  #end

  #def deep_inspect
  #  [inspect, @my_tags.inspect]
  #end


  #def my_tags=(tags)
  #  @my_tags=Array(tags)
  #end

  #def my_tags
  #  @my_tags
  #end
end
