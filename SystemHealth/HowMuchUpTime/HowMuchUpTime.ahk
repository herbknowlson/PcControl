;========================================
;  1B-HowMuchUpTime.ahk
;========================================
; Open Orbi admin Website and navigate
; until you can retrieve the uptime
; write the results to a file
;----------------------------------------
;^!o::  ; Ctrl+Alt+O
{
   filePath := "C:\Users\herbk\Dropbox\gitHub\PcControl\SystemHealth\HowMuchUpTime\results.txt"
   
   Run "https://192.168.1.1/#Dashboard"
   Sleep 2000
   ;----------------
   ; login
   ;----------------
   Send "admin"
   Sleep 500
   Send "{Tab}"
   Send "Guitar01234"
   Sleep 500
   Send "{Enter}"
   Sleep 1000
   ;--------------------------
   ; close splash screen
   ;-------------------------
   MouseMove 1301, 222
   Sleep 500
   Send "{Click}"
   ;--------------------------
   ; select the Advanced tab
   ;-------------------------
   MouseMove 144, 206
   Sleep 500
   Send "{Click}"
   Sleep 7000
   ;-------------------------
   ; select SHOW STATISTICS
   ;-------------------------   
   MouseMove 720, 453
   Sleep 500
   Send "{Click}"
   Sleep 2000
   ;-------------------------
   ; select text
   ;-------------------------    
   MouseClickDrag "L", 635, 172, 746, 172
   Sleep 500
   ;-------------------------
   ; copy to clipboard
   ;-------------------------    
   Send "^c"
   Sleep 500
   ;-------------------------
   ; close STATISTICS
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
   Send "{Click}" ;give browser window the focus
   Send "!{F4}"   ;Alt + F4 
}


