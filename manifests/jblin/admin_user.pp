class rservers::jblin::admin_user {
  user { 'admin':
    ensure           => 'present',
    groups           => ['wheel','users'],
    managehome       => true,
    home             => '/home/admin',
    password         => '$5$WcnT3Zb2$RS.VJHPUBPw4r5nbGqnPEqvsq3GJsBSZwFdxt7GVow0',
    password_max_age => '99999',
    password_min_age => '0',
    shell            => '/bin/bash',
  }
}
