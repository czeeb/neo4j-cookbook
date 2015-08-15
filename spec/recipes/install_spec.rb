require_relative '../spec_helper.rb'

describe 'neo4j::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes the neo4j::java recipe' do
    expect(chef_run).to include_recipe('neo4j::java')
  end

  it 'creates neo4j log directory' do
    expect(chef_run).to create_directory('/var/log/neo4j')
  end

  context 'rhel' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe)
    end

    it 'creates neo4j auth file directory' do
      expect(chef_run).to create_directory('/usr/share/neo4j/data/dbms')
    end

    it 'creates neo4j data directory' do
      expect(chef_run).to create_directory('/var/lib/neo4j')
    end
  end

  context 'ubuntu' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
    end

    it 'creates neo4j auth file directory' do
      expect(chef_run).to create_directory('/var/lib/neo4j/data/dbms')
    end

    it 'creates neo4j data directory' do
      expect(chef_run).to create_directory('/var/lib/neo4j/data/graph.db')
    end
  end

  it 'includes the neo4j::package recipe when  install_method = tarball' do
    chef_run.node.set['neo4j']['install_method'] = 'tarball'
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('neo4j::tarball')
  end

  it 'includes the neo4j::package recipe when  install_method = package' do
    chef_run.node.set['neo4j']['install_method'] = 'package'
    chef_run.converge(described_recipe)
    expect(chef_run).to include_recipe('neo4j::package')
  end
end
