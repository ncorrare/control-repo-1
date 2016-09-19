class profile::windows::logonmessage (
  $motdmessage   = hiera('motdmessage')
  ) {
    class { 'motd':
      message => $motdmessage,
    }
}
