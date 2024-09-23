INCLUDE C:\Irvine\Irvine32.inc

.MODEL SMALL
.STACK 100h
.DATA
    aNhapvao db "Nhap vao mot chu so: ",0
    aChuso db "Chu so bu 9 la: ",0
    aNhapkytu db "Nhap ky tu cua ban: ",0

.CODE
main PROC
Thongbaonhap:
    mov edx, OFFSET aNhapvao
    call WriteString
Nhanso:
    call ReadInt    ;Gia tri luu trong al sau khi nhap
    call DumpRegs   ;In ra gia tri thnah ghi
Xulyso:
    not eax         
    call DumpRegs
    add eax, 9      ;Bu 9
    call DumpRegs
Thongbaohoanthanh:
    mov edx, OFFSET aChuso
    call WriteString
Inrasodaxuly:
    mov edx, eax
    call WriteInt
    mov ecx, 20
Nhankytu:
    call Crlf
    mov edx, OFFSET aNhapkytu
    call WriteString
    call ReadChar
    mov edx, eax
    call WriteChar
    ; call DumpRegs
    cmp al, 13
    loopnz Nhankytu
    exit
main ENDP
END main