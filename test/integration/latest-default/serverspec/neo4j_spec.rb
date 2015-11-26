require 'serverspec'

set :backend, :exec

describe 'neo4j' do
  if os[:family] == 'debian'
    if os[:release] == '8.1'
      describe service('neo4j-service') do
        it { should be_running }
      end
    else
      describe service('neo4j-service') do
        it { should be_enabled }
        it { should be_running }
      end
    end
  elsif os[:family] == 'rhel'
    describe service('neo4j') do
      it { should be_enabled }
      it { should be_running }
    end
  end

  describe port(7474) do
    it { should be_listening }
  end
end
