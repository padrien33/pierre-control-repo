class profile::platform::windows::packages {
 Package {
    ensure   => installed,
    provider => chocolatey,
  }
  package { 'googlechrome': }
  package { 'notepadplusplus': }
  package { '7zip': }
}
