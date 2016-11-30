#
# Cookbook Name:: yum
# Recipe:: git
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#ファイル配置

#cookbook_file "/tmp/rpmforge.rpm" do
#  source "rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm"
#  owner "root"
#  group "root"
#  mode 0644
#end

bash 'rpmforge.rpm install' do
  code <<-EOH
    cd /tmp
    wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
    rpm -i rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm
    sed -ie 's/enabled = 0/enabled = 1/g' /etc/yum.repos.d/rpmforge.repo
  EOH
end


#cookbook_file "/etc/yum.repos.d/rpmforge.repo" do
#  source "rpmforge.repo"
#  owner "root"
#  group "root"
#  mode 0644
#end

