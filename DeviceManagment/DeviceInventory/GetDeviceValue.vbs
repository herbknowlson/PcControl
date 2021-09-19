rem On Error Resume Next
rem =============================================================================
rem          This script is called multiple times by 2-MAIN.vbs
rem =============================================================================
rem                 Receive 2 parameters from the Main Loop
rem =============================================================================
deviceID = Wscript.Arguments(0)
fieldName = Wscript.Arguments(1)

rem =============================================================================
rem                 Use 2 parameters to call Function getDeviceValue
rem =============================================================================
label = getDeviceValue (deviceID, Chr(34)&fieldName&Chr(34)&":")

rem Wscript.Echo "Got here - 1"
rem Wscript.Echo "deviceID   = "   & deviceID 
rem Wscript.Echo "label  = "   & label 
rem Wscript.Echo "fieldName  = "   & fieldName 


rem ===========================================================================
rem                          Locate the log file
rem ===========================================================================
Dim myPath
rem myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
fullPath = CreateObject("WScript.Shell").Environment("Process").Item("fullPath")
rem logFile = myPath+"\PcControl\DeviceManagment\GetValueInventory\3-MAIN.log"
logFile = fullPath+"\3-MAIN.log"
rem Wscript.Echo logFile 

rem 1 - read
rem 2 - write
rem 8 - append
rem true - new file created
Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(logFile,8,true)

rem ==========================================================================
rem               Format the results before writing to the file
rem ==========================================================================
data = "device ID="&deviceID
data = data & Mid("        ",1,8-Len(deviceID))   
data = data & fieldName & " = "
length = 45 - len(label)
rem  "length = " & length

filler = Mid("                                 ",1,length + 4) 
If Err.Number <> 0 Then
  WScript.Echo "devicecID = " & deviceID
  WScript.Echo "label = " & label
  rem WScript.Echo "Error in DoStep1: " & Err.Description
  Err.Clear
End If
data = data & label & filler
rem Wscript.Echo data
rem ==========================================================================
rem                         Write to the log file
rem ==========================================================================
rem If label <> "NOT_FOUND" Then
  objFileToWrite.WriteLine(data)
rem End If
objFileToWrite.Close
Set objFileToWrite = Nothing

rem WScript.Sleep 1000


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
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/"&devId&"?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  Set oExec = oShell.Exec(curlCommand)

  Do While oExec.Status = 0
    WScript.Sleep 100
    Loop
    Do While Not oExec.StdOut.AtEndOfStream
      strLine = oExec.StdOut.ReadLine
      rem Wscript.Echo strLine 
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



