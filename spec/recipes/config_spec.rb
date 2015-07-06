require_relative '../spec_helper.rb'

describe 'neo4j::config' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  let(:neo4j_server_properties_template) { chef_run.template('/etc/neo4j/neo4j-server.properties') }
  let(:neo4j_properties_template) { chef_run.template('/etc/neo4j/neo4j.properties') }
  let(:neo4j_wrapper_template) { chef_run.template('/etc/neo4j/neo4j-wrapper.conf') }

  it 'should create /etc/neo4j/neo4j-server.properties' do
    expect(chef_run).to create_template('/etc/neo4j/neo4j-server.properties')
    expect(neo4j_server_properties_template).to notify('service[neo4j-service]').delayed
  end

  it 'should create /etc/neo4j/neo4j.properties' do
    expect(chef_run).to create_template('/etc/neo4j/neo4j.properties')
    expect(neo4j_server_properties_template).to notify('service[neo4j-service]').delayed
  end

  it 'should create /etc/neo4j/neo4j-wrapper.conf' do
    expect(chef_run).to create_template('/etc/neo4j/neo4j-wrapper.conf')
    expect(neo4j_server_properties_template).to notify('service[neo4j-service]').delayed
  end
end
