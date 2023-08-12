@echo %date% > Output.txt
@echo %time%  >> Output.txt
@echo off
rem -----------------------------------------------
rem Turn the results switch OFF
rem -----------------------------------------------
curl http://192.168.1.88/apps/api/1376/devices/2073/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5 

rem -------------------------------------------------------------- 
rem Run speed test and send output to file (Output.txt)
rem --------------------------------------------------------------

speedtest>>Output.txt

rem -------------------------------------------------------------- 
rem  Parse the output
rem --------------------------------------------------------------
cscript C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\SpeedTest\4-ParseOutput.vbs 
rem start /wait C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\SpeedTest\4-ParseOutput.vbs 
rem TIMEOUT 10
rem PAUSE

rem -------------------------------------------------------------- 
rem  Format the result
rem --------------------------------------------------------------
cscript C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\SpeedTest\5-FormatResults.vbs
rem start /wait C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\SpeedTest\5-FormatResults.vbs
rem TIMEOUT 10
rem PAUSE
rem exit