Racker::Processor.register_template do |t|
  t.variables = {
    'output_dir'            => '/tmp/{{env `VM_NAME`}}/{{isotime "2006-01-02"}}'
  }
  t.builders['qemu'] = {
    'type'                      => 'qemu',
    'qemu_binary'               => '/usr/libexec/qemu-kvm',
    'headless'                  => true,
    'format'                    => 'raw',
    'net_device'                => 'virtio-net',
    'iso_checksum'              => '{{user `iso_checksum`}}',
    'iso_checksum_type'         => '{{user `iso_checksum_type`}}',
    'iso_url'                   => '{{user `iso_url`}}',
    'vm_name'                   => '{{user `vm_name`}}',
    'floppy_files'              => {
      'unattend'    => '{{user `unattend_file`}}',
      'logon'       => '{{user `scripts_dir`}}firstLogon.ps1',
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
    'output_directory'          => '{{user `output_dir`}}',
    'disk_size'                 => '{{user `disk_size_mb`}}',
    'disk_interface'            => 'virtio',
    'qemuargs'                  => {
      'ram'         => ['-m', '{{user `vm_ram_mb`}}M'],
      'cpu-type'    => ['-cpu', 'Haswell'],
      'num-cores'   => ['-smp', '{{user `vm_cpu`}}'],
      'net-dev'     => ['-netdev', 'user,hostfwd=tcp::{{.SSHHostPort}}-:5985,id=forward'],
      'device'      => ['-device', 'virtio-net,netdev=forward,id=net0']
    }
  }
end
