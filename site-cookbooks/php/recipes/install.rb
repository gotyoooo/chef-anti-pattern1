# Cookbook Name:: php
# Recipe:: install
#
include_recipe "yum::remi"
package "php" do
  action :install
  version node['php']['version']
end
