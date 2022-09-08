INCLUDE c:\Irvine\Irvine32.inc
INCLUDELIB c:\Irvine\Irvine32.lib

.386
.model flat, stdcall
.stack 1024

ExitProcess PROTO, dwExitCode:DWORD

.data
	msg BYTE "phamducminh", 0
.code
	main PROC
		mov esi, OFFSET msg
		mov ecx, LENGTHOF msg
	L1:
		and BYTE PTR [esi], 11011111b
		inc esi
		loop L1

		mov edx, OFFSET msg
		call WriteString
		call crlf

		call WaitMsg

		INVOKE ExitProcess, 0
	main ENDP

END main
