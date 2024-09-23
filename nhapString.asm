INCLUDE D:\\Irvine\\Irvine32.inc

.MODEL flat, stdcall
.STACK 100h

.DATA
    aNhapxaucuaban db "Nhap xau cua ban: ",0
    aSoluongkytu db "So luong ky tu: ",0
.CODE
main PROC
    call Clrscr
    mov edx, OFFSET aNhapxaucuaban
    call WriteString

    mov edx, 0
Dockytu:
    inc edx
    call ReadChar
    call WriteChar
    cmp al, 13
    jne Dockytu

    call Crlf

    push edx
    mov edx, OFFSET aSoluongkytu
    call WriteString
    pop edx
    mov eax, edx
    dec eax
    call WriteInt
    exit
main ENDP
END main