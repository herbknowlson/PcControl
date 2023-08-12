;========================================
;  HowManyDevicesHubitat.ahk
;========================================
;
;----------------------------------------
;^!o::  ; Ctrl+Alt+O
{
   filePath := "C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\HowManyDevicesHubitat\results.txt"

   ;--------------------------
   ; go to devices list
   ;-------------------------
   Run "http://192.168.1.64/device/list"
   Sleep 3000  
  
   ;--------------------------
   ; remove previous search, click the X
   ;-------------------------- 
   MouseMove 1579,  223
   Sleep 500
   Send "{Click}"   
   Sleep 1000   
   ;--------------------------
   ; need to get to the bottom to see the number of devices
   ;-------------------------   
   Send "z"  ; send z to search 
   ;--------------------------
   ; remove previous search, click the X
   ;--------------------------    
   MouseMove 1579,  223
   Sleep 500
   Send "{Click}"   
   Sleep 1000 
   
   ;-------------------------
   ; select text with mouse drag
   ;-------------------------    
   MouseClickDrag "L", 280, 947, 500, 948
   Sleep 500  
      
   ;-------------------------
   ; copy to clipboard
   ;-------------------------    
   Send "^c"
   Sleep 500
   ;-------------------------
   ; close the app
   ;-------------------------    
   Send "!{F4}"   ;Alt + F4 
   ;-------------------------
   ; Open Notepad
   ;-------------------------  
   ;Run "Notepad"
   ;Sleep 2000    
   Run  "notepad.exe " filePath
   ; Use SplitPath to fetch only the bare filename from the above:
   SplitPath filePath, &fName
   If WinExist(fName) 
   {
     WinActivate
   }
   Sleep 2000
   ;-------------------------
   ; select all text
   ;------------------------- 
   Send "^a"   ;Ctrl + a
   Sleep 500   
   ;-------------------------
   ; paste text
   ;------------------------- 
   Send "^v"   ;Ctrl + v
   Sleep 500
   ;-------------------------
   ; Open the file menu
   ;------------------------- 
   Send "!f"   ;Alt + f
   Sleep 2000
   ;-------------------------
   ; Save the file
   ;------------------------- 
   Send "!s"   ;Alt + s
   Sleep 2000
   ;-------------------------
   ; Close Notepad
   ;------------------------- 
   Send "!{F4}"   ;Alt + F4 
   Sleep 2000   
   ;-------------------------
   ; close Browser
   ;-------------------------
   ;Send "{Click}" ;give browser window the focus
   ;Send "!{F4}"   ;Alt + F4   
   
   ;xxxxxxxxxxxxxxxxxx
   ;ExitApp
   ;xxxxxxxxxxxxxxxxxx
}


