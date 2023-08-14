rem -----------------------------------------------------------
rem  Use Hubitat to control running a Speed Test on your PC 
rem -----------------------------------------------------------
rem      Note: This script will be on the PC
rem
rem  - Use the Hubitat Maker API to interrogate the value of virtual switch (SH - Run)
rem  This is done with curl in Windows to execute a URL for that specific device in Hubitat - device ID: 2074 
rem
rem  - The results are a string that can be read from StdOut and parsed to retrieve the desired value (on or off)
rem  Note: the Run virtual switch is flipped OFF at the end
rem -------------------------------------------------------------------------------------------------
rem
rem  {"id":"2074","name":"System Health - Virtual Switch",
rem   "label":"SH - Speed Test Run",
rem   "type":"Virtual Switch",
rem   "room":null,
rem   "attributes":[
rem                 {"name":"switch",
rem                  "currentValue":"off",
rem                  "dataType":"ENUM","values":["on","off"]}],"capabilities":["Switch",{"attributes":[{"name":"switch","dataType":null}]},"Refresh"],"commands":["off","on","refresh"]}
rem
rem -------------------------------------
rem Determine if run switch is off or on
rem -------------------------------------
Dim curlCMD
curlCommand = "curl http://192.168.1.88/apps/api/1376/devices/2074?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
Set oShell = WScript.CreateObject ("WScript.shell")
Set oExec = oShell.Exec(curlCommand)

Do While oExec.Status = 0
  WScript.Sleep 100
Loop

Do While Not oExec.StdOut.AtEndOfStream
  strLine = oExec.StdOut.ReadLine
  iPos = InStr(1, strLine, "currentValue", 1)
    If iPos > 1 Then
rem
rem  Then find "currentValue"
rem  Note: use the position of the colon and the comma to determine the length of the current value
rem
    colonPos = InStr(iPos, strLine, ":", 1) + 1 rem add 1 to remove the first set of quotes
rem WScript.Echo "iPos = " & iPos
    commaPos = InStr(colonPos, strLine, ",", 1) - 1 rem minus 1 to remove the last set of quotes
rem
rem Mid(string,start[,length])
rem
    currentValue = Mid(strLine, colonPos + 1,commaPos - (colonPos + 1))
    Else 
      currentValue = "Not found"
    End If
Loop
WScript.Echo currentValue
rem -----------------------------
rem Switch is OFF "Nothing to do"
rem -----------------------------
If currentValue = "off" Then
  WScript.Echo "Nothing to do"
else
rem -----------------------------
rem Switch is ON "Do something"
rem -----------------------------
  WScript.Echo "Do something"
  Set shell = CreateObject("WScript.Shell")
  shell.CurrentDirectory = "C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\SpeedTest\"
rem -----------------------------------------------------------------------------------------
rem Run Speed Test from a batch file
rem 
rem - Run speed test and send output to file (SpeedTestOutput.txt)
rem - Search output file and Find the download time and make sure it is greater than 100 Mbps
rem - If the value is good turn the results switch ON
rem ------------------------------------------------------------------------------------------

rem ------------------------------------
rem The batch file runs in a new window
rem  /c close the window when complete
rem  /k keep the window open when complete
rem  True run the batch synchronusly
rem ------------------------------------

  shell.Run "cmd /c 3-Run.bat", 1, True

rem -------------------------
rem turn the run switch OFF
rem -------------------------
  curlCommand = "curl http://192.168.1.88/apps/api/1376/devices/2074/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"  
  oShell.Exec(curlCommand)
End If

WScript.Quit