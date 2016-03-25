class StepVersion < ApplicationRecord

  def self.store(step)
    create(step.attributes)
  end
end
