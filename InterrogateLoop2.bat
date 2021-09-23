@ECHO OFF
rem ---------------------------------------------------------------------------
rem                               2nd of 3 loops
rem ---------------------------------------------------------------------------
rem Choose your path: Note: this was set in Parent Process (0-START_HERE) only used here for testing
rem set myPath=D:\Dropbox
rem set myPath=C:\Users\herbk\Dropbox

rem ------------------------------------------------------------------
rem     check for a pause in execution
rem ------------------------------------------------------------------
rem START %myPath%"\PcControl\checkIfExecutionPaused.bat"
if NOT %executionPaused%=="YES" (
  echo ----------------------------------------------------------------
  echo Current date and time: %yyyy-mm-dd% %time%
  echo execution is NOT paused
  echo ----------------------------------------------------------------
)

:start
if %executionPaused%=="YES" (
  echo ----------------------------------------------------------------
  echo Current date and time: %yyyy-mm-dd% %time%
  echo execution is paused
  echo ----------------------------------------------------------------
  goto skip_it
)
  ECHO =============================================================================
  ECHO                         START LOOP 2
  ECHO =============================================================================
  rem cscript %myPath%"\PcControl\SecurityLog\BackDoorOPEN.vbs"
  rem cscript %myPath%"\PcControl\SecurityLog\BackDoorCLOSED.vbs"
  rem cscript %myPath%"\PcControl\SecurityLog\FrontDoorOPEN.vbs"
  rem cscript %myPath%"\PcControl\SecurityLog\FrontDoorCLOSED.vbs"
  rem cscript %myPath%"\PcControl\SecurityLog\GarageDoorOPEN.vbs"
  rem cscript %myPath%"\PcControl\SecurityLog\GarageDoorCLOSED.vbs"
  
  rem cscript %myPath%\PcControl\Wyze\RollCallWyzeCam.vbs
  rem cscript %myPath%"\PcControl\RestartTheLoops\InterrogateRestartTheLoops.vbs
  


  ECHO =============================================================================
  ECHO                          END LOOP 2
  ECHO =============================================================================
 cscript %myPath%"\PcControl\Dashboard\updateLoop2Counter.vbs"
:skip_it
  TIMEOUT %LOOP_TIMEOUT%

  set "hour=%time:~0,2%
  set "minute=%time:~3,2%
  set executionPaused="NO"
  if %hour% EQU 3 if %minute% GEQ 55 set executionPaused="YES"
  if %hour% EQU 4 if %minute% LEQ 5 set executionPaused="YES"
goto start