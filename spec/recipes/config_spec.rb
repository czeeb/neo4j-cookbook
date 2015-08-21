require_relative '../spec_helper.rb'

describe 'neo4j::config' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }
  let(:neo4j_server_properties_template) { chef_run.template('/var/lib/neo4j/conf/neo4j-server.properties') }
  let(:neo4j_properties_template) { chef_run.template('/var/lib/neo4j/conf/neo4j.properties') }
  let(:neo4j_wrapper_template) { chef_run.template('/var/lib/neo4j/conf/neo4j-wrapper.conf') }
  let(:neo4j_logging_properties_template) { chef_run.template('/var/lib/neo4j/conf/logging.properties') }

  it 'should create /var/lib/neo4j/conf/neo4j-server.properties' do
    expect(chef_run).to create_template('/var/lib/neo4j/conf/neo4j-server.properties')
    expect(neo4j_server_properties_template).to notify('service[neo4j]').delayed
  end

  it 'should create /var/lib/neo4j/conf/neo4j.properties' do
    expect(chef_run).to create_template('/var/lib/neo4j/conf/neo4j.properties')
    expect(neo4j_server_properties_template).to notify('service[neo4j]').delayed
  end

  it 'should create /var/lib/neo4j/conf/neo4j-wrapper.conf' do
    expect(chef_run).to create_template('/var/lib/neo4j/conf/neo4j-wrapper.conf')
    expect(neo4j_server_properties_template).to notify('service[neo4j]').delayed
  end

  it 'should create /var/lib/neo4j/conf/logging.properties' do
    expect(chef_run).to create_template('/var/lib/neo4j/conf/logging.properties')
    expect(neo4j_logging_properties_template).to notify('service[neo4j]').delayed
  end

  it 'includes the neo4j::service recipe' do
    expect(chef_run).to include_recipe('neo4j::service')
  end
end
