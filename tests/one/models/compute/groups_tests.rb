Shindo.tests('Fog::Compute[:one] | groups collection', ['one']) do

  groups = Fog::Compute[:one].groups

  tests('The groups collection') do
    test('should be a kind of Fog::Compute::One::Groups') { groups.kind_of? Fog::Compute::One::Groups }
    tests('should be able to reload itself').succeeds { groups.reload }
    tests('should be able to get a model by id') do
      tests('by instance id').succeeds { groups.get groups.first.id }
    end
    tests('should be able to get a model by name') do
      tests('by instance id').succeeds { groups.get_by_name "fogtest" }
    end
  end

end
