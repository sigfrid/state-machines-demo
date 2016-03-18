class FlowVersion < PaperTrail::Version
  self.table_name = :flow_versions
  #self.sequence_name = :flow_versions_id_seq
end
