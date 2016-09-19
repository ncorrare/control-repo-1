class profile::windows::logonmessage (
  $motdmessage   = hiera('motdmessage')
  ) {
    class { 'motd':
      content => $motdmessage,
    }
}
