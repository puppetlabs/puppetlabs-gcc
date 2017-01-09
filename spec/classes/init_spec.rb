require 'spec_helper'
describe 'gcc' do

  platforms = {
    'debian' =>
    { :osfamily     => 'Debian',
      :package_name => ['gcc', 'build-essential'],
    },
    'el' =>
    { :osfamily => 'RedHat',
      :package_name => ['gcc', 'gcc-c++'],
    },
    'other' =>
    { :osfamily => 'Other',
      :package_name => 'gcc',
    },
  }

  describe 'with default values for parameters on' do
    platforms.sort.each do |k,v|
      context "#{k}" do
        let(:facts) { { :osfamily => v[:osfamily] } }

        it { should compile.with_all_deps }
        it { should contain_class('gcc')}

        if v[:package_name].class == Array
          v[:package_name].each do |pkg|
            it {
              should contain_package(pkg).with({
                'ensure'   => 'present',
                'provider' => nil,
              })
            }
          end
        else
          it {
            should contain_package(v[:package_name]).with({
              'ensure'   => 'present',
              'provider' => nil,
            })
          }
        end
      end
    end
  end

  describe 'with package_name parameter specified' do
    let(:facts) {{ :osfamily => 'Other', }}
    let(:params) {{ :package_name => 'my-gcc' }}

    it { should compile.with_all_deps }
    it { should contain_class('gcc')}

    it { should contain_package('my-gcc').with_ensure('present') }
  end

  describe 'with package_ensure parameter specified' do
    let(:facts) {{ :osfamily => 'Other', }}
    let(:params) {{ :package_ensure => 'absent' }}

    it { should compile.with_all_deps }
    it { should contain_class('gcc')}

    it { should contain_package('gcc').with_ensure('absent') }
  end

  describe 'variable type and content validations' do
    let(:facts) { { :osfamily => 'RedHat' } }

    validations = {
      'string or array' => {
        :name    => %w(package_name package_ensure),
        :valid   => ['string', %w(array)],
        :invalid => [{ 'ha' => 'sh' }, true, false],
        :message => 'must be an array or a string',
      },
    }

    validations.sort.each do |type, var|
      var[:name].each do |var_name|
        var[:params] = {} if var[:params].nil?
        var[:valid].each do |valid|
          context "when #{var_name} (#{type}) is set to valid #{valid} (as #{valid.class})" do
            let(:params) { { :"#{var_name}" => valid } }
            it { should compile }
          end
        end

        var[:invalid].each do |invalid|
          context "when #{var_name} (#{type}) is set to invalid #{invalid} (as #{invalid.class})" do
            let(:params) { { :"#{var_name}" => invalid } }
            it 'should fail' do
              expect { should contain_class(subject) }.to raise_error(Puppet::Error, /#{var[:message]}/)
            end
          end
        end
      end # var[:name].each
    end # validations.sort.each
  end # describe 'variable type and content validations'
end
