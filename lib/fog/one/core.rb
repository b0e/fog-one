require 'fog/core'

module Fog
  module One
    extend Fog::Provider
    service(:compute, 'Compute')
  end
end
