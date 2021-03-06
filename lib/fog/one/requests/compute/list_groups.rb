module Fog
  module Compute
    class One
      class Real
        def list_groups(filter = {})

          groups=[]
          grouppool = ::OpenNebula::GroupPool.new(client)
          grouppool.info

          # {
          #   "GROUP"=>{
          #     "ID"=>"0", 
          #      "NAME"=>"oneadmin", 
          #      "USERS"=>{"ID"=>["0", "1"]}, 
          #      "DATASTORE_QUOTA"=>{}, 
          #      "NETWORK_QUOTA"=>{}, 
          #      "VM_QUOTA"=>{}, 
          #      "IMAGE_QUOTA"=>{}
          #    }
          #}

          grouppool.each do |group| 
            filter_missmatch = false

            unless (filter.empty?)
              filter.each do |k,v|
                if group["#{k.to_s.upcase}"] && group["#{k.to_s.upcase}"] != v.to_s
                  filter_missmatch = true
                  break
                end
              end 
              next if filter_missmatch
            end 
            groups << {:id => group["ID"], :name => group["NAME"]}
          end
          groups
        end # def list_groups
      end # class Real


      class Mock
        def list_groups(filter={})
          groups = []
          net1 = mock_group "1", 'net1'
          net2 = mock_group "2", 'fogtest'

          grouppool = [net1, net2]
          grouppool.each do |group| 
            filter_missmatch = false

            unless (filter.empty?)
              filter.each do |k,v|
                if group["#{k.to_s.upcase}"] && group["#{k.to_s.upcase}"] != v.to_s
                  filter_missmatch = true
                  break
                end
              end 
              next if filter_missmatch
            end 
            groups << {:id => group["ID"], :name => group["NAME"]}
          end
          groups
        end # def list_groups

        def mock_group id, name
          {
            "ID"    	 => id,
            "NAME"  	 => name,
            "UID"   	 => "5",
            "GID"   	 => "5",
            "DESCRIPTION" => "netDescription",
            "VLAN"	 => "5"
          }
        end # def mock_group
      end # class Mock
    end # class One
  end # module Compute
end # module Fog
