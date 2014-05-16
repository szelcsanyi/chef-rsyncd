#
# Cookbook Name:: rsyncd
# Recipe:: default
#
# Copyright 2014, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>


package "rsync" do
	action :upgrade
end

service "rsync" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]
end

template "/etc/default/rsync" do
	source "etc/default/rsync.erb"
	owner "root"
	group "root"
	mode "0644"
	notifies :restart, "service[rsync]"
	variables( 
		:enabled => node['rsyncd']['enabled'],
		:options => node['rsyncd']['options'],
		:nice => node['rsyncd']['nice']
	)
end
