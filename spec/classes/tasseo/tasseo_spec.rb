require 'spec_helper'

describe 'tasseo', :type => :class do

  context 'no parameters on Ubuntu' do
    let :facts do
      { :operatingsystem => 'Ubuntu' }
    end
    it { should create_class('tasseo::config')}
    it { should create_class('tasseo::install')}
    it { should create_class('tasseo::service')}
    it { should create_class('tasseo::debian')}


    it { should contain_file('/etc/init/tasseo.conf').with_content(/PORT=5000/)}
    it { should_not contain_file('/etc/init/tasseo.conf').with_content(/GRAPHITE_AUTH=/)}
    it { should contain_file('/etc/init.d/tasseo')}
    it { should contain_service('tasseo').with_ensure('running').with_enable('true') }
  end

  context 'no parameters on CentOS' do
    let :facts do
      { :operatingsystem => 'CentOS' }
    end
    it { should create_class('tasseo::config')}
    it { should create_class('tasseo::install')}
    it { should create_class('tasseo::service')}
    it { should create_class('tasseo::redhat')}


    it { should contain_file('/etc/sysconfig/tasseo').with_content(/PORT=5000/)}
    it { should_not contain_file('/etc/sysconfig/tasseo').with_content(/GRAPHITE_AUTH=/)}
    it { should contain_file('/etc/rc.d/init.d/tasseo')}
    it { should contain_service('tasseo').with_ensure('running').with_enable('true') }
  end

  context 'with a custom graphite host on Ubuntu' do
    let :facts do
      { :operatingsystem => 'Ubuntu' }
    end
    let(:params) { {'graphite_url' => 'http://graphite.example.com'} }
    it { should contain_file('/etc/init/tasseo.conf').with_content(/GRAPHITE_URL=http:\/\/graphite.example.com/)}
  end

  context 'with a custom graphite host on CentOS' do
    let :facts do
      { :operatingsystem => 'CentOS' }
    end
    let(:params) { {'graphite_url' => 'http://graphite.example.com'} }
    it { should contain_file('/etc/sysconfig/tasseo').with_content(/GRAPHITE_URL=http:\/\/graphite.example.com/)}
  end

  context 'with a custom port on Ubuntu' do
    let :facts do
      { :operatingsystem => 'Ubuntu' }
    end
    let(:params) { {'port' => 5001} }
    it { should contain_file('/etc/init/tasseo.conf').with_content(/PORT=5001/)}
  end

  context 'with a custom graphite host on CentOS' do
    let :facts do
      { :operatingsystem => 'CentOS' }
    end
    let(:params) { {'graphite_auth' => 'user:password'} }
    it { should contain_file('/etc/sysconfig/tasseo').with_content(/GRAPHITE_AUTH=user:password/)}
  end
end
