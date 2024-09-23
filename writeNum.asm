INCLUDE C:\Irvine\Irvine32.inc 
.MODEL SMALL
.STACK 100h
.DATA
    aNhapsocuaban db "Nhap so cua ban: ",0
    aDangnhiphan db "Dang nhi phan: ",0
    aDangthapphan db "Dangthapphan: ",0
.CODE
main PROC
    call Clrscr
    mov edx, OFFSET aNhapsocuaban
    call ReadInt

    push ax
    call DisplayDec 
    sub esp, 2

    push ax
    call DisplayHex
    sub esp, 2

main ENDP

DisplayDec PROC
    push ebp
    mov ebp, esp
    
DisplayDec ENDP
END main
