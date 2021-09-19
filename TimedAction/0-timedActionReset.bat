@ECHO OFF

rem -------------------------------------------------------------
rem                      Reset the Action ID to 0
rem --------------------------------------------------------------
cscript %myPath%"\PcControl\TimedAction\actionIdReset.vbs"


rem -------------------------------------------------------------------
rem                        Write hardcoded value to Googlesheet
rem
rem
rem  replace          %actionCounter%  %notesActionBegins%  %loop1Counter% %loop2Counter% %loop3Counter%
rem  with hard coded values:   0           actionReset            0              0              0
rem --------------------------------------------------------------------

start /min microsoft-edge:"https://docs.google.com/forms/d/e/1FAIpQLSeW8dBns-mmCd9iJV2zm1uauML2MibPeRcCrZq8-XrOLhRkPQ/formResponse?usp=pp_url&entry.1170193302=0&entry.2003268489=actionReset&entry.1898766254=0%&entry.1200210196=0&entry.1850835241=0&submit=Submit"

timeout 2
powershell (ps msedge).CloseMainWindow()

rem PAUSE



