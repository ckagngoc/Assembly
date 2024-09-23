.MODEL SMALL
.STACK 100h
.DATA
    msg db "Hello $"
.CODE
main PROC
    mov ax, @data
    mov ds, ax
    mov dx, offset msg
    mov ah, 9h
    int 21h

    mov ah, 4ch
    int 21h
main ENDP
END main