class profile::windows::time (
  $ntpservers    = hiera('ntpservers'),
  ) {
    class { 'windowstime':
      servers => $ntpservers,
    }
  }
