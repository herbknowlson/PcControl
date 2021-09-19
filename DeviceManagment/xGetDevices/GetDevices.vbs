rem =============================================================================
rem                This script is called  by 2-MAIN.vbs
rem =============================================================================
rem
rem
rem ===========================================================================
rem                          locate the output file file
rem ===========================================================================
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
logFile = myPath+"\PcControl\DeviceManagment\GetDevices\3-MAIN.log"
rem Wscript.Echo logFile 
rem 1 - read
rem 2 - write
rem 8 - append
rem true - new file created
Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,8,true)

rem =============================================================================
rem                               Get the results
rem =============================================================================
devices = getDevices()
rem Wscript.Echo devices

rem ==========================================================================
rem               Format the results before writing to the file
rem ==========================================================================
data = devices
rem Wscript.Echo data
rem ==========================================================================
rem               Format the results before writing to the file
rem ==========================================================================
rem Lines end with "},{"
searchFor = "},{"
startPosition = 1
searchHere = data
rem Wscript.Echo len(data)
count = 1
rem Do While len(searchHere) > 50
rem Do While count < 50
  positionFound = InStr(startPosition, searchHere, searchFor ,1)
  rem Wscript.Echo positionFound
  line = Cstr(count) + " - " + Mid(searchHere,startPosition,positionFound + 1)   
  rem Wscript.Echo line
  rem ==========================================================================
  rem                         Write to the file
  rem ==========================================================================
  rem objFileToWrite.WriteLine(line)
  rem objFileToWrite.WriteLine(data)
  searchHere = Mid(searchHere,positionFound + 3,len(searchHere))  
  rem Wscript.Echo searchHere
  rem Wscript.Echo startPosition
count = count + 1
rem Loop

rem objFileToWrite.Close
rem Set objFileToWrite = Nothing
rem WScript.Sleep 1000

WScript.Quit


rem ==================================================================================
rem
rem ==================================================================================
Function getDevices()
  Set oShell = WScript.CreateObject ("WScript.shell")
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  Set oExec = oShell.Exec(curlCommand)
  
  logFile = myPath+"\PcControl\DeviceManagment\GetDevices\3-MAIN2.log"
  Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,8,true)
  rem objFileToWrite.WriteLine(data)
  Wscript.Echo "Got here - 1"

  Do While oExec.Status = 0
    WScript.Sleep 100
    Loop
    Do While Not oExec.StdOut.AtEndOfStream
      strLine = oExec.StdOut.ReadLine
      Wscript.Echo "Got here - 2"
      Wscript.Echo len(strLine)
  rem ==========================================================================
  rem                         Write to the file
  rem ==========================================================================
      objFileToWrite.WriteLine(strLine)
    Loop 
  objFileToWrite.Close
  Set objFileToWrite = Nothing

  getDevices = strLine
end Function
