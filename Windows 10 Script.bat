@echo off
echo Copyright (c) Army999

set functions=Firewall localsecpol audit delfiles remoteDesk diableGueAdm ftp ssh insremoval servicestop

:Firewall
netsh advfirewall set allprofiles state on
netsh advfirewall reset

:localsecpol
net accounts /minpwlen:8
net accounts /lockoutthreshold:5
net accounts /maxpwage:30
net accounts /uniquepw:5
net accounts /lockoutduration:30
net accounts /lockoutthreshold:6
net accounts /lockoutwindow:30
start secpol.msc /wait
pause 


:audit
auditpol /set /category:* /success:enable
auditpol /set /category:* /failure:enable


:delfiles
del *.mp4
del *.mp3
del *.mov
del *.avi
del *.mpg
del *.mpeg
del *.flac
del *.m4a
del *.flv
del *.ogg
del *.gif
del *.png
del *.jpg
del *.jpeg


:remoteDesk
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
netsh advfirewall firewall add rule name="!CyberPatriotTCPOutRDPBlock" protocol=TCP dir=out remoteport=135 action=block
netsh advfirewall firewall add rule name="!CyberPatriotTCPInRDPBlock" protocol=TCP dir=in remoteport=135 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPOutRDPBlock" protocol=UDP dir=out remoteport=135 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPInRDPBlock" protocol=UDP dir=in remoteport=135 action=block


:ftp 
netsh advfirewall firewall add rule name="!CyberPatriotTCPOutFTPBlock" protocol=TCP dir=out remoteport=20,21 action=block
netsh advfirewall firewall add rule name="!CyberPatriotTCPInFTPBlock" protocol=TCP dir=in remoteport=20,21 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPOutFTPBlock" protocol=UDP dir=out remoteport=20,21 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPInFTPBlock" protocol=UDP dir=in remoteport=20,21 action=block


:ssh
netsh advfirewall firewall add rule name="!CyberPatriotTCPOutSSHBlock" protocol=TCP dir=out remoteport=22 action=block
netsh advfirewall firewall add rule name="!CyberPatriotTCPInSSHBlock" protocol=TCP dir=in remoteport=22 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPOutSSHBlock" protocol=UDP dir=out remoteport=22 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPInSSHBlock" protocol=UDP dir=in remoteport=22 action=block


:rdp
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v AllowTSConnections /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=no


:insremoval
dism /online /disable-feature /featurename:IIS-WebServerRole
dism /online /disable-feature /featurename:IIS-WebServer
dism /online /disable-feature /featurename:IIS-CommonHttpFeatures
dism /online /disable-feature /featurename:IIS-HttpErrors
dism /online /disable-feature /featurename:IIS-HttpRedirect
dism /online /disable-feature /featurename:IIS-ApplicationDevelopment
dism /online /disable-feature /featurename:IIS-NetFxExtensibility
dism /online /disable-feature /featurename:IIS-NetFxExtensibility45
dism /online /disable-feature /featurename:IIS-HealthAndDiagnostics
dism /online /disable-feature /featurename:IIS-HttpLogging
dism /online /disable-feature /featurename:IIS-LoggingLibraries
dism /online /disable-feature /featurename:IIS-RequestMonitor
dism /online /disable-feature /featurename:IIS-HttpTracing
dism /online /disable-feature /featurename:IIS-Security
dism /online /disable-feature /featurename:IIS-URLAuthorization
dism /online /disable-feature /featurename:IIS-RequestFiltering
dism /online /disable-feature /featurename:IIS-IPSecurity
dism /online /disable-feature /featurename:IIS-Performance
dism /online /disable-feature /featurename:IIS-HttpCompressionDynamic
dism /online /disable-feature /featurename:IIS-WebServerManagementTools
dism /online /disable-feature /featurename:IIS-ManagementScriptingTools
dism /online /disable-feature /featurename:IIS-IIS6ManagementCompatibility
dism /online /disable-feature /featurename:IIS-Metabase
dism /online /disable-feature /featurename:IIS-HostableWebCore
dism /online /disable-feature /featurename:IIS-StaticContent
dism /online /disable-feature /featurename:IIS-DefaultDocument
dism /online /disable-feature /featurename:IIS-DirectoryBrowsing
dism /online /disable-feature /featurename:IIS-WebDAV
dism /online /disable-feature /featurename:IIS-WebSockets
dism /online /disable-feature /featurename:IIS-ApplicationInit
dism /online /disable-feature /featurename:IIS-ASPNET
dism /online /disable-feature /featurename:IIS-ASPNET45
dism /online /disable-feature /featurename:IIS-ASP
dism /online /disable-feature /featurename:IIS-CGI
dism /online /disable-feature /featurename:IIS-ISAPIExtensions
dism /online /disable-feature /featurename:IIS-ISAPIFilter
dism /online /disable-feature /featurename:IIS-ServerSideIncludes
dism /online /disable-feature /featurename:IIS-CustomLogging
dism /online /disable-feature /featurename:IIS-BasicAuthentication
dism /online /disable-feature /featurename:IIS-HttpCompressionStatic
dism /online /disable-feature /featurename:IIS-ManagementConsole
dism /online /disable-feature /featurename:IIS-ManagementService
dism /online /disable-feature /featurename:IIS-WMICompatibility
dism /online /disable-feature /featurename:IIS-LegacyScripts
dism /online /disable-feature /featurename:IIS-LegacySnapIn
dism /online /disable-feature /featurename:IIS-FTPServer
dism /online /disable-feature /featurename:IIS-FTPSvc
dism /online /disable-feature /featurename:IIS-FTPExtensibility
dism /online /disable-feature /featurename:TFTP
dism /online /disable-feature /featurename:TelnetClient
dism /online /disable-feature /featurename:TelnetServer

servicestop:
Stop-Service -Name "Remote Registry"
Stop-Service -Name "SNMP Trap"
Stop-Service -Name "SSDP Discovery"
Stop-Service -Name "
Stop-Service -Name
Stop-Service -Name
Stop-Service -Name
Stop-Service -Name
Stop-Service -Name


exit
