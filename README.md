# L7-rsyncd cookbook
[![Build Status](https://travis-ci.org/szelcsanyi/chef-rsyncd.svg?branch=master)](https://travis-ci.org/szelcsanyi/chef-rsyncd)
[![security](https://hakiri.io/github/szelcsanyi/chef-rsyncd/master.svg)](https://hakiri.io/github/szelcsanyi/chef-rsyncd/master)
[![Cookbook Version](https://img.shields.io/cookbook/v/L7-rsyncd.svg?style=flat)](https://supermarket.chef.io/cookbooks/L7-rsyncd)

## Description

Configures [Rsyncd](http://en.wikipedia.org/wiki/Rsync) via Opscode Chef

## Supported Platforms

* Ubuntu 12.04+
* Debian 7.0+

## Recipes

* `rsyncd` - Installs and starts rsync daemon.

## Definitions
* `L7_rsyncd_share` - Configures rsyncd share

## Usage
###Definition parameters:

* `path`: path to share
* `comment`: comment of the share
* `hosts_allow`: allowed hosts
* `read_only`: the share is read only
* `write_only`: the share is write only
* `list`: listing of shares
* `uid`: user id of the share
* `gid`: group id of the share
* `exclude`: exclude list
* `secrets`: authentication part of the share

Only the path parameter is mandatory. Others are optional.

#### An rsyncd share:
```ruby
L7_rsyncd_share 'rsyncd_example' do
    path "/etc"
    uid "root"
    gid "root"
    comment "some comment"
    secrets [ { "name" => "user1", "password" => "s3cr3t_1"} , { "name" => "user2", "password" => "s3cr3t_2" } ]
    exclude ".svn .git"
end
```

## TODO
Rewrite to LWRP

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

* Freely distributable and licensed under the [MIT license](http://szelcsanyi.mit-license.org/2016/license.html).
* Copyright (c) 2016 Gabor Szelcsanyi

[![image](https://ga-beacon.appspot.com/UA-56493884-1/chef-rsyncd/README.md)](https://github.com/szelcsanyi/chef-rsyncd)
