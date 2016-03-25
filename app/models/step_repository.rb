class StepRepository
  attr_reader :versions

  def initialize(originator_id)
    @versions = StepVersion.all.where(originator_id: originator_id).order(:created_at).to_a
    @version_number = @versions.count
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

  def last
    @versions.last
  end
end
