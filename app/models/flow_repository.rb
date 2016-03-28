class FlowRepository
  attr_reader :versions

  def self.all
    current_versions = FlowVersion.find_by_sql " SELECT f1.*
                              FROM flow_versions f1 LEFT JOIN flow_versions f2
                              ON (f1.originator_id = f2.originator_id AND f1.id < f2.id)
                              WHERE f2.id IS NULL"
    current_versions.map {|v| Flow.new(v.attributes.symbolize_keys.except!(:id))}
  end

  #def self.all(state)
  #  FlowVersion.find_by_sql " SELECT f1.*
  #                            FROM flow_versions f1 LEFT JOIN flow_versions f2
  #                            ON (f1.originator_id = f2.originator_id AND f1.id < f2.id)
  #                            WHERE f2.id IS NULL AND f1.state = '#{state}'"
  #end

#SELECT * FROM (
#  SELECT *
#  FROM flow_versions
#  GROUP BY originator_id )
#WHERE state = 'approved'




  def initialize(originator_id)
    @versions = FlowVersion.all.where(originator_id: originator_id).order(:created_at).to_a # HASH
    @version_number = @versions.count
  end

  def add(version)
    @versions[@version_number] = FlowVersion.store(version)
    @version_number += 1
  end

  def version(number)
    @versions[number]
  end

  def versions
    @versions
  end

  def last_version
    @versions.last
  end
end
