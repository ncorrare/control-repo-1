class profile::windows::basefirewall (
  $openports,
  ) {
  $openports.each |Integer $port| {
    dsc_xfirewall { "Allow TCP/$port":
      dsc_name      => "Puppet - Allow $port",
      dsc_ensure    => 'present',
      dsc_direction => 'Inbound',
      dsc_localport => "$port",
      dsc_protocol  => 'TCP',
      dsc_action    => 'Allow',
    }
  }
}
