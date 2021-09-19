@ECHO OFF
rem MODE 100
mode con: cols=55 lines=5
rem ---------------------------------------------------------------------
rem    Close Photos
rem ---------------------------------------------------------------------
TIMEOUT 40
rem powershell (Get-Process)
rem powershell (Microsoft.Photos)Process.Kill
rem powershell (ps Microsoft.Photos).CloseMainWindow()
rem powershell (ps Photos).CloseMainWindow()
powershell taskkill /im Microsoft.Photos.exe /f
rem PAUSE


