rem -------------------------------------------------------------------------------------------------
rem                           Run the following script synchronously
rem -------------------------------------------------------------------------------------------------
rem WScript.Echo "-------------------------------------------------------------"
rem Wscript.Echo "                  " & Wscript.ScriptName
rem WScript.Echo "-------------------------------------------------------------"
rem Wscript.Echo "Script path: " & Wscript.ScriptFullName

Dim myPath
myPath = CreateObject("WScript.Shell").Environment("Process").Item("myPath")
rem Wscript.Echo myPath

Set oShell = WScript.CreateObject ("WScript.shell")
rem ---------------------------------------------------------------------------------
rem    Approximately 1:30 even though delay was 3:00
rem ---------------------------------------------------------------------------------
rem oShell.Run myPath+"\PcControl\TimedAction\InterrogateSmartHomeActionNeeded.vbs",0,true
rem ---------------------------------------------------------------------------------
rem    show a quick window
rem ---------------------------------------------------------------------------------
rem oShell.Run("cscript myPath+\PcControl\TimedAction\InterrogateSmartHomeActionNeeded.vbs")
rem ---------------------------------------------------------------------------------
rem    try this one
rem ---------------------------------------------------------------------------------
oShell.Run("cscript //B myPath+\PcControl\TimedAction\InterrogateSmartHomeActionNeeded.vbs")

rem oShell.Run("cscript //H:WScript myPath+\PcControl\TimedAction\InterrogateSmartHomeActionNeeded.vbs")

rem oShell.Run("cscript myPath+\PcControl\TimedAction\InterrogateSmartHomeActionNeeded.vbs, 0, true")

WScript.Quit