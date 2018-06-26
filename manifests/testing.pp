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
}

