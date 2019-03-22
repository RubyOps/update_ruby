# update_ruby

Chef wrapper cookbook to install and update Ruby

## Change attributes

To change the Ruby version edit the default attributes file.

````
cookbooks/update_ruby/attributes/default.rb
````

## Different versions per server

Edit `cookbooks/update_ruby/attributes/default.rb`

````
case node['name']
when 'server0.domain.com'
  default['rbenv']['action'] = 'install'
  default['rbenv']['version'] = '2.5.3'
  default['rbenv']['user'] = 'chef'
when 'server1.domain.com'
  default['rbenv']['action'] = 'install'
  default['rbenv']['version'] = '2.6.1'
  default['rbenv']['user'] = 'chefko'
end
````

## Install Ruby for multiple users

````
# Users
default['rbenv']['users'] = [
  "chef",
  "chef1",
  "chef2"
]
````
