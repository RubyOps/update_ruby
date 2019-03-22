#
# Cookbook:: update_ruby
# Recipe:: default
#
# Copyright:: 2019, Nedim Hadzimahmutovic, All Rights Reserved.

version = node['rbenv']['version']
user = node['rbenv']['user']
install_action = node['rbenv']['action']
system_install = node['rbenv']['system']['install']


if system_install
  # Install Rbenv Globally
  # Install Rbenv to the system path e.g. /usr/local/rbenv
  rbenv_system_install 'system'
  # Install a Ruby version
  rbenv_ruby version do
    verbose true
    rbenv_action install_action
  end
  # Set that Ruby as the global Ruby
  rbenv_global version

  rbenv_rehash 'rehash' do
  end

  rbenv_script 'system wide: gem update system' do
    rbenv_version version
    code "gem update --system"
  end
end

unless user.nil?
  rbenv_user_install user do
    user user
  end
  rbenv_ruby version do
    verbose true
    user user
    rbenv_action install_action
  end
  rbenv_rehash 'rehash' do
    user user
  end
  rbenv_script 'user: gem update system' do
    rbenv_version version
    user user
    code "gem update --system"
  end
end
