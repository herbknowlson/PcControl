@ECHO OFF
rem ---------------------------------------------------------------------------
rem                               1st of 3 loops
rem ---------------------------------------------------------------------------
rem Choose your path: Note: this was set in Parent Process (0-START_HERE) only used here for testing
rem set myPath=D:\Dropbox
rem set myPath=C:\Users\herbk\Dropbox

rem ------------------------------------------------------------------
rem     check for a pause in execution
rem ------------------------------------------------------------------
if NOT %executionPaused%=="YES" (
  echo ----------------------------------------------------------------
  echo Current date and time: %yyyy-mm-dd% %time%
  echo execution is NOT paused
  echo ----------------------------------------------------------------
)

  START %myPath%"\PcControl\InterrogateLoop2.bat - Shortcut.lnk"
  START %myPath%"\PcControl\InterrogateLoop3.bat - Shortcut.lnk"

:start
if %executionPaused%=="YES" (
  echo ----------------------------------------------------------------
  echo Current date and time: %yyyy-mm-dd% %time%
  echo execution is paused
  echo ----------------------------------------------------------------
  goto skip_it
)
  ECHO =============================================================================
  ECHO                         START LOOP 1
  ECHO =============================================================================

  cscript %myPath%"\PcControl\AlexaMoveTheMouse\RollCallReolink.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallCalendar.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallCameras.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallLindaMusic.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallMenu.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallPhotos.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallSecurityLog.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallWeather.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallYouTube.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallMusic1.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallDashboard.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallChrome.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallGuitarFusion.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCalliTunes.vbs"
  
  ECHO =============================================================================
  ECHO                         END LOOP 1
  ECHO =============================================================================
  cscript %myPath%"\PcControl\Dashboard\updateLoop1Counter.vbs" 
:skip_it
  TIMEOUT 2

  set "hour=%time:~0,2%
  set "minute=%time:~3,2%
  set executionPaused="NO"
  if %hour% EQU 3 if %minute% GEQ 55 set executionPaused="YES"
  if %hour% EQU 4 if %minute% LEQ 5 set executionPaused="YES"
goto start