rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch  (Outside back door (contact)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 122 
rem -------------------------------------------------------------------------------------------------
rem WScript.Echo "-------------------------------------------------------------"
rem Wscript.Echo "            Script name: " & Wscript.ScriptName
rem WScript.Echo "-------------------------------------------------------------"
rem Wscript.Echo "Script path: " & Wscript.ScriptFullName

myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem Wscript.Echo myPath
hubitatIp = CreateObject("WScript.Shell").Environment("Process").Item("hubitatIp")

curlCommand = "curl " + hubitatIp + "apps/api/1376/devices/122?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"                    
Set oShell = WScript.CreateObject ("WScript.shell")
Set oExec = oShell.Exec(curlCommand)

Dim cv1
Dim cv2

Do While oExec.Status = 0
  WScript.Sleep 100
Loop
Do While Not oExec.StdOut.AtEndOfStream
  strLine = oExec.StdOut.ReadLine
  temp1 = Chr(34)&"currentValue"&chr(34)&":"&chr(34)&"open"&chr(34)
  temp2 = Chr(34)&"currentValue"&chr(34)&":"&chr(34)&"closed"&chr(34)
  rem Wscript.Echo temp1
  cv1 = InStr(1, strLine, temp1, 1)
  cv2 = InStr(1, strLine, temp2, 1)
  currentValue = "NOT_FOUND"
  If cv1 > 1 Then
    currentValue = Mid(strLine, cv1 + 16,6)
  End If
  If cv2 > 1 Then
    currentValue = Mid(strLine, cv2 + 16,6)
  End If
  Exit Do
Loop
  rem WScript.Echo "current value: " + currentValue
  Set wshSystemEnv = oShell.Environment( "Process" )
  wshSystemEnv("BackDoorStatus") = currentValue
  oShell.Run myPath+"\PcControl\SecurityStatus\BackDoorStatus.bat - Shortcut.lnk ",0,false

WScript.Quit