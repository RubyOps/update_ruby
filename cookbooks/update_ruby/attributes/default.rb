# RBENV
default['rbenv']['action'] = 'install'
default['rbenv']['version'] = '2.6.2'
# System
default['rbenv']['system']['install'] = false
# User
default['rbenv']['user'] = 'chef'

# Users
default['rbenv']['users'] = [
  "chef",
  "chef1",
  "chef2"
]
