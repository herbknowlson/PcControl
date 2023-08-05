rem -------------------------------------------------------------------------------------------------
rem  Use Hubitat to control running a Speed Test from a PC. Note: This script will be on the PC
rem  The script
rem  - Use the Hubitat Maker API to interrogate the value of virtual switch (SH - Speed Test Run)
rem  This is done with curl in Windows to execute a URL for that specific device in Hubitat - device ID: 2074 
rem  - The results are a string that can be read from StdOut and parsed to retrieve the desired value
rem  Note: the Run virtual switch is flipped OFF at the end
rem -------------------------------------------------------------------------------------------------

rem -------------------------------------
rem Determine if run switch is off or on
rem -------------------------------------
Dim curlCMD
curlCommand = "curl http://192.168.1.64/apps/api/1376/devices/2074?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
Set oShell = WScript.CreateObject ("WScript.shell")
Set oExec = oShell.Exec(curlCommand)

Do While oExec.Status = 0
  WScript.Sleep 100
Loop
Do While Not oExec.StdOut.AtEndOfStream
  strLine = oExec.StdOut.ReadLine
  iPos = InStr(1, strLine, "currentValue", 1)
  If iPos > 1 Then
    currentValue = Mid(strLine, iPos + 15,3)
    Exit Do
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

  shell.Run "cmd /c CompleteSpeedTest.bat", 1, True

rem -------------------------
rem turn the run switch OFF
rem -------------------------
  curlCommand = "curl http://192.168.1.64/apps/api/1376/devices/2074/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"  
  oShell.Exec(curlCommand)
End If

WScript.Quit