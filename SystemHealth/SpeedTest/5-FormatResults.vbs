rem ===========================================================================
rem   Read local results file and format data for Hubitat dashboard tile
rem ===========================================================================
  theFile = "Results.txt"
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.OpenTextFile(theFile)
    strLine = f.ReadLine
    currentValue = strLine
    rem -----------------------------------------------
    rem If the value is good turn the results switch ON
    rem -----------------------------------------------
    if currentValue > 100 Then
      WScript.Echo "value looks good"
    rem -----------------------------------------------
    rem If the value is good format the results
    rem -----------------------------------------------
      currentValue = FormatDateTime(now,0) + currentValue
      currentValue = Replace(currentValue," ","+")
      currentValue = Replace(currentValue,"/","-")
      
      rem WScript.Echo currentValue
      Set oShell = WScript.CreateObject ("WScript.shell")
      curlCommand = "curl "+ "http://192.168.1.88/apps/api/1376/devices/2073/on?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
      oShell.Exec(curlCommand) 
      rem -----------------------------------------------
      rem If the value is good update the tile
      rem -----------------------------------------------
      curlCommand = "curl "+ "http://192.168.1.88/apps/api/1376/devices/2086/setVariable/"  + currentValue + "?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
      rem WScript.Echo curlCommand
      oShell.Exec(curlCommand)  
    End If
  f.Close
  WScript.Echo "currentValue = " & currentValue
WScript.Quit