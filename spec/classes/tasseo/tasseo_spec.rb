require 'spec_helper'

describe 'tasseo', :type => :class do

  context 'no parameters' do
    it { should create_class('tasseo::config')}
    it { should create_class('tasseo::install')}
    it { should create_class('tasseo::service')}

    it { should contain_file('/etc/init/tasseo.conf').with_content(/PORT=5000/)}
    it { should contain_file('/etc/init.d/tasseo')}
    it { should contain_service('tasseo').with_ensure('running').with_enable('true') }
  end

  context 'with a custom graphite host' do
    let(:params) { {'graphite_url' => 'http://graphite.example.com'} }
    it { should contain_file('/etc/init/tasseo.conf').with_content(/GRAPHITE_URL=http:\/\/graphite.example.com/)}
  end

  context 'with a custom port' do
    let(:params) { {'port' => 5001} }
    it { should contain_file('/etc/init/tasseo.conf').with_content(/PORT=5001/)}
  end

end
