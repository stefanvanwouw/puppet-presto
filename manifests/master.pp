class presto::master (
    
) {

    class {'presto': 
        master => $fqdn,
    }

}
