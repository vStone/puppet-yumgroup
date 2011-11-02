puppet-yumgroup
===============

This puppet module allows yum repositories to grouped together in one file.

Dependencies
------------

If you are using puppet 2.6.x, you will need [puppetlabs-create_resources](https://github.com/puppetlabs/puppetlabs-create_resources)

Examples
--------

The following example will re-create a CentOS-Base.repo file.

    $centos_5_gpg_key = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5'

    $centos_repos = {
      'base' => {
        descr     => 'CentOS-$releasever - Base',
        baseurl   => "http://${centos_repo_host}/centos/\$releasever/os/\$basearch/",
        enabled   => 1,
        gpgcheck  => 1,
        gpgkey    => $centos_5_gpg_key,
      },
      'updates' => {
        descr     => 'CentOS-$releasever - Updates',
        baseurl   => "http://${centos_repo_host}/centos/\$releasever/updates/\$basearch/",
        enabled   => 1,
        gpgcheck  => 1,
        gpgkey    => $centos_5_gpg_key,
      },
      'addons' => {
        descr     => 'CentOS-$releasever - Addons',
        baseurl   => "http://${centos_repo_host}/centos/\$releasever/addons/\$basearch/",
        enabled   => 1,
        gpgcheck  => 1,
        gpgkey    => $centos_5_gpg_key,
      },
      'extras' => {
        descr     => 'CentOS-$releasever - Extras',
        baseurl   => "http://${centos_repo_host}/centos/\$releasever/extras/\$basearch/",
        enabled   => 1,
        gpgcheck  => 1,
        gpgkey    => $centos_5_gpg_key,
      },
      'centosplus' => {
        descr     => 'CentOS-$releasever - Plus',
        baseurl   => "http://${centos_repo_host}/centos/\$releasever/centosplus/\$basearch/",
        enabled   => 0,
        gpgcheck  => 1,
        gpgkey    => $centos_5_gpg_key,
      },
      'contrib' => {
        descr     => 'CentOS-$releasever - Contrib',
        baseurl   => "http://${centos_repo_host}/centos/\$releasever/contrib/\$basearch/",
        enabled   => 0,
        gpgcheck  => 1,
        gpgkey    => $centos_5_gpg_key,
      },
    }

    yumgroup { 'CentOS-Base':
      repos => $centos_repos,
    }
