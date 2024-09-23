INCLUDE C:\Irvine\Irvine32.inc
INCLUDELIB C:\Irvine\Irvine32.lib
.DATA
	source BYTE "This is the source string", 0
	target BYTE SIZEOF source DUP ("#"), 0
	len = $ - target
.CODE
main PROC
	MOV edx, OFFSET source
	CALL WriteString

	CALL Crlf

	MOV ecx, len
	MOV esi, 0
L1:
	MOV al, [source + esi]
	mov [target + esi], al
	inc esi
	loop L1

	MOV edx, OFFSET target
	CALL WriteString

	EXIT
main ENDP
END main