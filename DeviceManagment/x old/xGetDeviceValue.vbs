rem =============================================================================
rem          This script is called multiple times by 2-LOOP.vbs
rem =============================================================================
rem
rem                 Receive 3 parameters from the Main Loop
rem =============================================================================
rem deviceID = Wscript.Arguments(0)
rem fieldName = Wscript.Arguments(1)
rem attributeName  = Wscript.Arguments(2)

deviceID = CreateObject("WScript.Shell").Environment("Process").Item("deviceID")
fieldName = CreateObject("WScript.Shell").Environment("Process").Item("fieldName")
attributeName = CreateObject("WScript.Shell").Environment("Process").Item("attributeName")


rem =============================================================================
rem                 Use 2 parameters to call Function getDeviceValue
rem =============================================================================
label = getDeviceValue (deviceID, Chr(34)&fieldName&Chr(34)&":")
value = getDeviceValue (deviceID, Chr(34)&"name"&Chr(34)&":"&Chr(34)&attributeName&Chr(34)&","&Chr(34)&"currentValue"&Chr(34)&":")


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

oShell.Run myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\BatteryLife.bat - Shortcut",0,false



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
