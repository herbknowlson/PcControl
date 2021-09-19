rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch (Notification - HE to PC)
rem  Use curl in Windoes to execute a URL for the specific device in Hubitat - device ID: 1413 
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------

Dim curlCMD
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1413?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
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
If currentValue = "off" Then
  WScript.Echo "Nothing to do"
else
  WScript.Echo "Do something"
  oShell.Run "C:\Users\herbk\Desktop\doIt.bat"
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1621/push/1?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  oShell.Exec(curlCommand)
End If

WScript.Quit