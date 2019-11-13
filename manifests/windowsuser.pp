# The default node defination matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catlog, *in addition* to any classes
# specified in the console for that node

node default {

  user { 'testuser1':
   ensure => present,
   password => 'Test!Us3r!',
   groups => 'Administrators'
  }

  group { 'Local Admins':
    name => 'Administrators',
    ensure => present,
    members => ['testuser1'], # other users, seprarate by commas
    auth_membership => false,
  }
  
}
