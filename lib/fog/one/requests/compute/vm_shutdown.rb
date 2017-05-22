module Fog
  module Compute
    class One
      class Real

        def vm_shutdown(id)
          vmpool = ::OpenNebula::VirtualMachinePool.new(client)
          vmpool.info!(-2,id,id,-1)

          raise ArgumentError, "Could not shutdown server with #{id}. Found #{vmpool.count} server with id: #{id}" if vmpool.count != 1

          vmpool.first.shutdown
        end

      end
    end
  end
end
