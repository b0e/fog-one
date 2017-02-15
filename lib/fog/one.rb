require 'fog/core'
require 'fog/xml'
require 'fog/json'
require 'opennebula'

require File.expand_path('../one/version', __FILE__)

module Fog
  module One
    extend Fog::Provider

    module Compute
      autoload :One, File.expand_path('../one/compute', __FILE__)
    end

    service(:compute, 'Compute')
  end
end
