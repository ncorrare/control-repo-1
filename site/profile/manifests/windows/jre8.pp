class profile::windows::jre8 {
  package { 'jre8':
    ensure   => latest,
    provider => chocolatey,
  }
}
