$ProgressPreference = 'SilentlyContinue'
Install-PackageProvider Nuget -Force
Install-Module cChoco -Force
Install-Module PSWindowsUpdate -Force
