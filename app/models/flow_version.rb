class FlowVersion < ApplicationRecord
  has_many :boxes
  has_many :step_versions, through: :boxes

  def self.store(flow)
    create(flow.attributes)
  end
end
