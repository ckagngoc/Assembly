INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib

.386
.model flat, stdcall
.stack 1024

ExitProcess PROTO, dwExitCode:DWORD

.data
	array DWORD 47 dup(?)
.code
	main PROC
		mov eax, 01h
		mov esi, OFFSET array
		mov [esi], eax
		add esi, TYPE array
		mov [esi], eax
		add esi, TYPE array
		mov ecx, LENGTHOF array
		sub ecx, 2

	L1:
		call generateFibonacci
		add esi, TYPE array
		loop L1
		
		mov esi, OFFSET array
		mov ecx, LENGTHOF array
		mov ebx, TYPE array
		call DumpMem

		call WaitMsg

		INVOKE ExitProcess, 0
	main ENDP

;____________________SUBROUTINES________________________

	generateFibonacci PROC uses eax ebx esi
		mov eax, [esi - 4]
		mov ebx, [esi - 8]
		add eax, ebx
		mov [esi], eax
		ret
	generateFibonacci ENDP

END main