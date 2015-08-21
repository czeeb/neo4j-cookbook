require_relative '../spec_helper.rb'

describe 'neo4j::user' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'adds user neo4j' do
    expect(chef_run).to create_user('neo4j')
  end

  context 'rhel' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe)
    end

    it 'adds group neo4j' do
      expect(chef_run).to create_group('neo4j')
    end
  end

  context 'ubuntu' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
    end

    it 'adds group nogroup' do
      expect(chef_run).to create_group('nogroup')
    end
  end
end
