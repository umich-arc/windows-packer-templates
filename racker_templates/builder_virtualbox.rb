Racker::Processor.register_template do |t|
  t.builders['virtualbox-iso'] = {
    'type'                      => 'virtualbox-iso',
    'headless'                  => true,
    'iso_checksum'              => '{{user `iso_checksum`}}',
    'iso_checksum_type'         => '{{user `iso_checksum_type`}}',
    'iso_url'                   => '{{user `iso_url`}}',
    'vm_name'                   => '{{user `vm_name`}}',
    'floppy_files'              => {
      'unattend'    => '{{user `unattend_file`}}',
      'logon'       => 'scripts/firstLogon.ps1',
      'net-1'       => '{{user `virtio_dir`}}NetKVM/{{user `os_version`}}/amd64/*.inf',
      'net-2'       => '{{user `virtio_dir`}}NetKVM/{{user `os_version`}}/amd64/*.sys',
      'net-3'       => '{{user `virtio_dir`}}NetKVM/{{user `os_version`}}/amd64/*.cat',
      'scsi-1'      => '{{user `virtio_dir`}}vioscsi/{{user `os_version`}}/amd64/*.inf',
      'scsi-2'      => '{{user `virtio_dir`}}vioscsi/{{user `os_version`}}/amd64/*.sys',
      'scsi-3'      => '{{user `virtio_dir`}}vioscsi/{{user `os_version`}}/amd64/*.cat',
      'stor-1'      => '{{user `virtio_dir`}}viostor/{{user `os_version`}}/amd64/*.inf',
      'stor-2'      => '{{user `virtio_dir`}}viostor/{{user `os_version`}}/amd64/*.sys',
      'stor-3'      => '{{user `virtio_dir`}}viostor/{{user `os_version`}}/amd64/*.cat'
    },
    'communicator'              => 'winrm',
    'winrm_username'            => '{{user `winrm_user`}}',
    'winrm_password'            => '{{user `winrm_pass`}}',
    'winrm_timeout'             => '1h',
    'shutdown_command'          => '{{user `shutdown_cmd`}}',
    'shutdown_timeout'          => '{{user `shutdown_timeout`}}',
    'post_shutdown_delay'       => '1m',
    'disk_size'                 => '{{user `disk_size_mb`}}',
    'guest_additions_mode'      => '{{user `guest_additions_mode`}}',
    'guest_os_type'             => 'Windows10_64',
    'vboxmanage'                => {
      'ram'         => ['modifyvm', '{{.Name}}', '--memory', '{{user `vm_ram_mb`}}'],
      'vram'        => ['modifyvm', '{{.Name}}', '--vram', '{{user `vm_vram_mb`}}'],
      'num-cores'   => ['modifyvm', '{{.Name}}', '--cpus', '{{user `vm_cpu`}}']
    }
  }
  t.variables = {
    'guest_additions_mode' => 'disable',
    'vm_vram_mb'           => '48'
  }
end
