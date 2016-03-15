module QM
  class EventStateTransition < ApplicationRecord
    belongs_to :event
  end
end
