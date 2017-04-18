Racker::Processor.register_template do |t|
  t.variables = {
    'vm_name'               => '{{env `VM_NAME`}}-{{isotime "2006-01-02"}}',
    'headless'              => 'true',
    'vm_cpu'                => '{{env `NUM_CPU`}}',
    'vm_ram_mb'             => '{{env `MB_RAM`}}',
    'shutdown_cmd'          => 'C:\\ProgramData\\packer\\unattendShutdown.bat',
    'shutdown_timeout'      => '30m',
    'disk_size_mb'          => '{{env `DISK_SIZE`}}',
    'winrm_user'            => '{{env `WINRM_USER`}}',
    'winrm_pass'            => '{{env `WINRM_PASS`}}',
    'virtio_dir'            => '{{env `PACKER_TEMPLATE_ROOT`}}drivers/',
    'scripts_dir'           => '{{env `PACKER_TEMPLATE_ROOT`}}scripts/',
    'cloudbase_config_dir'  => '{{env `CLOUDBASE_CONFIG_ROOT`}}cloudbase_config/',
    'unattend_file'         => '{{env `UNATTEND_FILE`}}',
    'guest_files_path'      => '{{env `GUEST_FILES_ROOT`}}guest_os_files/'
  }
end
