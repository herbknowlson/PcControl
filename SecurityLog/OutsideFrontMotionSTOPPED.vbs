rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch  (Security log - outside front motion STOPPED)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 1634 
rem  The results are a string that can be read from StdOut
rem -------------------------------------------------------------------------------------------------
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem Wscript.Echo myPath


Dim curlCMD
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1634?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
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
  rem oShell.Run "D:\Dropbox\PcControl\SecurityLog\FrontDoorOPEN.bat"
  oShell.Run myPath+"\PcControl\SecurityLog\OutsideFrontMotionSTOPPED.bat - Shortcut.lnk",0
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1634/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  oShell.Exec(curlCommand)
End If

WScript.Quit