@echo off
echo Copyright (c) Army999

set functions=Firewall localsecpol audit delfiles remoteDesk

:Firewall
netsh advfirewall set allprofiles state on
netsh advfirewall reset
netsh advfirewall firewall add rule name="!CyberPatriotTCPOut" protocol=TCP dir=out remoteport=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,23,37,53,69,79,87,109,110,111,119,123,137,138,139,143,161,162,179,389,411,412,445,512,513,514,515,540,636,1080,2000,2001,2049,3269,4001,4045,6001,8000,8080,8888 action=block
netsh advfirewall firewall add rule name="!CyberPatriotTCPIn" protocol=TCP dir=in remoteport=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,23,37,53,69,79,87,109,110,111,119,123,137,138,139,143,161,162,179,389,411,412,445,512,513,514,515,540,636,1080,2000,2001,2049,3269,4001,4045,6001,8000,8080,8888 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPOut" protocol=UDP dir=out remoteport=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,23,37,53,69,79,87,109,110,111,119,123,137,138,139,143,161,162,179,389,411,412,445,512,513,514,515,540,636,1080,2000,2001,2049,3269,4001,4045,6001,8000,8080,8888 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPIn" protocol=UDP dir=in remoteport=0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,23,37,53,69,79,87,109,110,111,119,123,137,138,139,143,161,162,179,389,411,412,445,512,513,514,515,540,636,1080,2000,2001,2049,3269,4001,4045,6001,8000,8080,8888 action=block
goto:EOF

:localsecpol
net accounts /minpwlen:8
net accounts /lockoutthreshold:5
net accounts /maxpwage:30
net accounts /uniquepw:5
net accounts /lockoutduration:30
net accounts /lockoutthreshold:3
net accounts /lockoutwindow:30
start secpol.msc /wait
pause 
goto:EOF

:audit
auditpol /set /category:* /success:enable
auditpol /set /category:* /failure:enable
goto:EOF

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
goto:EOF

:remoteDesk
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
netsh advfirewall firewall add rule name="!CyberPatriotTCPOutRDPBlock" protocol=TCP dir=out remoteport=135 action=block
netsh advfirewall firewall add rule name="!CyberPatriotTCPInRDPBlock" protocol=TCP dir=in remoteport=135 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPOutRDPBlock" protocol=UDP dir=out remoteport=135 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPInRDPBlock" protocol=UDP dir=in remoteport=135 action=block
goto:EOF

:ftp 
netsh advfirewall firewall add rule name="!CyberPatriotTCPOutFTPBlock" protocol=TCP dir=out remoteport=20,21 action=block
netsh advfirewall firewall add rule name="!CyberPatriotTCPInFTPBlock" protocol=TCP dir=in remoteport=20,21 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPOutFTPBlock" protocol=UDP dir=out remoteport=20,21 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPInFTPBlock" protocol=UDP dir=in remoteport=20,21 action=block
goto:EOF

:ssh
netsh advfirewall firewall add rule name="!CyberPatriotTCPOutSSHBlock" protocol=TCP dir=out remoteport=22 action=block
netsh advfirewall firewall add rule name="!CyberPatriotTCPInSSHBlock" protocol=TCP dir=in remoteport=22 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPOutSSHBlock" protocol=UDP dir=out remoteport=22 action=block
netsh advfirewall firewall add rule name="!CyberPatriotUDPInSSHBlock" protocol=UDP dir=in remoteport=22 action=block
goto:EOF

:rdp
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v AllowTSConnections /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fAllowToGetHelp /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v UserAuthentication /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=no
goto:EOF
