INCLUDE C:\Irvine\Irvine32.inc

.386
.MODEL SMALL
.STACK 100h

.DATA
    msg BYTE "Hello world from Asm",0
    val1 DWORD 12345678h
.CODE
main PROC
    ; Gọi hàm in ra màn hình
    mov edx, OFFSET msg
    call WriteString

    xor eax, eax
    xor edx, edx
    mov al, 9ch
    mov dl, 64h
    add al, dl

    mov eax, val1
    call DumpRegs
    exit
main ENDP
END main
