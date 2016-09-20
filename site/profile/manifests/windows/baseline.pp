class profile::windows::baseline {

  reboot { 'afterpowershell':
    subscribe => Package['powershell'],
    timeout   => 10,
  }

  service { 'wuauserv':
    ensure => 'running',
    enable => 'true',
  }

  package { 'powershell':
    ensure   => latest,
    provider => 'chocolatey',
  }
  #Set up the right info in the Desktop Background

  include bginfo

  #Install Software

  include profile::windows::chocolatey
  include profile::windows::notepadpp
  include profile::windows::jre8

  #Configure the Log-On message

  include profile::windows::logonmessage

  #Example Local Admin implementation, using Puppet Types

  #user { $localadmin:
  #  ensure   => present,
  #  password => $adminpassword,
  #}

  include profile::windows::localadmin

  #Basic Firewall Rules

  include profile::windows::basefirewall

  #Time Configuration

  include profile::windows::time
}
