require_relative '../spec_helper.rb'

describe 'neo4j::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'should install neo4j apt repository' do
    expect(chef_run).to add_apt_repository('neo4j')
  end

  it 'should install neo4j' do
    expect(chef_run).to install_package('neo4j').with(version: '2.2.3')
  end
end
