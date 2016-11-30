#
# Cookbook Name:: yum
# Recipe:: zabbix
#
# Copyright 2014, Cybird

package "wget" do
  action :install
end

#Zabbix 2.0 for RHEL6:
if !File.exist?("/etc/yum.repos.d/zabbix.repo") then
 script "add ZABBIX-JP yum repo" do
  interpreter "bash"
  flags "-e"
  code <<-"EOH"
    cd /root/
    wget http://repo.zabbix.com/zabbix/2.0/rhel/6/x86_64/zabbix-release-2.0-1.el6.noarch.rpm -P /tmp
    rpm -ivh /tmp/zabbix-release-2.0-1.el6.noarch.rpm
  EOH
 end
end
