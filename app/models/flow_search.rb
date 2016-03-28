class FlowSearch

  def self.state(state)
      FlowVersion.find_by_sql " SELECT f1.*
                                FROM flow_versions f1 LEFT JOIN flow_versions f2
                                ON (f1.originator_id = f2.originator_id AND f1.id < f2.id)
                                WHERE f2.id IS NULL AND f1.state = '#{state}'"
  end


# def initialize(hashvalues={})
#@hashvalues = hashvalues
#cend

#  def results
#   FlowVersion.where(sql)
#  end

#  def sql
#    query.to_sql
#  end

#  private

#  def query
#    flow_versions
#    .project('*')
#    .join(same_table)
#    .on(join_condition)
#    .where(where_condition)
# end

 #def same_table
#   flow_versions.alias
# end

# def join_condition
#   [
#     flow_versions[:originator_id].eq(same_table[:originator_id]),
#     flow_versions[:id].lt(same_table[:id])
#   ].reduce(:and)
#end

#  def where_condition(hashvalues = {id: 11})
#    xx = hashvalues.inject([]){ |arrai,(k,v)| arrai << build_clause(k, v)}
#    xx.reduce(:and)
#  end

#  def build_clause(key, value)
#    flow_versions[key].eq(value)
#  end

#  def flow_versions
#   @flow_versions ||= FlowVersion.arel_table
 #end
end
