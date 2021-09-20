@ECHO OFF
rem ---------------------------------------------------------------------------
rem                                 3rd of 3 loops
rem ---------------------------------------------------------------------------
rem Choose your path: Note: this was set in Parent Process (0-START_HERE) only used here for testing
rem set myPath=D:\Dropbox
rem set myPath=C:\Users\herbk\Dropbox
rem set LOOP_TIMEOUT=3

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
  ECHO                         START LOOP 3
  ECHO =============================================================================
  cscript %myPath%"\PcControl\SecurityStatus\RollCallSecurityStatus.vbs"
  cscript %myPath%"\PcControl\AlexaMoveTheMouse\RollCallReolink.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallPhotos.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallYouTube.vbs"
 
  cscript %myPath%"\PcControl\SecurityLog\OutsideBackMotionDETECTED.vbs"
  cscript %myPath%"\PcControl\SecurityLog\OutsideBackMotionSTOPPED.vbs"
  cscript %myPath%"\PcControl\SecurityLog\OutsideFrontMotionDETECTED.vbs"
  cscript %myPath%"\PcControl\SecurityLog\OutsideFrontMotionSTOPPED.vbs"

  cscript %myPath%"\PcControl\AlexaShowMe\RollCallChrome.vbs"
  cscript %myPath%"\PcControl\AlexaShowMe\RollCallDashboard.vbs"
  
  cscript %myPath%"\PcControl\TimedAction\InterrogateSmartHomeActionNeeded.vbs"

  ECHO =============================================================================
  ECHO                           END LOOP 3
  ECHO =============================================================================
  cscript %myPath%"\PcControl\Dashboard\updateLoop3Counter.vbs"
:skip_it
  TIMEOUT %LOOP_TIMEOUT%

  set "hour=%time:~0,2%
  set "minute=%time:~3,2%
  set executionPaused="NO"
  if %hour% EQU 3 if %minute% GEQ 55 set executionPaused="YES"
  if %hour% EQU 4 if %minute% LEQ 5 set executionPaused="YES"
goto start