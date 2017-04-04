module Fog
  module Compute
    class One
      class Server < Fog::Compute::Server
        identity :id
        attribute :template_str
        attribute :name
        attribute :uuid
        attribute :state
        attribute :status
        attribute :ip
        attribute :mac
        attribute :vcpu
        attribute :cpu
        attribute :memory
        attribute :user
        attribute :interfaces
        attribute :gid
        attribute :group
        attribute :onevm_object
        attribute :flavor
        attribute :template_id
        attribute :vminterfaces


        def vminterfaces
          interfaces
        end   

        def select_nic(fog_nics, nic)   
          fog_nics.detect {|fn| 
            fn.vnet == nic.compute_attributes['network']
          } # grab any nic on the same network
        rescue Exception => e
          Rails.logger.debug e.class
          Rails.logger.debug e.message
          Rails.logger.debug e.backtrace
        end

        def vminterfaces_attributes=(attributes)
          true                   
        end

        def template_id          
          ""
        end                      

        def vm_description       
          _("%{cpus} CPUs and %{memory} memory") % {:cpus => cpu, :memory => number_to_human_size(memory.to_i)}
        end






        def save
          merge_attributes(service.vm_allocate(attributes))
        end

        def vm_ip_address
          ip
        end
        
        def private_ip_address
          ip
        end

        def public_ip_address
          ip
        end

        def vm_mac_address
          mac
        end

        def start
          if status == 4
            service.vm_resume(id)
          end
          true
        end	

        def stop
          Fog::Logger.warning("stop VM: ID:#{id}")
          service.vm_stop(id)
        end

        def destroy
          service.vm_destroy(id)
        end

        def ready?
          (status == 3) 
        end

        def console_output
          requires :id
          service.get_vnc_console(id, "vnc", onevm_object)
        end
      end
    end
  end
end
