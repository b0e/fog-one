module Fog
  module Compute
    class One
      class Real

        def vm_poweroff(id, hard=false)
          vmpool = ::OpenNebula::VirtualMachinePool.new(client)
          vmpool.info!(-2,id,id,-1)

          puts "#{vmpool.entries.class} #{vmpool.entries.methods}"
          puts "#{vmpool.entries.inspect} #{vmpool.entries.methods}"

          raise ArgumentError, "Could not poweroff server with #{id}. Found #{vmpool.count} server with id: #{id}" if vmpool.count != 1

          vmpool.first.poweroff(hard)
        end

        class Mock
          def vm_poweroff(id)
            true
          end
        end
      end
    end
  end
end
