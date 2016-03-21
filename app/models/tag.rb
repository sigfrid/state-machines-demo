class Tag < ApplicationRecord
  has_paper_trail class_name: 'TagVersion'

  has_many :boxes
  has_many :flows, through: :boxes
end
