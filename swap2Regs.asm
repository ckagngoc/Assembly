INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib

.386
.model flat, stdcall
.stack 1024

ExitProcess PROTO, dwExitCode:DWORD

.data
	msg1 BYTE "Before swap !!!", 0dh, 0ah, 0
	msg2 BYTE "After swap ^^", 0dh, 0ah, 0
	
.code
	main PROC

		mov eax, 5
		mov ebx, 6

		mov edx, OFFSET msg1	;before
		call WriteString
		call DumpRegs

		call swapValue2Regs

		mov edx, OFFSET msg2	;after
		call WriteString
		call DumpRegs

		call WaitMsg

		INVOKE ExitProcess, 0
		
	main ENDP

;__________________________SUBROUTINES________________________________

	swapValue2Regs PROC
		push eax
		mov eax, ebx
		pop ebx

		ret
	
	swapValue2Regs ENDP
		

END main
