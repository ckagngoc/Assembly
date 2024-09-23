INCLUDE C:\Irvine\Irvine32.inc

.MODEL SMALL
.DATA
    aSaodaytroi db "Sao day troi: ",0
    aDongthu db "Dong thu ",0
.CODE
main PROC
    mov edx, OFFSET aSaodaytroi
    call WriteString

    mov ecx, 80
forr:
    mov al, "f"
    call WriteChar
    loop forr

call Crlf
    mov cx, 30
dowhile:
    mov al, 'w'
    call WriteChar
    cmp cx, 15
    loopne dowhile


    mov edx, 0
Hiendong:
    call Crlf
    mov ecx, 50
    push edx
    mov edx, OFFSET aDongthu
    call WriteString
    pop edx
    mov eax, edx
    inc eax
    call WriteInt
    mov al, ' '
    call WriteChar
Ghikytu:
    mov al, '*'
    call WriteChar
    loop Ghikytu
    inc edx
    cmp edx, 5
    jne Hiendong 
    exit
main ENDP
END main