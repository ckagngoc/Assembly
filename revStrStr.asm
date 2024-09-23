INCLUDE C:\Irvine\Irvine32.inc
.MODEL SMALL
.STACK 100h
.DATA
    aNhapchuoi db "Nhap chuoi: ",0
    aKetqua db "Ket qua: ",0
.CODE
main PROC
    call Clrscr
    mov edx, OFFSET aNhapchuoi
    call WriteString
    xor eax, eax
    mov ecx, 0
Nhap:
    call ReadChar
    cmp al, 13
    jz Dungnhap
    call WriteChar
    push ax
    inc ecx
    jmp Nhap
Dungnhap:
    call Crlf
    mov edx, OFFSET aKetqua
    call WriteString
Tieptuc:
    pop ax
    sub ax, 20h
    call WriteChar
    loop Tieptuc
    exit
main ENDP
END main