@ECHO ON
rem -----------------------------------------------
rem        Set the path and start
rem -----------------------------------------------
rem Choose your path:
rem set myPath=D:\Dropbox\gitHub
set myPath=C:\Users\herbk\Dropbox\gitHub
set hubitatIp=http://192.168.1.103/

rem -----------------------------------------------
rem                   Call the main loop
rem -----------------------------------------------
cscript %myPath%\PcControl\DeviceManagment\GetValueBatteryLevel\2-LOOP.vbs
PAUSE

 