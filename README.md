# Roleでインストールするパッケージを完全固定化すると失敗する例
* 自作Cookbookでpackage install時にマイナーバージョンやリビルドバージョンなどまで事細かに指定すると、実行時にリポジトリから削除されたり、依存関係を解決できない事があるので、もれなくChef実行が失敗します。
* その度にそのバージョンを利用している全Roleのバージョン変更という作業をすることになるので作業時間が増えるでしょう。

```ruby:site-cookbooks/php/recipes/install.rb
# Cookbook Name:: php
# Recipe:: install
#
include_recipe "yum::remi"
package "php" do
  action :install
  version node['php']['version']
end
```
```json:FAIL.json
{
  "name": "FAIL",
  "description": "絶対に失敗するPHPインストール",
  "json_class": "Chef::Role",
  "default_attributes": {
  },
  "override_attributes": {
    "php": {
      "version" : "5.4.45-7.el6.remi"
    }
  },
  "chef_type": "role",
  "run_list": [
    "php::install"
  ],
  "env_run_lists": {
  }
}
```
```bash:実行結果

(省略)

Recipe: php::install
  * yum_package[php] action install

    ================================================================================
    Error executing action `install` on resource 'yum_package[php]'
    ================================================================================

    Chef::Exceptions::Package
    -------------------------
    Version 5.4.45-7.el6.remi of php not found. Did you specify both version and release? (version-release, e.g. 1.84-10.fc6)

    Resource Declaration:
    ---------------------
    # In /home/centos/chef-solo/local-mode-cache/cache/cookbooks/php/recipes/install.rb

      5: package "php" do
      6:   action :install
      7:   version node['php']['version']
      8: end

(省略)

```
```json:SUCCESS.json
{
  "name": "SUCCESS",
  "description": "2016/11/30時点で成功するPHPインストール",
  "json_class": "Chef::Role",
  "default_attributes": {
  },
  "override_attributes": {
    "php": {
      "version" : "5.4.45-11.el6.remi"
    }
  },
  "chef_type": "role",
  "run_list": [
    "php::install"
  ],
  "env_run_lists": {
  }
}
```
```bash:実行結果

(省略)

Recipe: php::install
  * yum_package[php] action install
    - install version 5.4.45-11.el6.remi of package php

(省略)

```
```bash:diff
$ diff SUCCESS.json FAIL.json
2,3c2,3
<   "name": "SUCCESS",
<   "description": "2016/11/30時点で成功するPHPインストール",
---
>   "name": "FAIL",
>   "description": "絶対に失敗するPHPインストール",
9c9
<       "version" : "5.4.45-11.el6.remi"
---
>       "version" : "5.4.45-7.el6.remi"
```
