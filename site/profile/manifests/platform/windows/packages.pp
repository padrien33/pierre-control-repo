class profile::platform::windows::packages {
  class { '::packages':
  # CORP PACKAGES
  Package {
    ensure   => installed,
    provider => chocolatey,
  }
  package { 'googlechrome': }
  package { '7zip': }
  }
}
