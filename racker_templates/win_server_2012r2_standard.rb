Racker::Processor.register_template do |t|
  t.variables = {
      'iso_checksum'              => '5b5e08c490ad16b59b1d9fab0def883a',
      'iso_checksum_type'         => 'md5',
      'iso_url'                   => 'http://care.dlservice.microsoft.com/dl/download/6/2/A/62A76ABB-9990-4EFC-A4FE-C7D698DAEB96/9600.17050.WINBLUE_REFRESH.140317-1640_X64FRE_SERVER_EVAL_EN-US-IR3_SSS_X64FREE_EN-US_DV9.ISO',
      'os_version'                => '2k12R2'
  }
  t.provisioners = {
    0 => {
      'install-powershell-5' => {
        'type'              => 'powershell',
        'script'            => '{{user `scripts_dir`}}install_powershell_5.ps1',
        'elevated_user'     => '{{user `winrm_user`}}',
        'elevated_password' => '{{user `winrm_pass`}}',
        'pause_before'      => '30s'
      }
    },
    19 => {
      'windows-restart' => {
        'type'              => 'windows-restart',
        'restart_timeout'   => '30m'
      }
    }
  }
end
