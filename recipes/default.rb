#
# Cookbook Name:: git18
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# Monkey patch the default git cookbook to uninstall the normal git package. We
# do it this way, so that other recipes can still depend on the more general
# default "git" cookbook, but we'll still do the right thing if this cookbook
# gets included.
chef_gem "chef-rewind"
require "chef/rewind"

include_recipe "git"

rewind "package[git]" do
  action :remove
end

# Install git 1.8 out of the ius repo.
include_recipe "yum-ius"
package "git18"
