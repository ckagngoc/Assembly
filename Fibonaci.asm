INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib
.DATA
	thongB1 BYTE "Nhap vao so Fibonaci can tinh: ",0
	thongB2 BYTE "So fibonaci can times la: ",0
	num WORD ?
.CODE
main PROC
	mov edx, OFFSET thongB1
	call WriteString

	xor eax, eax
	call ReadInt
	
	call fibo
	
	mov edx, OFFSET thongB2
	call WriteString

	call WriteInt

	xor eax, eax
	EXIT
main ENDP

fibo PROC
	cmp eax, 2
	jle Return
	push ecx
	push ebx
	mov ecx, eax
	mov eax, 1
	mov ebx, 1
L1:
	push ecx
	mov ecx, ebx
	add ebx, eax
	mov eax, ecx
	pop ecx
	loop L1

	mov eax, ebx
	pop ebx
	pop ecx
Return:
	mov eax, 1
	ret
fibo ENDP
END main