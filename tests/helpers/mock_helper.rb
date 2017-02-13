# Use so you can run in mock mode from the command line
#
# FOG_MOCK=true fog

if ENV["FOG_MOCK"] == "true"
  Fog.mock!
end

# if in mocked mode, fill in some fake credentials for us
if Fog.mock?
  Fog.credentials = {
    :opennebula_username => 'oneadmin',
    :opennebula_password => 'opennebula',
    :opennebula_endpoint => 'http://172.28.128.4:2633/RPC2',
  }.merge(Fog.credentials)
end
