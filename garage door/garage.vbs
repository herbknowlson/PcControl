rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of Multipurpose Sensor (Outside garage door)
rem  Use curl in Windoes to execute a URL for the specific device in Hubitat - device ID: 103
rem  The results are a string that can be read from StdOut
rem  Note: the device must be Authorized for Maker API
rem -------------------------------------------------------------------------------------------------

Dim curlCMD
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/103?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
Set oShell = WScript.CreateObject ("WScript.shell")
Set oExec = oShell.Exec(curlCommand)

Do While oExec.Status = 0
  WScript.Sleep 100
Loop
Do While Not oExec.StdOut.AtEndOfStream
  strLine = oExec.StdOut.ReadLine
  iPos = InStr(1, strLine, "contact", 1)
  If iPos > 1 Then
    currentValue = Mid(strLine, iPos + 25,4)
    Exit Do
  End If
Loop
rem WScript.Echo currentValue
If currentValue = "open" Then
rem  WScript.Echo "Garage door OPEN"
oShell.Run "C:\Users\herbk\Desktop\GDopen.bat"
else
rem  WScript.Echo "Garage door CLOSED"
  oShell.Run "C:\Users\herbk\Desktop\GDclosed.bat"
rem  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1621/push/1?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
rem  oShell.Exec(curlCommand)
End If

WScript.Quit