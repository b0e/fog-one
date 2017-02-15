module Fog
  module Compute
    class One
      class Real
        def vm_attach_nic(id, nic)
          vmpool = ::OpenNebula::VirtualMachinePool.new(client)
          vmpool.info!(-2,id,id,-1)
          vm = vmpool.first
          vm.nic_attach(nic.to_s)
        rescue OpenNebulaError=> err
          raise err
        rescue Exception
          raise err
        end
      end
      class Mock
        def vm_attach_nic(id, nic)
          # nil => nic attached
          nil
        end
      end
    end
  end
end
