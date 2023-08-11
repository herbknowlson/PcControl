rem @echo off

rem -----------------------------------------------
rem Turn the results switch OFF
rem -----------------------------------------------
 curl http://192.168.1.64/apps/api/1376/devices/2073/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5 


rem -------------------------------------------------------------- 
rem Run speed test again and send output to file (SpeedTestOutput.txt)
rem --------------------------------------------------------------
    speedtest>SpeedTestOutput.txt

rem  speedtest>SpeedTestOutput.txt > CON
rem speedtest>CON & SpeedTestOutput.txt
rem start /wait "" cmd /c cscript C:\Users\herbk\Dropbox\gitHub\PcControl\MakerAPI\4-parserOutput.vbs 

rem -------------------------------------------------------------- 
rem  Parse the outout
rem --------------------------------------------------------------
cscript C:\Users\herbk\Dropbox\gitHub\PcControl\MakerAPI\4-parseOutput.vbs 
rem TIMEOUT 10
rem PAUSE

rem -------------------------------------------------------------- 
rem  Test the result
rem --------------------------------------------------------------
cscript C:\Users\herbk\Dropbox\gitHub\PcControl\MakerAPI\5-parseResults.vbs
rem TIMEOUT 10
rem PAUSE
rem exit