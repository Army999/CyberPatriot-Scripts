@echo off
echo Copyright (c) Army999

:Firewall
netsh advfirewall set allprofiles state on
goto:EOF

:lsp
net accounts /minpwlen:8
net accounts /lockoutthreshold:5
net accounts /maxpwage:30
net accounts /uniquepw:5
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

