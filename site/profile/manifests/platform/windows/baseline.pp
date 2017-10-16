class profile::platform::windows::baseline {
  ### Creation of users
  user { 'Pierre':
    ensure   => present,
        }
   group { 'Puppet':
      ensure  => 'present',
      members => ['Pierre'],
    
        }
### Directory creation 
file { 'c:/tmp/homework':
    ensure => 'directory',
    owner => 'Pierre',
    group => 'Puppet',
  }
  
 ### Permissions 
  acl { 'c:/tmp/homework':
  permissions => [
   { identity => 'Pierre', rights => ['full'] },
   { identity => 'Local', rights => ['read'] }
 ],
}
 ### Registry changes in order to enable IE enhanced security configuration
 registry_value { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
  ensure => present,
  type   => dword,
  data   => "1",
}
 ### Registry changes in order Windows Shutdown Event Tracker
 registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability\ShutdownReasonOn':
  ensure => present,
  type   => dword,
  data   => "1",
}
### CUSTOM APPLICATION FIREWALL RULE
  windows_firewall::exception { 'TSErule':
    ensure       => present,
    direction    => 'in',
    action       => 'Allow',
    enabled      => 'yes',
    protocol     => 'TCP',
    local_port   => '8080',
    display_name => 'SE PUPPET DEMO',
    description  => 'Inbound rule example for demo purposes',
  }
}
