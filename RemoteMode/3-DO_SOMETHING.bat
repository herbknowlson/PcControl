@ECHO OFF
rem ----------------------------------------------------------------------------------
rem  By default, Windows 10 stores your wallpaper images in the “C:WindowsWeb” directory. 
rem  You can access this directory very simply by clicking in the search bar in the Windows 10 taskbar 
rem  and type “c:windowsweb” and hitting return.
rem
rem  The registry method doesn't work all the time especially if the picture isn't in bmp format so you can try my method. 
rem  It simply open the picture you want using windows photo viewer and use a keyboard shortcut to set the picture as your desktop wallpaper.
rem
rem ----------------------------------------------------------------------------------
rem reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d path.bmp /f 
rem reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d e:/image.bmp /f 
rem RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters 
pause 



