rem ==================================================================================
rem                    Get the battery level for various devices
rem ==================================================================================
Set oShell = WScript.CreateObject ("WScript.shell")
fieldName = "label"
attributeName = "battery"

rem ==================================================================================
rem                               Get the path
rem ==================================================================================
Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")

rem Choose your path:
rem myPath = "D:\Dropbox"
rem myPath = "C:\Users\herbk\Dropbox"

rem ----------------------------------------------------------------------
rem                           update the setId 
rem
rem   Create a unique number for each set of battery levels
rem ----------------------------------------------------------------------
setIdFile = myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\setId.txt"
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(setIdFile)

Do Until f.AtEndOfStream
  rem WScript.Echo f.ReadLine
  setId = f.ReadLine
  WScript.Sleep 500
Loop
f.Close

rem 1 - read
rem 2 - write
rem 8 - append
rem true - new file created
rem ==========================================================================
rem                         Write file to save the setId
rem ==========================================================================
Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(setIdFile,2,true)
WScript.Echo "setId = " & setId
setId = setId + 1
objFileToWrite.WriteLine(setId)
objFileToWrite.Close
Set objFileToWrite = Nothing
rem ------------------------------------------------------------------  
rem     Note: setId passed using Environmental variable
rem ------------------------------------------------------------------
  Set wshSystemEnv = oShell.Environment( "Process" )
  wshSystemEnv("setId") = setId

Dim deviceCount
rem ==================================================================================
rem                       locate data file for the device IDs
rem ==================================================================================
dataFile = myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\DATA2.txt"
Set fso = CreateObject("Scripting.FileSystemObject")
rem 1 - read
rem 2 - write
rem 8 - append
rem true - create new file
Set f = fso.OpenTextFile(dataFile,1)
rem ----------------------------------------------------------------------
rem                            M A I N     L O O P 
rem ----------------------------------------------------------------------
Do Until f.AtEndOfStream
  deviceID = f.ReadLine
  rem WScript.Echo deviceID
  deviceCount = deviceCount + 1
rem  oShell.Run myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\GetDeviceValue.vbs "+deviceID+" "+fieldName+" "+attributeName
rem ------------------------------------------------------------------  
rem     Note: 3 values are passed using Environmental variables
rem ------------------------------------------------------------------
  Set wshSystemEnv = oShell.Environment( "Process" )
  wshSystemEnv("deviceID") = deviceID
  wshSystemEnv("fieldName") = fieldName
  wshSystemEnv("attributeName") = attributeName
  oShell.Run myPath+"\PcControl\DeviceManagment\GetValueBatteryLevel\GetDeviceValue.vbs",0,true
Loop

f.Close                            