$download_uri = "http://go.microsoft.com/fwlink/?LinkId=717507"
$installer_path = "C:\Windows\Temp\Win8.1AndW2K12R2-KB3134758-x64.msu"

function Get-Installer {
  $progressPreference = "silentlyContinue"
  Invoke-WebRequest -OutFile $installer_path $download_uri
}

function Install-Powershell {
  $p = Start-Process -PassThru -FilePath wusa -ArgumentList "$installer_path /quiet /norestart"
  Wait-Process -Id $p.id -Timeout 480
  if (($p.ExitCode -ne 0) -and ($p.ExitCode -ne 3010)) {
    $p.ExitCode
    Write-Error "ERROR: problem encountered during PowerShell install"
  }
}

Write-Host "BEGIN: install_powershell_5.ps1"
Write-Host "Downloading PowerShell from $download_uri"
Get-Installer
Write-Host "Installing PowerShell"
Install-Powershell
Write-Host "END: install_powershell_5.ps1"
