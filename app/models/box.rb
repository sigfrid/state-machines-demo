class Box < ApplicationRecord
  belongs_to :flow_version
  belongs_to :tag_version
end
