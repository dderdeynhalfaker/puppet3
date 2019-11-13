group { 'devs':
  ensure => present,
  gid    => 3000,
}

user { 'zpadilla':
  ensure => absent,
  uid    => '3001',
  home   => '/home/zpadilla',
  shell  => '/bin/bash',
  groups => ['devs'],
}
