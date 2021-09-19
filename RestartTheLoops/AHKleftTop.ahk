;------------------------------------------------------------------------------
; Use Auto Hot Key to press button top right Smart home Dashboard
;------------------------------------------------------------------------------
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;^m::
CoordMode, Mouse, Screen
;MouseMove, 1880, 1010  ;center of sreen
;MouseMove, 3690, 1930  ;right bottom of sreen
;MouseMove,  300, 1930  ;left bottom of sreen
;MouseMove, 3550, 700  ;right top of sreen
;MouseMove, 3500, 1700  ;right bottom of sreen
MouseMove,  300, 700  ;left top of sreen
sleep, 500
Send {Click}
return
