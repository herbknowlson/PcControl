rem =============================================================================
rem          This script is called multiple times by 2-LOOP.vbs
rem =============================================================================
rem
rem                 Receive 3 parameters from the Main Loop
rem =============================================================================
deviceID = Wscript.Arguments(0)
fieldName = Wscript.Arguments(1)
attributeName  = Wscript.Arguments(2)

rem =============================================================================
rem                 Use 2 parameters to call Function getDeviceValue
rem =============================================================================
label = getDeviceValue (deviceID, Chr(34)&fieldName&Chr(34)&":")
value = getDeviceValue (deviceID, Chr(34)&"name"&Chr(34)&":"&Chr(34)&attributeName&Chr(34)&","&Chr(34)&"currentValue"&Chr(34)&":")

rem =============================================================================
rem Format the results for Google sheets   (replace spaces with +)
rem =============================================================================

Dim newLabel
For pos = 1 to len(label)
  c = Mid(label, pos, 1)
  If c = " " Then
    c = "+"
  End If
  newLabel = newLabel + c
Next 

rem =============================================================================
rem
rem          Run batch file to write the results to a Google sheet
rem 
rem     Note: 3 values are passed using Environmental variables
rem =============================================================================
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
Set oShell = WScript.CreateObject ("WScript.shell")
Set wshSystemEnv = oShell.Environment( "Process" )
wshSystemEnv("deviceID") = deviceID
wshSystemEnv("label") = newLabel
wshSystemEnv("value") = value

oShell.Run myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\BatteryLife.bat",0,false

rem ===========================================================================
rem                          Write results to local file
rem ===========================================================================
logFile = myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\3-MAIN.log"

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
length = 35 - len(label)
rem Wscript.Echo "length = " & length
filler = Mid("                                 ",1,length + 4) 
data = data & label & filler
data = data & "attributeName = "& attributeName &"      "
data = data & "value = "        & value
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
rem  Pasre the raw data looking for a key (searchFor)
rem  Return the the value or NOT FOUND
rem ==================================================================================   
Function getDeviceValue (devId, searchFor)
  Set oShell = WScript.CreateObject ("WScript.shell")
  rem WScript.Echo fieldName
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/"&devId&"?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
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
