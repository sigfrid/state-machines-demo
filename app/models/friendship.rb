class Friendship < ApplicationRecord
  belongs_to :case_state_transition
  belongs_to :op_state_transition
end
