INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib

.386
.model flat, stdcall
.stack 1024

ExitProxess Proto, dwExitCode:DWORD

.data
	OUTTER_LOOP_COUNT = 3
	startTimes DWORD ?
	msg1 BYTE "Please wait...", 0dh, 0ah , 0
	msg2 BYTE "Elapsed miliseconds:", 0

.code
	main PROC
		mov edx, OFFSET msg1
		call WriteString

		call GetMSeconds			;start time
		mov startTimes, eax			
		mov ecx, OUTTER_LOOP_COUNT
		
	L1:
		call innerLoop
		loop L1

		call GetMSeconds			;finish time
		sub eax, startTimes
		
		mov edx, OFFSET msg2
		call WriteString
		call WriteDec
		call crlf

		call WaitMsg
		exit
	main ENDP

	innerLoop PROC uses ecx
		mov ecx, 0fffffffh
	
	L1:
		mul eax
		mul eax
		mul eax
		loop L1
				
		ret
	innerLoop ENDP

END main