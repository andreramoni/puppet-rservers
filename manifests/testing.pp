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
    port        => 3306,
    db_name     => 'icingaweb2',
    db_username => 'icingaweb2',
    db_password => 'icingaweb2',
  }




  class {'icingaweb2::module::monitoring':
    ido_host        => 'localhost',
    ido_db_name     => 'icinga2',
    ido_db_username => 'icinga2',
    ido_db_password => 'supersecret',
    commandtransports => {
      icinga2 => {
        transport => 'api',
        username  => 'root',
        password  => 'icinga',
      }
    }
  }
  




  class {'icingaweb2::module::director':
    git_revision  => 'v1.3.2',
    db_host       => 'localhost',
    db_name       => 'director',
    db_username   => 'director',
    db_password   => 'director',
    import_schema => true,
    kickstart     => true,
    endpoint      => $::fqdn,
    api_username  => 'root',
    api_password  => 'icinga',
    require       => Mysql::Db['director']
  }






}

