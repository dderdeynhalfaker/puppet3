define apache::vhost(
  $port          = '80',
  $docroot       = '/var/www/cat-pictures',
  $docroot_owner = 'root',
  $docroot_group = 'root',
)

file { '/var/www/cat-pictures/index.html':
  content => "<img src='http://bitfieldconsulting.com/files/happycat.jpg'>",
  owner   => 'root',
  group   => 'root',
}
