INCLUDE c:\Irvine\Irvine32.inc
INCLUDELIB c:\Irvine\Irvine32.lib

.386
.model flat, stdcall
.stack 1024

ExitProcess PROTO, dwExitCode:DWORD

.data
	N = 50
	array BYTE N dup(0)
	msg BYTE "Enter K you want: ", 0
	k DWORD ?
.code
	main PROC	
		mov edx, OFFSET msg
		call WriteString
		call ReadInt			;read integer from console
		mov k, eax
		call handleArray

		mov esi, OFFSET array
		mov ecx, LENGTHOF array
		mov ebx, TYPE array
		call DumpMem

		call DumpRegs

		call WaitMsg

		INVOKE ExitProcess, 0
	main ENDP

;_____________________SUBROUTINES________________________
	handleArray PROC uses eax ecx edx
		
		mov esi, OFFSET array
		mov ecx, N			;counter
		mov edx, 1			;index	
	L1:
		cmp eax, edx
		jne ifNotEqual
	
		mov BYTE PTR [esi], 1
		add eax, k

	ifNotEqual:
		inc edx
		add esi, TYPE array
		loop L1
		
		ret
	handleArray ENDP

END main

	