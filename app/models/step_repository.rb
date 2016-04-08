class StepRepository
  attr_reader :versions

  def self.all
    current_versions = StepVersion.current
    current_versions.map {|v| Step.new(v.attributes.symbolize_keys.except!(:id))}
  end

  def initialize(originator_id)
    @versions = StepVersion.all
                .where(originator_id: originator_id)
                .order(:created_at)
                .to_a.map.with_index(1) { |version, number| [number, version] }.to_h
  #  @version_number = @versions.count
  end

  def add(version)
    @versions[@version_number] = StepVersion.store(version) #version
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
