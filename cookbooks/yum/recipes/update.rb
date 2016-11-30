#
# Cookbook Name:: yum
# Recipe:: update
#
# Copyright 2014, Cybird

node['yum']['updatelist'].each do |pkg|
    execute "yum-update #{pkg}" do
        user "root"
        command "yum -y update #{pkg}"
        action :run
    end
end

