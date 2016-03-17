class Op < ApplicationRecord
  has_many :transitions, class_name: 'OpStateTransition'

  state_machine :state, initial: :saved do
    event :edit do
      transition [:saved, :edited] => :edited
    end

    event :hide do
      transition [:saved, :edited] => :hidden
    end

    event :show do
      transition :hidden => :edited
    end
  end
end
