class rservers::images::backup_nfs {
  mount { '/backup':
    ensure  => 'mounted',
    device  => 'backup.ext.lab:/data',
    dump    => '0',
    fstype  => 'nfs4',
    options => 'defaults',
    pass    => '0',
    target  => '/etc/fstab',
  }
}

