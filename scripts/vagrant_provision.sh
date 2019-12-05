#!/bin/bash
# Puppet install script for RHEL 7
#
# Things to do before running this:
# 1) Make sure you have a GitHub repo
# 2) Setup a personal access token for the pull
#
#Install Puppet and dependencies then cleanup installer
#
wget https://yum.puppetlabs.com/puppet6-release-el-7.noarch.rpm
rpm -i puppet6-release-el-7.noarch.rpm
yum update
yum -y install git puppet-agent rubygems gcc gcc-c++
echo 'Defaults        secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin"' >/etc/sudoers.d/puppet
/opt/puppetlabs/puppet/bin/gem install gpgme --no-rdoc --no-ri
/opt/puppetlabs/puppet/bin/gem install hiera-eyaml-gpg --no-rdoc --no-ri
/opt/puppetlabs/puppet/bin/gem install r10k --no-rdoc --no-ri
bash # Refresh bash for path changes to work during version check
puppet --version #To check the version, "puppet" should be in path
rm -y puppet6-release-el-7.noarch.rpm
#
# Setup GitHub Repo and make a local copy
#
cd /etc/puppetlabs/code/environments
mv production production.old #change this to remove later if script works
git init
git config --global user.name "Puppet Installer"
git config --global user.email "devops@vafsc.com"
# Create personal access token (ex below. dd7 to 756) to auth without user/pw. Grant repo access and read package access.
git clone https://dd7c7210451b9537229149b713a526aa0c226756:x-oauth-basic@github.com/dderdeynhalfaker/PuppetBook.git production # no-edit so no commit message needed
# if credential issue, run git config --global --unset credential.helper then the pull command again
cd production/
git pull
#if the pull doesnt work without credentials, use this: git pull --no-edit https://dd7c7210451b9537229149b713a526aa0c226756:x-oauth-basic@github.com/dderdeynhalfaker/PuppetBook.git
#
# Time to setup auto github pull cronjob script
# change time window with production/manifests/githubcronjob.sh, or shell script in /files/githubcronjob.sh
puppet apply manifests/
#the job should be working if you see no errors and run-puppet ensure created

