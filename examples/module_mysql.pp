# Install MySQL and set up an example database
include ::mysql::server
#
mysql::db { 'cat_pictures':
  user     => 'greebo',
  password => 'tabby',
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
}
#include ::mysql::server
#mysql::db { 'mydb':
#  user     => 'myuser',
#  password => 'mypass',
#  host     => 'localhost',
#  grant    => ['SELECT', 'UPDATE'],
#}
