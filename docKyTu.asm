.MODEL SMALL
.STACK 100h
.DATA 
    aNhapvaomotkytu BYTE "Nhap vao mot ky tu: ",0
    aKytuhople BYTE "Ky tu hop le !!!",0
    aKytusai BYTE "Ky tu sai !!!",0
.CODE
main PROC
    mov edx, OFFSET aNhapvaomotkytu
    call WriteString

    call ReadChar
    mov dl, al
    call WriteChar
    call Crlf
    cmp al, 79h
    jz Hople
    cmp al, 59h
    jz Hople
    mov edx, OFFSET aKytusai
    jmp Thoat
Hople:
    mov edx, OFFSET aKytuhople
Thoat:
    call WriteString
    exit
main ENDP
END main