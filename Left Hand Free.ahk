#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#InstallKeybdHook
#SingleInstance force
SetTitleMatchMode 2

; ! = ALT
; ^ = CTRL
; + = SHIFT
; # = WIN

; Right alt + backspace to delete
RAlt & Backspace::SendInput {Delete}
#IfWinActive ahk_class CabinetWClass ; Windows Explorer
RAlt & Backspace::
    Clipboard := "" ; Empty variable
    FilePath := "" ; Empty variable
    SendInput, ^c
    Clipwait, 0.5
    FilePath := Clipboard
    FileDelete, % FilePath
    FileRemoveDir, % FilePath
return
#IfWinActive

; Complete screenshot with CMD SHIFT A (CMD SHIFT S is screensnip)
#+a::send #{PrintScreen}

; Hold right alt for media controls with nearby keys

RAlt & Left::SendInput {Media_Prev}
RAlt & Space::SendInput {Media_Play_Pause}
RAlt & Right::SendInput {Media_Next}
RAlt & M::SendInput {Volume_Mute}
RAlt & Down::SendInput {Volume_Down}
RAlt & Up::SendInput {Volume_Up}

; OS X system shortcuts

; Close windows (cmd + q to Alt + F4)
#q::Send !{F4}

; OS X keyboard mappings for special chars

; Map Alt + N to ©
!g::SendInput {©}

; Map Alt + E to €
!e::SendInput {€}

; Map Alt + - to ±
!+::SendInput {±}

; Map Alt + R to ®
!r::SendInput {®}

; Map Alt + W to ∑
!w::SendInput {∑}
