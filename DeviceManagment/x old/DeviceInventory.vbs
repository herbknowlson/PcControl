rem ---------------------------------------------------------------------------------
rem Given you have a device ID and a description (name or label)
rem Check that you can find the device in Hubitat
rem And that the name is a match
rem Change the 3rd parameter to "show all values" to see all API values
rem accessDevice "299", "Master closet motion sensor - he", "show all values"
rem ---------------------------------------------------------------------------------
Dim deviceCount
Dim NOT_FOUNDcount
Dim errorText
WScript.Echo "---------------------------------------------------------------------------"
WScript.Echo " Check the following devices are currently active in Hubitat Maker API"
WScript.Echo "---------------------------------------------------------------------------"
accessDevice "1477", "Alexa announce back door", " "
accessDevice "1478", "Alexa announce front door" , " "
accessDevice "1644", "Alexa announce garage interior door" , " "
accessDevice "1641", "Alexa announce outside garage door" , " "
WScript.Echo "---------------------------------------------------------------------------"
accessDevice "1643", "Alexa move the mouse", " " 
accessDevice "1654", "Alexa recycle Wyze cams", " "
accessDevice "1626", "Alexa show me the calendar", " " 
accessDevice "1624", "Alexa show me the cameras", " "
accessDevice "1645", "Alexa show me the menu", " "
accessDevice "1625", "Alexa show me the music", " "
accessDevice "1648", "Alexa show me the photos", " "
accessDevice "1646", "Alexa show me the security log", " "
accessDevice "1639", "Alexa show me the security status", " "
accessDevice "1622", "Alexa show me the weather", " "
accessDevice "1652", "Alexa show me Linda's music", " "
accessDevice "1653", "Alexa show me YouTube", " "
WScript.Echo "----------------------------------------------------------------------"
accessDevice "1636", "Security log - outside back motion STOPPED", " "
accessDevice "1635", "Security log - outside back motion DETECTED", " "
accessDevice "1634", "Security log - outside front motion STOPPED", " "
accessDevice "1633", "Security log - outside front motion DETECTED", " "
accessDevice "1632", "Security log - garage door CLOSED", " "
accessDevice "1631", "Security log - garage door OPEN", " "
accessDevice "1630", "Security log - back door CLOSED", " "
accessDevice "1629", "Security log - back door OPEN", " "
accessDevice "1628", "Security log - front door CLOSED", " "
accessDevice "1627", "Security log - front door OPEN", " "
WScript.Echo "----------------------------------------------------------------------"
accessDevice "1623", "PC control security", " "
accessDevice "1649", "Outside garage door", " "
WScript.Echo "----------------------------------------------------------------------"
accessDevice "1650", "Wyze cam east outlet", " "
accessDevice "1651", "Wyze cam west outlet", " "
WScript.Echo "----------------------------------------------------------------------"
accessDevice "299", "Master closet motion sensor - he", " "
WScript.Echo "----------------------------------------------------------------------"
WScript.Echo "deviceCount: " & (deviceCount)
WScript.Echo "NOT_FOUNDcount: " & (NOT_FOUNDcount)


Sub accessDevice (devId, parm_value, showIt)
  deviceCount = deviceCount + 1
  rem WScript.Echo "accessDevices.vbs..."
  Set oShell = WScript.CreateObject ("WScript.shell")
  
  curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/"&devId&"?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
  Set oExec = oShell.Exec(curlCommand)

  Do While oExec.Status = 0
    WScript.Sleep 100
  Loop
  Do While Not oExec.StdOut.AtEndOfStream
    strLine = oExec.StdOut.ReadLine

    searchForName = Chr(34)&"name"&chr(34)&":"&chr(34)&parm_value&chr(34)
    searchForLabel = Chr(34)&"label"&chr(34)&":"&chr(34)&parm_value&chr(34)
    
    rem positionFound = InStr(1, strLine, searchForName , 1)
    positionFound = InStr(1, strLine, searchForLabel , 1)

    currentValue = "NOT FOUND"
    If positionFound  > 1 Then
      currentValue = parm_value
    Else
      NOT_FOUNDcount = NOT_FOUNDcount + 1
      errorText = strLine
    End If
  Loop

  If showIt = "show all values" Then
    errorText = strLine  
  End If
rem -----------------------------------------------------------------------------------------------
rem                                            Format the output
rem -----------------------------------------------------------------------------------------------
  numberOfSpaces = 45 - Len(parm_value)
  parm_value = parm_value + MID("                             ", 1,numberOfSpaces)
  WScript.Echo (deviceCount) & " -  " + parm_value + chr(9) + "devId: " + devId + chr(9) + currentValue
  If  Len(errorText) > 0 Then
    WScript.Echo "    " & errorText
    errortext = ""
  End If  

end Sub









