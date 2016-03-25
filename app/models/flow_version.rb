class FlowVersion < ApplicationRecord

  def self.store(flow)
    create(flow.attributes)
  end
end
