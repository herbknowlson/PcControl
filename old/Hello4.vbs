Set oShell = WScript.CreateObject ("WScript.shell")


Dim curlCMD
curlCMD = "curl http://192.168.2.84/apps/api/1376/devices/1413?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
rem msgbox curlCMD
rem oShell.run "cmd.exe /C curl " + var2
rem msgbox "Got here 2"


rem Set oExec = oShell.Exec("ipconfig")
Set oExec = oShell.Exec(curlCMD)

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
End If

WScript.Quit