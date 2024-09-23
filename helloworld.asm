.386
.MODEL flat, stdcall ;model
.stack 1024          ;create stack

ExitProcess PROTO, dwExitCode: dword

.data
   msg BYTE "This is your first assembly program", 0  ;msg
   ;length
   len = ($ - msg) - 1

.code 
   ;main procedure
   main PROC

      mov edx, OFFSET msg
      mov ecx, len
      mov ebx, 1
      mov eax, 4
      int 80h

      INVOKE ExitProcess, 0   ;call ExitProcess and return 0

   main ENDP

end main