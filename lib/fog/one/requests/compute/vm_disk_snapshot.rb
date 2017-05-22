module Fog
  module Compute
    class One
      class Real

        def vm_disk_snapshot(id, disk_id, image_name)
          vmpool = ::OpenNebula::VirtualMachinePool.new(client)
          vmpool.info!(-2,id,id,-1)

          raise ArgumentError, "Could not snapshot disk to server with #{id}. Found #{vmpool.count} server with id: #{id}" if vmpool.count != 1

          rc = vmpool.first.disk_snapshot(disk_id, image_name)
          if(rc.is_a? ::OpenNebula::Error)
            raise(rc)
          end

          rc
        end
      end
    end
  end
end
