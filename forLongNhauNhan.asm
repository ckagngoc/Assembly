INCLUDE c:\Irvine\Irvine32.inc
INCLUDELIB c:\Irvine\Irvine32.lib

.DATA
    count DWORD ?
.CODE
main PROC
    mov eax, 1
    mov count, 1
    mov ebx, 2
    mov ecx, 4
L1:
    mov ecx, 4
L2:
    shl eax, 1
    loop L2
    inc count
    cmp count, 4
    ja TheEnd
    jmp L1
TheEnd:
    call WriteInt
    exit
main ENDP
END main