class Job < ApplicationRecord
  #  has_paper_trail
  
  belongs_to :user
  belongs_to :role
end
