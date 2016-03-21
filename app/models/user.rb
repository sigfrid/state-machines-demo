class User < ApplicationRecord
  has_paper_trail 

  has_many :jobs
  has_many :roles, through: :jobs
end
