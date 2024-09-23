INCLUDE C:\Irvine\Irvine32.inc

.MODEL SMALL

.DATA
    aNhapa db "Nhap a: ",0
    aResult db "Result: ",0

.CODE
main PROC
    mov edx, OFFSET aNhapa
    call WriteString

    call ReadInt

    call Crlf

    mov edx, OFFSET aResult
    call WriteString

    cmp al,0
    ja Lonhon0
    jb Nhohon0
    mov al, 0
    jmp Write
Lonhon0:
    mov al, 1
    jmp Write
Nhohon0:
    mov al, 1
    not al
    add al, 1
    jmp Write
Write:
    call WriteInt
    exit
main ENDP
END main