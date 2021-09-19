@ECHO ON
rem -------------------------------------------------------------------------------
rem         See C:\Users\herbk\Dropbox\PcControl\DevicesInventory.log for results
rem -------------------------------------------------------------------------------
rem Choose your path:
rem set myPath=D:\Dropbox
set myPath=C:\Users\herbk\Dropbox

cscript %myPath%\PcControl\DeviceInventory.vbs > %myPath%\PcControl\DeviceInventory.log

START "" notepad.exe %myPath%\PcControl\DeviceInventory.log
PAUSE
 