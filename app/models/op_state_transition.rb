class OpStateTransition < ApplicationRecord
  belongs_to :op

  has_many :friendships
  has_many :cases, through: :friendships, source: 'case_state_transition'
end
