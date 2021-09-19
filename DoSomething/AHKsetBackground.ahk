;------------------------------------------------------------------------------
; Use Auto Hot Ket to to change wallpaper
;------------------------------------------------------------------------------
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
sleep, 500
Send, +{Tab 2}
sleep, 500
Send, {Enter}
sleep, 500
Send, {Down 6}
Send, {Enter}
sleep, 500
Send, {Down}
Send, {Enter}
sleep, 500
Send !{f4}
return
