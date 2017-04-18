Racker::Processor.register_template do |t|
  t.provisioners = {
    10 => {
      'upload-guest-files' => {
        'type'              => 'file',
        'source'            => '{{user `guest_files_path`}}',
        'destination'       => 'C:\\ProgramData\\packer'
      }
    },
    20 => {
      'install-ps-modules' => {
        'type'              => 'powershell',
        'script'            => '{{user `scripts_dir`}}install_ps_modules.ps1',
        'elevated_user'     => '{{user `winrm_user`}}',
        'elevated_password' => '{{user `winrm_pass`}}'
      }
    },
    900 => {
      'configure-upldates' => {
        'type'              => 'powershell',
        'script'            => '{{user `scripts_dir`}}configure_updates.ps1',
        'elevated_user'     => '{{user `winrm_user`}}',
        'elevated_password' => '{{user `winrm_pass`}}'
      }
    },
    910 => {
      'install-updates' => {
        'type'              => 'powershell',
        'script'            => '{{user `scripts_dir`}}install_windows_updates.ps1',
        'elevated_user'     => '{{user `winrm_user`}}',
        'elevated_password' => '{{user `winrm_pass`}}'
      }
    },
    920 => {
      'post-update-restart' => {
        'type'              => 'windows-restart',
        'restart_timeout'   => '30m'
      }
    },
    998 => {
      'cleanup' => {
        'type'              => 'powershell',
        'script'            => '{{user `scripts_dir`}}cleanup.ps1',
        'elevated_user'     => '{{user `winrm_user`}}',
        'elevated_password' => '{{user `winrm_pass`}}',
        'pause_before'      => '30s'
      }
    },
    999 => {
      'post-cleanup-restart' => {
        'type'              => 'windows-restart',
        'restart_timeout'   => '30m'
      }
    }
  }
end
