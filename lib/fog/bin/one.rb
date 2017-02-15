module One # deviates from other bin stuff to accomodate gem
  class << self

    def class_for(key)
      case key
      when :compute
        Fog::Compute::One
      else
        raise ArgumentError, "Unrecognized service: #{key}"
      end
    end

    def [](service)
      @@connections ||= Hash.new do |hash, key|
        hash[key] = case key
        when :compute
          Fog::Logger.warning("One[:compute] is not recommended, use Compute[:one] for portability")
          Fog::Compute.new(:provider => 'One')
        else
          raise ArgumentError, "Unrecognized service: #{key.inspect}"
        end
      end
      @@connections[service]
    end

    def available?
      begin
        availability=true unless Gem::Specification::find_by_name("fog-one").nil?
      rescue Gem::LoadError
        availability=false
      rescue
        availability_gem=Gem.available?("fog-one")
      end

      if availability
        for service in services
          for collection in self.class_for(service).collections
            unless self.respond_to?(collection)
              self.class_eval <<-EOS, __FILE__, __LINE__
                def self.#{collection}
                  self[:#{service}].#{collection}
                end
              EOS
            end
          end
        end
      end
      availability
    end

    def collections
      services.map {|service| self[service].collections}.flatten.sort_by {|service| service.to_s}
    end

    def services
      Fog::One.services
    end

  end
end
