require 'fog/core'
require 'fog/xml'
require 'fog/json'
require 'opennebula'

require File.expand_path('../opennebula/version', __FILE__)

module Fog
  module OpenNebula
    extend Fog::Provider

    module Compute
      autoload :OpenNebula, File.expand_path('../opennebula/compute', __FILE__)
    end

    service(:compute, 'Compute')
  end
end
