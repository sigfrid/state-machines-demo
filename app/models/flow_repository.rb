class FlowRepository
  attr_reader :versions

  def self.all
    current_versions = FlowVersion.find_by_sql "SELECT f1.*
                                                FROM flow_versions f1
                                                LEFT JOIN flow_versions f2
                                                ON (f1.originator_id = f2.originator_id
                                                AND f1.id < f2.id)
                                                WHERE f2.id IS NULL"

    current_versions.map { |current_version| flow_from_version(current_version) }
  end

  def self.find(originator_id)
    current_version = FlowVersion.where(originator_id: originator_id).order(created_at: :desc).take(1)
    flow_from_version(current_version)
  end

  def self.add(version)
    FlowVersion.store(version)
  end

  def self.versions_of(originator_id)
    new(originator_id)
  end

  def initialize(originator_id)
    @versions = FlowVersion.where(originator_id: originator_id)
    .order(:created_at)
    .to_a.map.with_index(1) { |version, number| [number, version] }.to_h
  end

  def count
    @versions.count
  end

  def version(number)
    @versions[number]
  end

private

  def flow_from_version(version)
    Flow.new(coerced_attributes(version))
  end

  def coerced_attributes(version)
    version.attributes.symbolize_keys.except!(:id)
  end
end
