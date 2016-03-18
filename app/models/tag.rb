class Tag < ApplicationRecord
  has_paper_trail class_name: 'TagVersion'
end
