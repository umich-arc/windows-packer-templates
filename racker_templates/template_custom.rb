Racker::Processor.register_template do |t|
  t.variables = {
    'packages_file' => 'configuration_files/packages.config'
  }
  t.provisioners = {
    100 => {
      'upload-package-file' => {
        'type'          => 'file',
        'source'        => '{{user `packages_file`}}',
        'destination'   => 'C:\\ProgramData\\packer\\packages.config'
      }
    },
    101 => {
      'install-software-packages' => {
        'type'              => 'powershell',
        'script'            => '{{user `scripts_dir`}}install_software_packages.ps1',
        'elevated_user'     => '{{user `winrm_user`}}',
        'elevated_password' => '{{user `winrm_pass`}}'
      }
    }
  }
end
