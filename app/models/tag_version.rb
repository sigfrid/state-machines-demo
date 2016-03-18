class TagVersion < PaperTrail::Version
  self.table_name = :tag_versions
  #self.sequence_name = :tag_versions_id_seq
end
