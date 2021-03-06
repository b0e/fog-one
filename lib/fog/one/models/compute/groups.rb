require 'fog/core/collection'
require 'fog/one/models/compute/group'

module Fog
  module Compute
    class One

      class Groups < Fog::Collection

        model Fog::Compute::One::Group

        def all(filter={})
          load(service.list_groups(filter))
        end

        def get(id)
          group = self.all({:id => id})
          
          if group.length > 1
            raise Fog::Errors::Error.new("groups.get should return only one group, not #{group.length}!")
          end

          group.first
        end

        def get_by_name(str)
          self.all({:name => str})
        end

      end

    end
  end
end
