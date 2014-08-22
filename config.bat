set root=%USERPROFILE%\Software\cygwin
set packages=%root%\packages
set mirror=http://cygwin.mirrors.hoobly.com/

if not exist setup-x86_64.exe (
    echo Download setup-x86_64.exe from cygwin.com and put it in the same directory as this batch file.
    set ERRORLEVEL=1
    goto :EOF
)

