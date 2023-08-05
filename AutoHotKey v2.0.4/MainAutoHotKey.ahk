#Requires AutoHotkey v2.0

;========================================
;This is a simple script
;
; using MsgBox [Text, Title, Options]
; - Text "Hello, world!"
; - Title "Hello, world!"
; - Options OK, Cancel 1 
;
;========================================

^!m::  ; Ctrl+Alt+M
{
  MsgBox "Hello, world!", "Hello, world!", 1
}

;========================================
; Launch a website
;========================================
#z::Run "https://www.autohotkey.com"  ; Win+Z

;========================================
; Open notepad
;========================================
^!n::  ; Ctrl+Alt+N
{
    if WinExist("Untitled - Notepad")
        WinActivate
    else
        Run "Notepad"
}

;========================================
; Open CMD and run Speed test
;========================================
^!c::  ; Ctrl+Alt+C
{
   Send "#r"  ; hold the windows key and press "r"
   Sleep 500
   Send "cmd"
   Sleep 500
   Send "{Enter}"
   Sleep 1000
   Send "speedtest"
   Sleep 500
   Send "{Enter}"
}

;========================================
; send text to open window
;========================================
^!j:: ; Ctrl+Alt+J
{
    Send "My First Script"
}

