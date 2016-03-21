class FlowVersion < PaperTrail::Version
  self.table_name = :flow_versions
  #self.sequence_name = :flow_versions_id_seq

  #has_many :boxes
  #has_many :tags, through: :boxes, source: :tag_version

#  before_save :set_hmt

#  def set_hmt
#    p "----------->!!<----------------"
#    p item.deep_inspect
#  end
end
