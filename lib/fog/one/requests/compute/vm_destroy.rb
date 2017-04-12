module Fog
  module Compute
    class One
      class Real
        def vm_destroy(id)
          vmpool = ::OpenNebula::VirtualMachinePool.new(client)
          vmpool.info!(-2,id,id,-1)

          raise ArgumentError, "Could not delete server with #{id}. Found #{vmpool.count} server with id: #{id}" if vmpool.count != 1

          # true => delete and recreate vm
          vmpool.first.delete(false)
        end
      end
      class Mock
        def vm_destroy(id)
          true
        end
      end
    end
  end
end
