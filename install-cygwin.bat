@echo off

call config.bat

setx HOME %%USERPROFILE%%

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
