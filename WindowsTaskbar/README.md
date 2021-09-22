Description
Use the Hubitat Maker API to get info and change state using a URL

How to do it
Device must be authorized -  http://192.168.2.84/installedapp/configure/1376/mainPage
get the access_token here -   http://192.168.2.84/installedapp/configure/1376/mainPage
Use the logs to get the device ID and create a URL
- Open Hubitat logs on the PC  (pause while you get your phone)
- Open the device (Living room TV back light outlet - he)on you phone 
- turn the device on
- review the logs
- dev:12862021-08-12 03:31:51.961 pm infoLiving room TV back light outlet - he was turned on [digital]
- create a URL using the device ID
- http://192.168.2.84/apps/api/1376/devices/1286/on?access_token=6c5d7775-2d6a-4786-ae45-3942346fd0d5
- test the URL 
- Create a .bat file using the new URL (Lighting Control Button 1 - Hubitat Maker API.bat)
- Create a Windows desktop shortcut using cmd to execute the bat file (see details below) 

Note: uses cmd shortcut to pin batch file to the taskbar
Create a Windows desktop shortcut using cmd to execute the bat file
- Right click on your Desktop and choose New > Shortcut
- In the Type the location of the item field enter: cmd.exe /c "path\to\yourscript.bat"
- Replace path\to\yourscript.bat with actual path to your .bat file.  "D:\Dropbox\github\WindowsDesktop\Lighting Control Button 1 - Hubitat Maker API.bat"
- Name the shortcut (Lighting Control Button 1 - cmd)
- add icon to make shortcut more visible on the taskbar 
Pin the shortcut to the taskbar

Note: Once you have one of these cmd shortcut you can make copies and change the target and file name
