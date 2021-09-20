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

  cscript %myPath%"\PcControl\AlexaShowMe\RollCallWeather.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallCameras.vbs"
  
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallMusic.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallLindaMusic.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallMenu.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallSecurityLog.vbs"

  cscript %myPath%"\PcControl\AlexaShowMe\RollCallCalendar.vbs"

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