class Flow < ApplicationRecord
  has_paper_trail class_name: 'FlowVersion'

  #state_machine :state, initial: :saved do

    #event :edit do
      #transition [:saved, :edited] => :edited
    #end

    #event :hide do
      #transition [:saved, :edited] => :hidden
    #end
  #end
end
