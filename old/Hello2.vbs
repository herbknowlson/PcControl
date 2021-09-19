Set oShell = WScript.CreateObject ("WScript.shell")
Set oExec = oShell.Exec("ipconfig")
Do While oExec.Status = 0
  WScript.Sleep 100
Loop
Do While Not oExec.StdOut.AtEndOfStream
  strLine = oExec.StdOut.ReadLine
  iPos = InStr(1, strLine, "gateway", 1)
  If iPos > 1 Then
    gateway = Trim(Split(strLine, ":")(1))
    Exit Do
  End If
Loop
msgbox strLine
WScript.Echo gateway
WScript.Quit