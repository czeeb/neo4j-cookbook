require_relative '../spec_helper.rb'

describe 'neo4j::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes the neo4j::install recipe' do
    expect(chef_run).to include_recipe('neo4j::install')
  end

  it 'includes the neo4j::config recipe' do
    expect(chef_run).to include_recipe('neo4j::config')
  end
end
