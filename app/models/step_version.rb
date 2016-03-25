class StepVersion < ApplicationRecord
  has_many :boxes
  has_many :flow_versions, through: :boxes

  def self.store(step)
    create(step.attributes)
  end
end
