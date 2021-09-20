rem -------------------------------------------------------------------------------------------------
rem   Turn off a number of virtual switches
rem -------------------------------------------------------------------------------------------------
rem dev:1636 2021-08-22 06:10:26.739 pm infoSecurity log - outside back motion STOPPED
rem dev:1635 2021-08-22 06:09:47.400 pm infoSecurity log - outside back motion DETECTED
rem dev:1634 2021-08-22 05:44:51.877 pm infoSecurity log - outside front motion STOPPED
rem dev:1633 2021-08-22 05:43:57.401 pm infoSecurity log - outside front motion DETECTED
rem dev:1632 2021-08-22 05:15:21.460 pm infoSecurity log - garage door CLOSED
rem dev:1631 2021-08-22 05:14:35.376 pm infoSecurity log - garage door OPEN
rem dev:1630 2021-08-22 03:08:40.188 pm infoSecurity log - back door CLOSED
rem dev:1629 2021-08-22 02:51:53.319 pm infoSecurity log - back door OPEN
rem dev:1628 2021-08-22 01:02:12.920 am infoSecurity log - front door CLOSED
rem dev:1627 2021-08-21 11:39:04.210 pm infoSecurity log - front door OPEN 
rem dev:1626 2021-08-21 07:40:57.567 pm infoAlexa show me the calendar 
rem dev:1625 2021-08-21 06:50:36.578 pm infoAlexa show me the music 
rem dev:1624 2021-08-22 07:59:11.849 pm infoAlexa show me the cameras
rem dev:1623 2021-08-22 07:58:15.527 pm infoPC control status 
rem dev:1622 2021-08-22 08:00:07.670 pm infoAlexa show me the weather
rem ----------------------------------------------------------------------------------------------------
Set oShell = WScript.CreateObject ("WScript.shell")
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1622/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1623/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1624/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1625/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1626/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1627/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1628/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1629/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1630/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1631/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1632/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1633/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1634/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1635/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1636/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1637/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1638/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)
curlCommand = "curl http://192.168.2.84/apps/api/1376/devices/1639/off?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5"
oShell.Exec(curlCommand)









