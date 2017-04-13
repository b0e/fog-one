require 'fog/core/collection'
require 'fog/one/models/compute/server'

module Fog
  module Compute
    class One

      class Servers < Fog::Collection

        model Fog::Compute::One::Server

        def all(filter={})
          a=load(service.list_vms(filter))
          a
        end

        def get(id)
          raise ArgumentError, 'Fog:Compute:One:Servers.get: Argument nil is not allowed' if id.nil?
          data = service.list_vms({:id => id})

          # raise exception if we found more than one vm
          raise ArgumentError, "OpenNebula returned #{data.length} elements. Should be 0 or 1" if data.length > 1

          # return the server object if we found one vm else nil
          new data.first if data.length == 1
        end

        def shutdown(id)
          service.vm_shutdown(id)
        end

      end
    end
  end
end

