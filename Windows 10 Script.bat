@echo off
echo Copyright (c) Army999

set functions=Firewall localsecpol audit delfiles remoteDesk

:Firewall
netsh advfirewall set allprofiles state on
netsh advfirewall reset
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
goto:EOF
