Shindo.tests('Fog::Compute[:one] | network model', ['one']) do

  networks = Fog::Compute[:one].networks
  network = networks.last

  tests('The network model should') do
    tests('have the action') do
      test('reload') { network.respond_to? 'reload' }
    end
    tests('have attributes') do
      model_attribute_hash = network.attributes
      attributes = 
      tests("The network model should respond to") do
        [:name, :id, :vlan, :uid, :uname, :gid, :description].each do |attribute|
          test("#{attribute}") { network.respond_to? attribute }
        end
      end
      tests("The attributes hash should have key") do
        [:name, :id, :uid, :uname, :gid ].each do |attribute|
          test("#{attribute}") { model_attribute_hash.has_key? attribute }
        end
      end
    end
    test('be a kind of Fog::Compute::One::Network') { network.kind_of? Fog::Compute::One::Network }
  end

end
