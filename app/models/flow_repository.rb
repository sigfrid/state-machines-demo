class FlowRepository
  attr_reader :versions

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
