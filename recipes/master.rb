#
# Cookbook Name:: lsyncd
# Recipe:: master
#

package "lsyncd"

cookbook_file "/etc/init.d/lsyncd" do
  source "master/lsyncd"
  owner "root"
  group "root"
  mode "0755"
end

directory "/etc/lsyncd" do
  action :create
  owner "root"
  group "root"
  mode "0755"
end

template "/etc/lsyncd/lsyncd.conf" do
  source "master/lsyncd.conf.erb"
  owner "root"
  group "root"
  notifies :reload, "service[lsyncd]"
end

service "lsyncd" do
  supports :status => true, :restart => true
  action [:enable, :start]
end
