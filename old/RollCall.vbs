rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch  (show me the weather)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1622 
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------

Dim curlCMD
rem --------------------------------------------------
rem 1st action is show me the weather
rem --------------------------------------------------
rem
rem Need to add a test if should be done
rem
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1622?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
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
rem WScript.Echo "current value: " + currentValue
If currentValue = "off" Then
  rem WScript.Echo "Nothing to do"
else
  rem WScript.Echo "Do something"
  oShell.Run "C:\Users\herbk\Desktop\showMe.bat"
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1622/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  oShell.Exec(curlCommand)
End If

WScript.Quit