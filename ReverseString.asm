INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib
.DATA
	msg BYTE "Hello", 0dh
	lenMsg = $ - msg
.CODE
main PROC
	mov esi, 0			
	mov ecx, lenMsg		
L1: 
	mov al, msg[esi]	
	push eax
	inc esi
	loop L1
	mov esi, 0
	mov ecx, lenMsg

	mov edx, OFFSET msg
	call WriteString

	call Crlf
L2:
	pop eax
	mov msg[esi], al
	inc esi
	loop L2

	call WriteString
	Exit
main ENDP
END main