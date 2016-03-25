class Box < ApplicationRecord
  belongs_to :flow_version
  belongs_to :step_version
end
