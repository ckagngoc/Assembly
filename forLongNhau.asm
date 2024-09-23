INCLUDE c:\Irvine\Irvine32.inc
INCLUDELIB c:\Irvine\Irvine32.lib

.DATA
    sum DWORD ?
    count DWORD ?
.CODE
main PROC
    mov sum, 0
    mov count, 0
    mov ebx, 10
    mov ecx, 10
L1:
    mov ecx, 10
L2:
    inc sum
    loop L2
    inc count
    cmp count, 10
    ja TheEnd
    jmp L1
TheEnd:
    mov eax, sum
    call WriteInt
    exit
main ENDP
END main