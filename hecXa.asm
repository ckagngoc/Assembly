INCLUDE D:\DucMinh\Assembly\self-learn\Irvine

.386
.MODEL flat, stdcall
.DATA
    aGiatriala db "Gia tri a la: ",0
    aGiatrisauxuly db "Gia tri sau xu ly la: ",0
.CODE
main PROC
    call Clrscr
    mov edx, OFFSET aGiatriala
    call WriteString
    mov eax, 5A6Bh
    call WriteHex
    call Crlf
    mov ecx, 16

lap:
    rol eax, 1
    rcr eax, 1
    loop lap

    mov edx, OFFSET aGiatrisauxuly
    call WriteString
    call WriteHex
    exit
main ENDP
END main