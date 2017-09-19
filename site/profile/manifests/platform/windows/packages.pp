class profile::platform::windows::packages {
 package { 'googlechrome':
  ensure   => installed,
  provider => 'chocolatey',
}
}
