class FlowVersion < PaperTrail::Version
  self.table_name = :flow_versions
  #self.sequence_name = :flow_versions_id_seq

  has_many :boxes
  has_many :tags, through: :boxes, source: :tag_version
end
