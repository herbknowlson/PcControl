;------------------------------------------------------------------------------
; Use Auto Hot Ket to make reolink application full screen
;------------------------------------------------------------------------------
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance Force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;^p::
CoordMode, Mouse, Screen
;                        1st number move right, 2nd number move down
MouseMove,  800, 100    ;left top
;MouseMove, 1880, 1010  ;center of sreen
;MouseMove, 3690, 1930  ;right bottom 
Send {Click}
return