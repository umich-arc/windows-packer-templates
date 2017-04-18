$ProgressPreference = "SilentlyContinue"

$MUSM = New-Object -ComObject "Microsoft.Update.ServiceManager"
if($?){$MUSM.AddService2("7971f918-a847-4430-9279-4a52d1efe18d",7,"")}

#Register Microsoft Update service if not already registered
if (! (Get-WUServiceManager | ? { $_.ServiceID -eq "7971f918-a847-4430-9279-4a52d1efe18d" } )){
  Add-WUServiceManager -ServiceID "7971f918-a847-4430-9279-4a52d1efe18d" -Confirm:$false
}
