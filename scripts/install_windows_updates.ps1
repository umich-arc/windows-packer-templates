# Silence progress bars in PowerShell, which can sometimes feed back strange
# XML data to the Packer output.
$ProgressPreference = "SilentlyContinue"

Write-Output "Starting Windows Update Installation"
Get-WUInstall -AcceptAll -WindowsUpdate -IgnoreReboot

if (Get-WUServiceManager | ? { $_.ServiceID -eq "7971f918-a847-4430-9279-4a52d1efe18d"}){
  Write-Output "Starting Microsoft Software Update Installation"
  Get-WUInstall -AcceptAll -MicrosoftUpdate Software -IgnoreReboot
}

Write-Output "Ended Windows Update Installation"
