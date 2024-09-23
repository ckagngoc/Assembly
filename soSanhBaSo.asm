INCLUDE c:\Irvine\Irvine32.inc
INCLUDELIB c:\Irvine\Irvine32.lib

.DATA
.CODE
main PROC
    mov eax, 2
    mov ebx, 4
    mov ecx, 3
    call max
    exit
main ENDP
max PROC
    cmp ebx, eax
    jae bLonHon
start:
    cmp ecx, eax
    ja cLonHon
    jmp return

bLonHon:
    mov eax, ebx
    jmp start
cLonHon:
    mov eax, ecx
return:
    ret
max ENDP
END main