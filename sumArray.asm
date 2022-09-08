INCLUDE C:\Irvine\Irvine32.inc 
Includelib C:\Irvine\Irvine32.lib

.386
.model flat, stdcall
.stack 1024

ExitProcess proto, dwExitCode:DWORD

.data
    
     msg BYTE "Please enter a signed integer: ", 0

     arrayD SDWORD 12345678h, 1A4B2000h, 3434h, 7AB9h

     arrayFunc2 SWORD 4 dup(?)

     theSum SDWORD ?
     
.code 
     main proc
     
          mov esi, OFFSET arrayD        ;index
          mov ecx, LENGTHOF arrayD      ;counter
          mov ebx, TYPE arrayD          ;size of a element
          call DumpMem                  ;display array


          mov esi, OFFSET arrayFunc2    ;index
          mov ecx, LENGTHOF arrayFunc2  ;counter
          call createArray

          mov esi, OFFSET arrayFunc2
          mov ecx, LENGTHOF arrayFunc2
          mov ebx, TYPE arrayFunc2
          call DumpMem

          call arraySum

          mov theSum, eax

          call WaitMsg                  ;Please hit anybutton...

          INVOKE ExitProcess, 0
     main endp

    ;------------------------------SUBROUTINES-----------------------------

     createArray proc uses edx esi ecx
     
     L1:
          mov edx, OFFSET msg      ;mov offset msg to edx
          call WriteString
          call ReadInt             ;read integer from keyboard
          mov [esi], eax           ;trans value integer to arrayFun2
          call crlf                ;\n
          add esi, TYPE arrayFunc2 ;next element
          loop L1                  ;loop by do dec(ecx)     
     
          ret
     createArray endp

     arraySum proc uses esi ecx
          xor eax, eax
     L2:  
          add eax, [esi]
          add esi, TYPE arrayFunc2
          loop L2
          
          ret
     arraySum endp

end main