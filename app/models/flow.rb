class Flow < ApplicationRecord
  has_paper_trail class_name: 'FlowVersion'


end
