class presto (
    $master,
    $install_dir = '/usr/lib/presto',
) {


    file {"${install_dir}/etc/node.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/node.properties.erb'),
    }

    file {"${install_dir}/etc/log.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/log.properties.erb'),
    }

    file {"${install_dir}/etc/config.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/config.properties.erb'),
    }

    file {"${install_dir}/etc/jvm.config":
        owner   => 'root',
        group   => 'root',
        content => template('presto/jvm.config.erb'),
    }

    file {"${install_dir}/etc/catalog/jmx.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/jmx.properties.erb'),
    }

    file {"${install_dir}/etc/catalog/hive.properties":
        owner   => 'root',
        group   => 'root',
        content => template('presto/hive.properties.erb'),
    }

    file {$install_dir:
        ensure  => directory,
        #source  => 'puppet:///modules/presto/presto-server-0.55',
        #source  => 'puppet:///modules/presto/presto-server-0.56',
        #source  => 'puppet:///modules/presto/presto-server-0.56-SNAPSHOT',
        source  => 'puppet:///modules/presto/presto-server-0.57-SNAPSHOT',
        mode    => '0744',
        recurse => true,
        owner   => 'root',
        group   => 'root',
    }

    


}
