class FlowVersion < ApplicationRecord
  has_many :boxes
  has_many :step_versions, through: :boxes

  before_create :generate_random_id



  def self.store(flow)
    create(flow.attributes)
  end


def current_step_versions
  StepVersion.find_by_sql "SELECT * from step_versions
                            WHERE id IN
                            (SELECT step_version_id FROM boxes
                            WHERE flow_version_id = #{id} )
                            GROUP BY originator_id"
  end


   private
 def generate_random_id
   #self.id = SecureRandom.uuid
 end
end
