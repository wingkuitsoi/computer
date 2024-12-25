<# : batch script
:: Install OpenSSH server in Windows 11 by Powershell.
@echo off
powershell -nop ^
"if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { ^
    Start-Process -Verb RunAs 'cmd.exe' -ArgumentList '/c %~dpnx0 %*' ^
} ^
else { ^
    Invoke-Expression ('$args = @(''%*'' -split '' '')' + [System.IO.File]::ReadAllText('%~f0')) ^
}"
goto :eof
#>
Write-Output Loading...
if (!(New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) { Write-Output "Elevation is needed."; pause; exit } 
if (!(Get-WindowsCapability -Online | Where-Object { $_.Name -like 'OpenSSH.Server*' -and $_.State -like "Installed" })) { Write-Output "OpenSSH Server is installing."; Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0 } ; Write-Output "OpenSSH Server is installed."
Pause
