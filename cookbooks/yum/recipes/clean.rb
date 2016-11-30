#
# Cookbook Name:: yum
# Recipe:: clear
#
# Copyright 2013i, Cybird
#
# All rights reserved - Do Not Redistribute
#

# yum clean all
script "yum clean all" do
  interpreter "bash"
# flags "-e"
  code <<-"EOH"
    yum clean all
  EOH
end




