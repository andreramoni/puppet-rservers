class rservers::testing {
  class { '::icinga2':
    manage_repo => true,
    features    => ['checker', 'mainlog', 'command'],
  }
  include ::mysql::server

  mysql::db { 'icinga2':
    user     => 'icinga2',
    password => 'icinga2',
    host     => '127.0.0.1',
    grant    => ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'DROP', 'CREATE VIEW', 'CREATE', 'INDEX', 'EXECUTE', 'ALTER'],
  }

  class{ '::icinga2::feature::idomysql':
    user          => 'icinga2',
    password      => 'icinga2',
    database      => 'icinga2',
    import_schema => true,
    require       => Mysql::Db['icinga2'],
  }  



  mysql::db { 'icingaweb2':
    user     => 'icingaweb2',
    password => 'icingaweb2',
    host     => 'localhost',
    grant    => ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'DROP', 'CREATE VIEW', 'CREATE', 'INDEX', 'EXECUTE', 'ALTER', 'REFERENCES'],
  }

  class {'icingaweb2':
    manage_repo   => false,
    import_schema => true,
    db_type       => 'mysql',
    db_host       => 'localhost',
    db_port       => 3306,
    db_username   => 'icingaweb2',
    db_password   => 'icingaweb2',
    require       => Mysql::Db['icingaweb2'],
  }


  icingaweb2::config::resource{'my-sql':
    type        => 'db',
    db_type     => 'mysql',
    host        => 'localhost',
    port        => '3306',
    db_name     => 'icingaweb2',
    db_username => 'icingaweb2',
    db_password => 'icingaweb2',
  }






}

