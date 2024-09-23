INCLUDE C:\\Irvine\\Irvine32.inc

.MODEL small
.STACK 100h

.DATA
    arrayW WORD 1234h, 2345h, 3456h
.CODE
main PROC
    mov eax, 4294967296
    mov ebx, 2
    call DumpRegs
    add al, bl
    call DumpRegs
    Exit
main ENDP
END main