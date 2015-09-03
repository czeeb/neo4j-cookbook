require_relative '../spec_helper.rb'

describe 'neo4j::java' do
  context 'install_java = true' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['neo4j']['install_java'] = true
      end.converge(described_recipe)
    end

    it 'should include recipe java' do
      expect(chef_run).to include_recipe('java')
    end

    context 'rhel' do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'centos', version: '6.5').converge(described_recipe)
      end

      it 'should not include recipe apt' do
        expect(chef_run).to_not include_recipe('apt')
      end
    end

    context 'ubuntu' do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe)
      end

      it 'should include recipe apt' do
        expect(chef_run).to include_recipe('apt')
      end
    end
  end

  context 'install_java = false' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new do |node|
        node.set['neo4j']['install_java'] = false
      end.converge(described_recipe)
    end

    it 'should not include recipe java' do
      expect(chef_run).to_not include_recipe('java')
    end
  end
end
