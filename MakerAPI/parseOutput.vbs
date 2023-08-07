  rem ===========================================================================
  rem                    Read local file and parse it
  rem ===========================================================================
  theFile = "output.txt"
 
  Set fso = CreateObject("Scripting.FileSystemObject")
  Set f = fso.OpenTextFile(theFile)

  Do Until f.AtEndOfStream
    rem WScript.Echo f.ReadLine
    strLine = f.ReadLine
rem -------------------------------------------------------------------------------------------------------------------------------
rem  You need to look for a particular string "currentValue" that occurs just before the value you want 
rem  {"name":"temperature","currentValue":78.92,"dataType":"NUMBER"}
rem
rem  InStr([start,]string1,string2[,compare])
rem   Parameter	Description
rem   start	Optional. Specifies the starting position for each search. 
rem             The search begins at the first character position (1) by default. 
rem             This parameter is required if compare is specified
rem   string1	Required. The string to be searched
rem   string2	Required. The string expression to search for
rem  compare	Optional. Specifies the string comparison to use. Default is 0
rem  Can have one of the following values:
rem    0 = vbBinaryCompare - Perform a binary comparison
rem    1 = vbTextCompare - Perform a textual comparison
rem -------------------------------------------------------------------------------------------------------------------------------
rem
rem  First find "temperature"
rem
rem   searchFor = "temperature"
  searchFor = "battery"
  iPos = InStr(1, strLine, searchFor, 1)
  rem WScript.Echo "iPos = " & iPos
  If iPos > 1 Then
rem
rem  Then find "currentValue"
rem
    colonPos = InStr(iPos, strLine, ":", 1)
    rem WScript.Echo "iPos = " & iPos
    commaPos = InStr(colonPos, strLine, ",", 1)
    currentValue = Mid(strLine, colonPos + 1,commaPos - (colonPos + 1))
  End If
  Exit Do
Loop
  f.Close
  WScript.Echo "currentValue = " & currentValue
WScript.Quit