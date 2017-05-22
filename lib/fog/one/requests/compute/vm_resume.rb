module Fog
  module Compute
    class One
      class Real

        def vm_resume(id)

          vmpool = ::OpenNebula::VirtualMachinePool.new(client)
          vmpool.info!(-2,id,id,-1)
          puts "#{vmpool.entries.class} #{vmpool.entries.methods}"
          puts "#{vmpool.entries.inspect} #{vmpool.entries.methods}"

          raise ArgumentError, "Could not resume server with id: #{id}. Found #{vmpool.count} server with id: #{id}" if vmpool.count != 1
          vmpool.first.resume
        end

        class Mock
        end
      end
    end
  end
end
