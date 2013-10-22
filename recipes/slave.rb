#
# Cookbook Name:: lsyncd
# Recipe:: slave
#

package "rsync"
package "xinetd"

cookbook_file "/etc/xinetd.d/rsync" do
  source "slave/rsync"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[xinetd]"
end

template "/etc/rsyncd.conf" do
  source "slave/rsyncd.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[xinetd]"
end

service "xinetd" do
  supports :status => true, :restart => true
  action [:enable, :start]
end
