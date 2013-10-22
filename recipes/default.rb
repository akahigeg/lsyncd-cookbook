#
# Cookbook Name:: lsyncd
# Recipe:: default
#

if (node[:web_sync][:is_master] == true)
  include_recipe "web-sync::master"
else
  include_recipe "web-sync::slave"
end


