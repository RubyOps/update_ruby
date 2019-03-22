# update_ruby

Chef wrapper cookbook to install and update Ruby.

## Howto change attributes

To change an attribute like the Ruby version edit the default attributes file as shown below.

````
cookbooks/update_ruby/attributes/default.rb
````

## Examples

### Single user install

Install Ruby `2.6.2` in home directory of user named `chef`.

````
default['rbenv']['action'] = 'install'
default['rbenv']['version'] = '2.6.2'
default['rbenv']['user'] = 'chef'
````

### Single user, multiple servers with different versions per server

````
case node['name']
when 'server0.domain.com'
  default['rbenv']['action'] = 'install'
  default['rbenv']['version'] = '2.5.3'
  default['rbenv']['user'] = 'chef'
when 'server1.domain.com'
  default['rbenv']['action'] = 'install'
  default['rbenv']['version'] = '2.6.1'
  default['rbenv']['user'] = 'username'
end
````

## Install Ruby for multiple users

````
default['rbenv']['action'] = 'install'
default['rbenv']['version'] = '2.6.2'

# Users
default['rbenv']['users'] = [
  "chef",
  "chef1",
  "chef2"
]
````
