INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib
.stack 1000h
.DATA
	msg_1 BYTE "Nhap vao mot so: ",0
	msg_2 BYTE "Chuyen doi sang hex: ",0
	num WORD ?
	count WORD 0
.CODE
main PROC
	call Dec2Hex
	exit
main ENDP
;---------------------------------------------------------------------
Dec2Bin PROC
	mov edx, OFFSET msg_1
	call WriteString

	xor eax, eax
	xor edx, edx

	call ReadInt
	mov num, ax
	mov bx, 2
L1: 
	div bx
	push dx
	xor edx, edx
	mov num, ax
	inc count
	cmp ax, 0
	je L2
	mov ax, num
	jmp L1
L2:
	xor ecx, ecx
	mov cx, count

	mov edx, OFFSET msg_2
	call WriteString
L3: 
	pop ax
	add ax, 48
	call WriteChar
	loop L3

	ret
Dec2Bin ENDP
;---------------------------------------------------------------------
Dec2Hex PROC
	mov edx, OFFSET msg_1
	call WriteString

	xor eax, eax
	xor edx, edx

	call ReadInt
	mov num, ax
	mov bx, 16
L1: 
	div bx
	push dx
	xor edx, edx
	mov num, ax
	inc count
	cmp ax, 0
	je L2
	mov ax, num
	jmp L1
L2:
	xor ecx, ecx
	mov cx, count

	mov edx, OFFSET msg_2
	call WriteString
L3: 
	pop ax
	cmp ax, 10
	jae chu
	add ax, 30h
	call WriteChar
	jmp l
chu:
	add ax, 37h
	call WriteChar
l:
	loop L3

	ret
Dec2Hex ENDP
;---------------------------------------------------------------------
END main
