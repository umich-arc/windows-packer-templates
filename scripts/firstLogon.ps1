Set-ExecutionPolicy Bypass -Force

#Change Power Settings
$p = Get-CimInstance -Name root\cimv2\power -Class win32_PowerPlan -Filter "ElementName = 'High Performance'"
Invoke-CimMethod -InputObject $p -MethodName Activate
powercfg -x -monitor-timeout-ac 0

#Fix networking
reg ADD HKLM\SYSTEM\CurrentControlSet\Control\Network\NewNetworkWindowOff /f

#Add local script folder
New-Item -ItemType Directory -Path C:\ProgramData\packer -Force

#Enable WinRM
netsh advfirewall firewall add rule name="WinRM-HTTP" dir=in localport=5985 protocol=TCP action=allow
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
cmd /c "sc config winrm start= delayed-auto"
