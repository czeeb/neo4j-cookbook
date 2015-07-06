require_relative '../spec_helper.rb'

describe 'neo4j::service' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'manage neo4j-service service' do
    expect(chef_run).to start_service('neo4j-service')
    expect(chef_run).to enable_service('neo4j-service')
  end
end
