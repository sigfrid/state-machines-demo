class StepVersion < ApplicationRecord
  has_many :boxes
  has_many :flow_versions, through: :boxes

  def self.store(step)
    create(step.attributes)
  end

  def self.current
    find_by_sql " SELECT s1.*
                              FROM step_versions s1 LEFT JOIN step_versions s2
                              ON (s1.originator_id = s2.originator_id AND s1.id < s2.id)
                              WHERE s2.id IS NULL"
  end
end
