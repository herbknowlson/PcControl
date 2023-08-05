 rem -------------------------------------------------------------------------------------------------
rem  Use the Hubitat Maker API to interrogate the value of virtual switch (SH - Speed Test Run)
rem  Use curl in Windows to execute a URL for the specific device in Hubitat - device ID: 2074 
rem  The results are a string that can be read from StdOut
rem  Note: the virtual switch is flipped at the end
rem -------------------------------------------------------------------------------------------------

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
If currentValue = "off" Then
  WScript.Echo "Nothing to do"
else
  WScript.Echo "Run the speed test"
  Const TristateTrue = -1
  Set shell = CreateObject("WScript.Shell")
  shell.CurrentDirectory = "C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\SpeedTest\"
  rem shell.Run "cmd /c speedtest>:aSpeedTestOutput.txt", 0, True
  rem shell.Run "cmd /k speedtest>SpeedTestOutput.txt CON", 1, True
  shell.run "powershell cmd /k speedtest | tee SpeedTestOutput.txt", 1, True
  rem shell.Run "cmd /c speedtest", 1, True
  shell.run "powershell cmd /k speedtest| tee -Variable content $content | Set-Content -Encoding uft8 test_output.txt

powershell -c "$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'; .\t.bat 2>&1 | tee results.txt"

  WScript.Echo "Read the results file"
  Set objFileToRead = CreateObject("Scripting.FileSystemObject").OpenTextFile("SpeedTestOutput.txt",1,-2)
  
  rem strFileText = objFileToRead.ReadAll()
  rem WScript.Echo strFileText
  Dim strLine
  do while not objFileToRead.AtEndOfStream
    strLine = objFileToRead.ReadLine()
    rem Msgbox  objFileToRead.ReadLine
     
    WScript.Echo strLine
    rem WScript.Echo  "Do something with the line"
  loop
  objFileToRead.Close
  Set objFileToRead = Nothing

  rem The switch /k tells Command Prompt to issue the command that follows, 
  rem and then stay open so that you can view results or type followup commands. 

  curlCommand = "curl http://192.168.1.64/apps/api/1376/devices/2074/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"  
  oShell.Exec(curlCommand)

End If 
WScript.Quit