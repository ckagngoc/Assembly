INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib

.386
.MODEL flat, stdcall ;model
.stack 4096          ;create stack

ExitProcess PROTO, dwExitCode: dword

.data

	array DWORD 100, 10, 20, 30, 145, 155, 206
	theSum DWORD ?

	;NOTE: title is keyword, do not use it
	caption BYTE "Virussssss", 0
	msg BYTE "This virus attacking your PC", 0dh, 0ah
		BYTE "Try defeat this !!!!", 0

.code 
;main procedure
	main PROC
		mov eax, 4
		mov ebx, 5
		mov ecx, 7
		call SumThreeVar

		mov esi, OFFSET array	;esi points to array
		mov ecx, LENGTHOF array	;ecx = array count
		call ArraySum			;caculate the sum
		mov theSum, eax

		mov esi, OFFSET array	;esi points to array
		mov ecx, LENGTHOF array  ;ecx is counter of array
		mov ebx, TYPE DWORD		;ebx is unit of each element
		call DumpMem			;show on display a range of memory (example an array)

		call DumpRegs			;show on display value of registers and flag


		mov ebx, OFFSET caption			;move offset title to ebx
		mov edx, OFFSET msg				;move offset messenge to edx
		call MsgBox					;call MsgBox Procedure

		call WaitMsg

		INVOKE ExitProcess, 0   ;call ExitProcess and return 0

	main ENDP

;---------------SUBROTINE SumThreeVar--------------------------------

	SumThreeVar PROC

	add eax, ebx
	add eax, ecx	

	ret
	SumThreeVar ENDP

;----------------------ArraySum--------------------------------------

	ArraySum PROC USES esi ecx

	;push esi	;save esi and ecx into stack
	;push ecx
	xor eax, eax	;set eax = 0

L1:
	add eax, [esi]		;add each integer to eax
	add esi, TYPE DWORD	;point to next integer
	loop L1			;repeat for array size

	;pop ecx			;restore ecx, esi
	;pop esi

	ret
	ArraySum ENDP

end main
