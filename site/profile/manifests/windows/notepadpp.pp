class profile::windows::notepadpp {
  package { 'notepadplusplus':
    ensure   => latest,
    provider => chocolatey,
  }
}
