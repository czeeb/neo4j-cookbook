require_relative '../spec_helper.rb'

describe 'neo4j::service' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  context 'centos 6.6' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.6').converge(described_recipe)
    end

    it 'manage neo4j service' do
      expect(chef_run).to start_service('neo4j')
      expect(chef_run).to enable_service('neo4j')
    end
  end

  context 'centos 7.0' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '7.0').converge(described_recipe)
    end

    it 'manage neo4j service' do
      expect(chef_run).to start_service('neo4j')
      expect(chef_run).to enable_service('neo4j')
    end
  end

  context 'ubuntu 12.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
    end

    it 'manage neo4j service' do
      expect(chef_run).to start_service('neo4j')
      expect(chef_run).to enable_service('neo4j')
    end
  end

  context 'ubuntu 14.04' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end

    it 'manage neo4j service' do
      expect(chef_run).to start_service('neo4j')
      expect(chef_run).to enable_service('neo4j')
    end
  end
end
