class FlowVersionsController < ApplicationController

  def index
    @flow_versions = FlowRepository.new('pvxqcyogncfpyaavxrwmajmmxllfauqyuoapyikyvxsrolvems').versions
  end

end
