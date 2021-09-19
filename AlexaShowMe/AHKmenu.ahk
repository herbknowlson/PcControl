;------------------------------------------------------------------------------
; Use Auto Hot Ket to make EverNote application scrollable
;------------------------------------------------------------------------------
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;^e::
CoordMode, Mouse, Screen
MouseMove, 600, 800  ;top right screen
;MouseMove, 1880, 1010  ;center of sreen
;MouseMove, 3690, 1930  ;bottom right of sreen
Send {Click}
return