@echo off

if not exist setup-x86_64.exe (
    echo Download setup-x86_64.exe from cygwin.com and put it in the same directory as this batch file.
    set ERRORLEVEL=1
    goto :EOF
)

set root=%USERPROFILE%\Software\cygwin
set packages=%root%\packages
set mirror=http://cygwin.mirrors.hoobly.com/
setx HOME %USERPROFILE%


.\setup-x86_64.exe ^
    --no-admin ^
    --quiet-mode ^
    --site %mirror% ^
    --root %root% ^
    --local-package-dir %packages% ^
    --wait ^
    --no-startmenu ^
    --no-desktop ^
    --packages tmux,vim,openssl,gcc-g++,git,rlwrap,curl,wget,zip,unzip ^
    > setup.stdout

copy /Y minttyrc %USERPROFILE%\.minttyrc
copy /Y tmux.conf %USERPROFILE%\.tmux.conf

mkshortcut /target:"%root%\bin\mintty" /arguments:"/bin/bash -l" /shortcut:"Cygwin"
pin-to-taskbar /shortcut:"Cygwin.lnk"
