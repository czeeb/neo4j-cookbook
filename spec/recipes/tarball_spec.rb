require_relative '../spec_helper.rb'

describe 'neo4j::tarball' do
  let(:chef_run) { ChefSpec::SoloRunner.new.converge(described_recipe) }

  it 'includes the neo4j::user recipe' do
    expect(chef_run).to include_recipe('neo4j::user')
  end

  it 'creates neo4j parent directory for tarball install method' do
    expect(chef_run).to create_directory('/usr/local/neo4j')
  end

  it 'downloads neo4j tarball archive' do
    expect(chef_run).to create_remote_file('/usr/local/neo4j/neo4j-community-2.2.4-unix.tar.gz')
  end

  it 'extracts neo4j tarball' do
    expect(chef_run).to run_execute('extract_neo4j_tarball')
  end

  it 'deletes neo4j tarball archive' do
    expect(chef_run).to delete_remote_file('/usr/local/neo4j/neo4j-community-2.2.4-unix.tar.gz')
  end

  it 'links current neo4j release directory to /usr/local/neo4j/neo4j' do
    expect(chef_run).to create_link('/usr/local/neo4j/neo4j')
  end

  context 'rhel' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe)
    end

    it 'creates neo4j service template' do
      expect(chef_run).to create_template('/etc/init.d/neo4j')
    end
  end

  context 'ubuntu' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
    end

    it 'creates neo4j service template' do
      expect(chef_run).to create_template('/etc/init.d/neo4j-service')
    end
  end
end
