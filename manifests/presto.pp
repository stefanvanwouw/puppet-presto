class presto (
    $master,
    $install_dir = '/usr/lib/presto',
) {



    file {"${install_dir}/etc/node.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/node.properties.erb'),
        require => File["$install_dir/etc"],
    }

    file {"${install_dir}/etc/log.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/log.properties.erb'),
        require => File["$install_dir/etc"],
    }

    file {"${install_dir}/etc/config.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/config.properties.erb'),
        require => File["$install_dir/etc"],
    }

    file {"${install_dir}/etc/jvm.config":
        owner   => 'root',
        group   => 'root',
        content => template('presto/jvm.config.erb'),
        require => File["$install_dir/etc"],
    }

    file {"${install_dir}/etc/catalog/jmx.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/jmx.properties.erb'),
        require => File["$install_dir/etc"],
    }

    file {"${install_dir}/etc/catalog/hive.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/hive.properties.erb'),
        require => File["$install_dir/etc"],
    }

    file {$install_dir:
        ensure  => directory,
        source  => 'puppet:///modules/presto/presto-server-0.63',
        mode    => '0744',
        recurse => true,
        owner   => 'root',
        group   => 'root',
    }

    file {"$install_dir/etc":
        ensure  => directory,
        mode    => '0744',
        owner   => 'root',
        group   => 'root',
    }

    


}
