rem @echo off

rem ------------------=-----------------------------
rem Turn the results switch OFF
rem ----------------------------------=-------------
 curl http://192.168.1.64/apps/api/1376/devices/2073/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5 

speedtest
rem -------------------------------------------------------------- 
rem Run speed test again and send output to file (SpeedTestOutput.txt)
rem --------------------------------------------------------------
speedtest>SpeedTestOutput.txt

rem ---------------------------------------------------------------------------------------
rem Search output file and Find the download time and make sure it is greater than 100 Mbps
rem ---------------------------------------------------------------------------------------
SET dataFile=SpeedTestOutput.txt

setlocal enableDelayedExpansion

:main
call :requestFirstWord
TIMEOUT 20
cls
rem pause
exit

REM ---------------
:requestFirstWord
REM ---------------
cls

set "strFirstWord="
set "strFirstWord=Download:"

rem Loop our datafile, line by line, grabbing the first and second word,
rem the first word is stored temp as %%G, second temp as %%H.
for /f "tokens=1,2,3" %%G in (!dataFile!) do (
   rem echo %%G
   rem echo %%H
   rem echo %%I
   rem pause

rem ------------------------------
rem Find what you are looking for
rem ------------------------------
echo Looking for: %strFirstWord%
rem echo to match: %%G
rem echo to match: %%H
rem pause
    if "!strFirstWord!" equ "%%H" (
        echo "HAVE A MATCH"
        rem pause
        echo HERE IS THE VALUE WE TEST -   %%I
rem ------------------=-----------------------------
rem If the value is good turn thr results switch ON
rem ----------------------------------=-------------
        if %%I gtr 100 (
            echo value looks good
            curl http://192.168.1.64/apps/api/1376/devices/2073/on?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5 
        ) 
        rem Return to the call in ':main'.
        rem Note, a 'goto :eof' tells cmd to return to the last 'call' command location.
        rem In this case, the last call was from ':main', when i ran 'call :requestFirstWord'
        REM exit the subroutine
        goto :eof
    )
)
rem exit