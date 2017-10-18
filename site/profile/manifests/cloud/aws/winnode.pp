define profile::cloud::aws::winnode (
  $nodename = $title,
  $availability_zone = 'us-east-1a',
  $image_id = 'ami-c6e9d9bd',
  $region = 'us-east-1',
  $instance_type = 'm3.medium',
  $security_groups = ['tse-us-east-1-agents', 'tse-us-east-1-master', 'tse-us-east-1-crossconnect'],
  $subnet = 'tse-us-east-1-avza',
  $pp_department = 'TSE',
  $pp_project = 'DemoForCustomer',
  $pp_created_by = 'matthew.yates',
  $key_name = 'matthew-yates-key',
  $master_ip = '10.90.30.181',
  $master_host = 'puppet.example.com',
  $agent_role = 'base',
) {

  ec2_instance { $nodename:
    ensure            => 'running',
    availability_zone => $availability_zone,
    image_id          => $image_id,
    instance_type     => $instance_type,
    key_name          => $key_name,
    region            => $region,
    security_groups   => $security_groups,
    subnet            => $subnet,
    tags              => {
      'department' => $pp_department,
      'project'    => $pp_project,
      'created_by' => $pp_created_by,
    },
    user_data         => template('data/bootstrap_agent.ps1.erb'),
  }


}
