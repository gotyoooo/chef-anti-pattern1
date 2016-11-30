#
# Cookbook Name:: yum
# Recipe:: td
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/etc/yum.repos.d/td.repo" do
  source "td.repo"
  owner "root"
  group "root"
  mode 0644
end

