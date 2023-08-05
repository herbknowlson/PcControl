WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "            Script name: " & Wscript.ScriptName
WScript.Echo "-------------------------------------------------------------"
Wscript.Echo "Script path: " & Wscript.ScriptFullName
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem WScript.Echo myPath 
rem Choose your path:
rem myPath = "D:\Dropbox\gitHub"
rem myPath = "C:\Users\herbk\Dropbox\gitHub"
rem =============================================================================
rem          This script is called multiple times by 2-LOOP.vbs
rem =============================================================================
rem
rem                 Receive 3 parameters from the Main Loop
rem
rem Compare passing directly or using the environment
rem =============================================================================
rem deviceID = Wscript.Arguments(0)
rem fieldName = Wscript.Arguments(1)
rem attributeName  = Wscript.Arguments(2)
hubitatIp = CreateObject("WScript.Shell").Environment("Process").Item("hubitatIp")

deviceID = CreateObject("WScript.Shell").Environment("Process").Item("deviceID")
fieldName = CreateObject("WScript.Shell").Environment("Process").Item("fieldName")
attributeName = CreateObject("WScript.Shell").Environment("Process").Item("attributeName")

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


Set oShell = WScript.CreateObject ("WScript.shell")
Set wshSystemEnv = oShell.Environment( "Process" )
wshSystemEnv("deviceID") = deviceID
wshSystemEnv("label") = newLabel
wshSystemEnv("value") = value
oShell.Run myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\BatteryLife.bat - Shortcut",0,true

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
  rem Set oShell = WScript.CreateObject ("WScript.shell")
  rem WScript.Echo fieldName
  rem curlCommand = "curl " + hubitatIp + apps/api/1376/devices/"&devId&"?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  curlCommand = "curl http://192.168.1.103/apps/api/1376/devices/"&devId&"?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  WScript.Echo curlCommand
  rem Set oExec = oShell.Exec(curlCommand)

  rem =================================================================================================
  rem You're always going to get a window flash with Exec(). 
  rem You can use Run() instead to execute the command in a hidden window. 
  rem But you can't directly capture the command's output with Run(). 
  rem You'd have to redirect the output to a temporary file that your VBScript could then 
  rem open, read, and delete.
  rem =====================================================================================================
  tempFile = myPath +"\PcControl\DeviceManagment\GetValueBatteryLevel\out.txt"
  rem WScript.Echo tempFile 
  With WScript.CreateObject ("WScript.shell")
    .Run "cmd /c " + curlCommand + " > "+ tempFile, 0, True
  End With
  rem ---------------------------------------------------------
  rem  Read the output and remove the file when done...
  rem ---------------------------------------------------------
  Dim strLine 
  With WScript.CreateObject("Scripting.FileSystemObject")
    strLine = .OpenTextFile(tempFile).ReadAll()
  End With
rem   .DeleteFile "C:\Users\herbk\Dropbox\PcControl\DeviceManagment\GetValueBatteryLevel\out.txt"

  keyPosition = InStr(1, strLine, searchFor , 1)

  If keyPosition   > 1 Then
    startPosition = keyPosition + len(searchFor)
    endPosition = InStr(startPosition, strLine, "," , 1) 
    length = endPosition - startPosition
    valueText = Mid(strLine,startPosition, length )
  Else
    valueText = "NOT_FOUND"
  End If

  getDeviceValue = valueText
end Function
