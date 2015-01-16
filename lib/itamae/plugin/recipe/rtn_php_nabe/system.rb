# encoding: utf-8

node[:rtn_php_nabe] ||= {}
node[:rtn_php_nabe][:git_url] ||= 'https://github.com/kawahara/php-nabe.git'
node[:rtn_php_nabe][:install_path] ||= '/usr/local/php-nabe'
node[:rtn_php_nabe][:versions] ||= []
node[:rtn_php_nabe][:use] ||= nil

packages = %w[
  rpmforge-release
  gcc
  git
  bison
  libcurl-devel
  libmcrypt-devel
  libjpeg-devel
  libpng-devel
  libxslt-devel
  libtidy-devel
  libxml2-devel
  re2c
  readline-devel
  texinfo
]
packages.each { |package_name| package package_name }

git node[:rtn_php_nabe][:install_path] do
  repository node[:rtn_php_nabe][:git_url]
end

setting = <<"EOS"
# php-nabe
export PHP_NABE_ROOT=#{node[:rtn_php_nabe][:install_path]}
export PATH="$PHP_NABE_ROOT:$PHP_NABE_ROOT/bin:$PATH"
EOS

profile_path = '/etc/profile.d/php-nabe.sh'
execute 'add php-nabe settings' do
  command "echo '#{setting}' >> #{profile_path}"
  not_if "test `touch #{profile_path} && cat #{profile_path} | grep 'php-nabe' -c` != 0"
end

node[:rtn_php_nabe][:versions].each do |php_version, extensions|
  execute ". #{profile_path} && php-nabe install #{php_version}" do
    not_if "test `. #{profile_path} && php-nabe ls | grep '#{php_version}' -c` != 0"
  end
end

if version = node[:rtn_php_nabe][:use]
  execute ". #{profile_path} && php-nabe use #{version}"
end

