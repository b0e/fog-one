require 'fog/core/collection'
require 'fog/one/models/compute/interface'

module Fog
  module Compute
    class One
      class Interfaces < Fog::Collection
        model Fog::Compute::One::Interface
      end
    end
  end
end
