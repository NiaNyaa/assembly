section .data
  number db 253
  
section .bss
  buffer resb 4
  
section .text
  global _start
  
_start:
  mov al,[number]
  
  mov ah, 0
  mov bl, 100
  div bl
  add al, '0'
  mov [buffer], al
  
  mov al, ah
  mov ah, 0
  mov bl, 10
  div bl
  add al, '0'
  mov [buffer+1], al
  
  mov al, ah
  add al, '0'
  mov [buffer+2], al
  
  

show:
  mov eax, 4
  mov ebx, 1
  mov ecx, buffer
  mov edx, 3
  int 0x80
  
exit:
  mov eax, 1
  xor ebx, ebx
  int 0x80
