class profile::windows::logonmessage (
  $motdmessage,
  ) {
    class { 'motd':
      content => $motdmessage,
    }
}
