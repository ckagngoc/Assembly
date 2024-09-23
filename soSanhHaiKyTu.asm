INCLUDE C:\Irvine\Irvine32.inc

.MODEL SMALL

.DATA
    aNhapkytuthunhat db "Nhap ky tu thu nhat: ",0
    aNhapkytuthuhai db "Nhap ky tu thu hai: ",0
    aKytulonhonla db "Ky tu lon hon la: ",0

.CODE
main PROC
    mov edx, OFFSET aNhapkytuthunhat
    call WriteString

    call ReadChar
    call WriteChar

    mov bl, al

    call Crlf

    mov edx, OFFSET aNhapkytuthuhai
    call WriteString

    call ReadChar
    call WriteChar

    call Crlf

    mov edx, OFFSET aKytulonhonla
    call WriteString
    cmp al, bl
    ja Neunhohon
    mov dl, al
    jmp Thoat
Neunhohon:
    mov dl, bl
Thoat:
    call WriteChar
    exit
main ENDP
END main