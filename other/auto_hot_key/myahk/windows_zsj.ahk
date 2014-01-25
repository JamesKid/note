#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



	; Note: From now on whenever you run AutoHotkey directly, this script
	; will be loaded.  So feel free to customize it to suit your needs.

	; Please read the QUICK-START TUTORIAL near the top of the help file.
	; It explains how to perform common automation tasks such as sending
	; keystrokes and mouse clicks.  It also explains more about hotkeys.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Author	JamesKid
;;History	2013_12_13_00_00 add arrow ctrl
;;			2014_01_25_16_24 add "IfWinActive"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;my_setting 

		^!n::
		IfWinExist Untitled - Notepad
			WinActivate
		else
			Run Notepad
		return

	; path key 
		#v:: Run C:\Program Files\Vim\vim74\gvim.exe
		#z:: Run www.autohotkey.com
		#a::
			 IfWinExist Active Window Info (Shift-Alt-Tab to freeze display)
			 {
				 WinClose
			 }
			 else
			{
				Run C:\Program Files\AutoHotkey\AU3_Spy.exe
			}
			return
		#j:: Run E:\work_zhang\work\8_learn\book\1_computer\2_vim\1_学习vi和vim编辑器.pdf
		#p:: Run F:\Adobe Photoshop CS6\Adobe Photoshop CS6\Photoshop.exe
		#o:: Run E:\work_zhang\work\8_learn\book\2_vim\6_Vim中文全手册.pdf
		#n:: Run D:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -
		#f:: Run F:\ff\firefox.exe
		#s:: Click Right

		^m:: Enter
		^k:: send {Down}	
		^h:: send {Left}
		^l:: send {Right}
		^i:: send {Up}

		#k:: send {Dwon}

	;key board to control the mouse

		*#up::MouseMove, 0, -10, 0, R ; Win+UpArrow hotkey => Move cursor upward
		*#Down::MouseMove, 0, 10, 0, R ; Win+DownArrow => Move cursor downward
		*#Left::MouseMove, -10, 0, 0, R ; Win+LeftArrow => Move cursor to the left
		*#Right::MouseMove, 10, 0, 0, R ; Win+RightArrow => Move cursor to the right
		*<#RCtrl:: ; LeftWin + RightControl => Left-click (hold down Control/Shift to Control-Click or Shift-Click).
		SendEvent {Blind}{LButton down}
		KeyWait RCtrl ; Prevents keyboard auto-repeat from repeating the mouse click.
		SendEvent {Blind}{LButton up}
		return
		*<#AppsKey:: ; LeftWin + AppsKey => Right-click
		SendEvent {Blind}{RButton down}
		KeyWait AppsKey ; Prevents keyboard auto-repeat from repeating the mouse click.
		SendEvent {Blind}{RButton up}
		return
	; windows active key 
		#IfWinActive ahk_class classFoxitReader
			^k:: send {Down}{Down}{Down}{Down}{Down}{Down}
			^i:: send {Up}{Up}{Up}{Up}{Up}{Up}
		return	
