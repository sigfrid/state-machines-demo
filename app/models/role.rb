class Role < ApplicationRecord
  has_paper_trail 

  has_many :jobs
  has_many :users, through: :jobs
end
