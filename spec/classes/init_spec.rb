require 'spec_helper'
describe 'consul_replicate' do

  context 'with defaults for all parameters' do
    it { should contain_class('consul_replicate') }
  end
end
