INCLUDE C:\Irvine\Irvine32.inc

.MODEL flat, stdcall
.STACK 100h
.DATA
    msg db "dao nguoc toi !!!"
    msgSize = ($ - msg) - 1
.CODE
main PROC
    mov edx, OFFSET msg
    call WriteString

    call Crlf
    mov esi, 0

Tieptucpush:
    movzx eax, msg[esi]
    push eax
    inc esi
    cmp esi, msgSize + 1
    loopnz Tieptucpush

    mov esi, 0
Tieptucpop:
    pop eax
    mov msg[esi], al
    inc esi
    cmp esi, msgSize + 1
    loopnz Tieptucpop

    mov edx, OFFSET msg
    call WriteString

    exit
main ENDP
END main