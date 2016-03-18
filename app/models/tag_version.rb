class TagVersion < PaperTrail::Version
  self.table_name = :tag_versions
  #self.sequence_name = :tag_versions_id_seq

  has_many :boxes
  has_many :flows, through: :boxes, source: :flow_version
end
