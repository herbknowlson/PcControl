@ECHO ON
rem -----------------------------------------------
rem           Set the path for testing 
rem -----------------------------------------------
rem Choose your path:
set myPath=D:\Dropbox\gitHub
rem set myPath=C:\Users\herbk\Dropbox\gitHub

rem -----------------------------------------------
rem         Call the main loop for testing
rem -----------------------------------------------
cscript %myPath%\PcControl\RestartTheLoops\InterrogateRestartTheLoops.vbs
PAUSE

 