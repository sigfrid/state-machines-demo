module QM
  class Event < ApplicationRecord
    #has_many :transitions, class_name: 'EventStateTransition'
    #belongs_to :flow
    #has_many :cicci, class_name: Tag

    state_machine :state, initial: :saved do
      audit_trail

      event :edit do
        transition [:saved, :edited] => :edited
      end

      event :hide do
        transition [:saved, :edited] => :hidden
      end
    end
  end
end
