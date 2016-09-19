class profile::windows::basefirewall (
  $openports     = hiera('openports'),
  ) {
  dsc_xfirewall { $openports:
    dsc_name      => "Puppet - Allow $name",
    dsc_ensure    => 'present',
    dsc_direction => 'Inbound',
    dsc_localport => $name,
    dsc_protocol  => 'TCP',
    dsc_action    => 'Allow',
  }
}
