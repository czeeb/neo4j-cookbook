require 'serverspec'

set :backend, :exec

describe 'neo4j' do
  describe package('neo4j') do
    it { should be_installed }
  end

  describe service('neo4j-service') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(7474) do
    it { should be_listening }
  end
end
