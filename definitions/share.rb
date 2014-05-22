#
# Cookbook Name:: rsyncd
# Definition:: share
#
# Copyright 2014, Gabor Szelcsanyi <szelcsanyi.gabor@gmail.com>

define :rsyncd_share, list: 'no', read_only: 'yes' do

  t = nil
  begin
    t = resources(template: '/etc/rsyncd.conf')
  rescue Chef::Exceptions::ResourceNotFound
    t = template '/etc/rsyncd.conf' do
      mode '0644'
      owner 'root'
      group 'root'
      source 'etc/rsyncd.conf.erb'
      cookbook 'rsyncd'
      variables(shares: [])
    end
  end

  unless params[:secrets].nil?
    ts = nil
    begin
      ts = resources(template: "/etc/rsyncd.secrets.#{params[:name]}")
    rescue Chef::Exceptions::ResourceNotFound
      ts = template "/etc/rsyncd.secrets.#{params[:name]}" do
        mode '0644'
        owner 'root'
        group 'root'
        source 'etc/rsyncd.secrets.erb'
        cookbook 'rsyncd'
        variables(users: nil)
      end
    end

    ts.variables[:users] = params[:secrets]
  end

  t.variables[:shares] << {
    name: params[:name],
    path: params[:path],
    comment: params[:comment],
    hosts_allow: params[:hosts_allow],
    read_only: params[:read_only],
    write_only: params[:write_only],
    list: params[:list],
    uid: params[:uid],
    gid: params[:gid],
    exclude: params[:exclude],
    secrets: params[:secrets].nil? ? nil : params[:name]
  }

end
