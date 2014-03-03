#
# Cookbook Name:: git18
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "yum-ius"

package "old_git_cleanup" do
  package_name "git"
  action :remove
end

# Monkey patch the default git cookbook, so that other recipes can still depend
# on the more general, default "git" cookbook. This will also fix other
# cookbooks that might try to install the "git" package on their own.
chef_gem "chef-rewind"
require "chef/rewind"

include_recipe "git"

rewind "package[git]" do
  package_name "git18"
end
