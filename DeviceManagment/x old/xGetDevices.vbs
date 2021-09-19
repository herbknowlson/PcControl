rem =============================================================================
rem          This script is called  by 2-MAIN.vbs
rem =============================================================================
rem

rem =============================================================================
rem                 Use 2 parameters to call Function getDeviceValue
rem =============================================================================
rem label = getDeviceValue (deviceID, Chr(34)&fieldName&Chr(34)&":")
rem value = getDeviceValue (deviceID, Chr(34)&"name"&Chr(34)&":"&Chr(34)&attributeName&Chr(34)&","&Chr(34)&"currentValue"&Chr(34)&":")
devices = getDevices
rem ===========================================================================
rem                          Write results to local file
rem ===========================================================================

Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
logFile = myPath+"\PcControl\DeviceManagment\GetValue\3-MAIN.log"
Wscript.Echo logFile 

rem 1 - read
rem 2 - write
rem 8 - append
rem true - new file created

Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,8,true)

rem ==========================================================================
rem               Format the results before writing to the file
rem ==========================================================================
data = devices

rem ==========================================================================
rem                         Write to the file
rem ==========================================================================
objFileToWrite.WriteLine(data)
objFileToWrite.Close
Set objFileToWrite = Nothing
WScript.Sleep 1000


rem ==================================================================================
rem        Here is the Function that pulls values from Hubitat
rem
rem  Given a device ID, fieldName(label) and attributeName(battery) return the value
rem
rem  Retrieve the raw data using the deviceId
rem  Parse the raw data looking for a key (searchFor)
rem  Return the the value or NOT FOUND
rem ==================================================================================   
Function getDeviceValue (devId, searchFor)
  Set oShell = WScript.CreateObject ("WScript.shell")
  rem WScript.Echo fieldName
  rem curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/"&devId&"?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  Set oExec = oShell.Exec(curlCommand)

Do While oExec.Status = 0
    WScript.Sleep 100
  Loop
  Do While Not oExec.StdOut.AtEndOfStream
    strLine = oExec.StdOut.ReadLine
    keyPosition = InStr(1, strLine, searchFor , 1)

    If keyPosition   > 1 Then
      startPosition = keyPosition + len(searchFor)
      endPosition = InStr(startPosition, strLine, "," , 1) 
      length = endPosition - startPosition
      valueText = Mid(strLine,startPosition, length )
    Else
      valueText = "NOT_FOUND"
    End If
  Loop 

  getDeviceValue = valueText
end Function


Function getDevices()
  Set oShell = WScript.CreateObject ("WScript.shell")
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  Set oExec = oShell.Exec(curlCommand)

Do While oExec.Status = 0
    WScript.Sleep 100
  Loop
  Do While Not oExec.StdOut.AtEndOfStream
    strLine = oExec.StdOut.ReadLine
  Loop 

  getDevices = strLine
end Function
