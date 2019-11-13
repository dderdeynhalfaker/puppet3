# Set up regular Puppet runs
file { '/usr/local/bin/github-pull-puppet':
  source => '/etc/puppetlabs/code/environments/production/files/githubcronjob.sh',
  mode   => '0755',
}

cron { 'run-puppet':
  command => '/usr/local/bin/github-pull-puppet',
  hour    => '*',
  minute  => '*/1',
}
