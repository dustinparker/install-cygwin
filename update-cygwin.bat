@echo off

call config.bat

.\setup-x86_64.exe ^
    --no-admin ^
    --quiet-mode ^
    --site %mirror% ^
    --root %root% ^
    --local-package-dir %packages% ^
    --wait ^
    --no-startmenu ^
    --no-desktop ^
    --upgrade-also ^
    > setup.stdout
