class presto::worker (
    $master,
) {
    class {'presto': 
        master => $master,
    }
}
