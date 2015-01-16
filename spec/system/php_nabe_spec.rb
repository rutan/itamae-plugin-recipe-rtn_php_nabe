require 'spec_helper'

describe command('. /etc/profile && which php-nabe') do
  let(:disable_sudo) { true }
  its(:stdout) { should match '/usr/local/php-nabe/php-nabe' }
end

%w[5.6.4 5.5.20].each do |php_version|
  describe command(". /etc/profile && php-nabe ls | grep '#{php_version}'") do
    let(:disable_sudo) { true }
    its(:stdout) { should match /#{Regexp.escape(php_version)}/ }
  end
end

describe command(". /etc/profile && php -v") do
  let(:disable_sudo) { true }
  its(:stdout) { should match /5\.6\.4/ }
end

