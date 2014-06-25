@echo off

set root=%USERPROFILE%\Software\cygwin2
set packages=%root%\packages
set mirror=http://cygwin.mirrors.hoobly.com/
setx HOME %USERPROFILE%

if not exist setup-x86_64.exe (
    echo "Download setup-x86_64.exe from cygwin.com and put it in the same directory as this batch file."
    exit 1
)

.\setup-x86_64.exe ^
    --no-admin ^
    --site %mirror% ^
    --root %root% ^
    --local-package-dir %packages% ^
    --wait ^
    --no-startmenu ^
    --no-desktop ^
    --packages tmux,vim,openssl,gcc-g++,git,rlwrap,curl,wget,zip,unzip

copy minttyrc %USERPROFILE%\.minttyrc
copy tmux.conf %USERPOFILE%\.tmux.conf

