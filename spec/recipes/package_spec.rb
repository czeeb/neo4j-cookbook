require_relative '../spec_helper.rb'

describe 'neo4j::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  context 'rhel' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe)
    end

    it 'should not include recipe apt' do
      expect(chef_run).to_not include_recipe('apt')
    end

    it 'should install neo4j yum repository' do
      expect(chef_run).to create_yum_repository('neo4j')
    end

    it 'should install neo4j' do
      expect(chef_run).to install_package('neo4j').with(version: '2.2.4-1')
    end
  end

  context 'ubuntu' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
    end

    it 'should include recipe apt' do
      expect(chef_run).to include_recipe('apt')
    end

    it 'should install neo4j apt repository' do
      expect(chef_run).to add_apt_repository('neo4j')
    end

    it 'should install neo4j' do
      expect(chef_run).to install_package('neo4j').with(version: '2.2.4')
    end
  end
end
