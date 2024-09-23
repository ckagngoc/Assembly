INCLUDE C:\Irvine\Irvine32.inc

.MODEL small
.STACK 100h

.DATA
    msg byte "Hay go vao mot chu cai thuong: ",0
    request byte "Chu cai Hoa tuong ung la: ",0
.CODE
main PROC
    mov edx, OFFSET msg
    call WriteString

    call ReadChar

    mov dx,ax
    call WriteChar

    call Crlf

    mov edx, OFFSET request
    call WriteString

    sub ax,32

    mov dx,ax
    call WriteChar
    exit
main ENDP
END main