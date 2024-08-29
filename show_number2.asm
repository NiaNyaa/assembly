section .data
  number db 15
  
section .bss
  buffer resb 2
  
section .text
  global _start
  
_start:
  mov al, [number]
  
  mov ah, 0
  mov bl, 10
  div bl
  add al, '0'
  mov [buffer], al
  
  mov al, ah
  add al, '0'
  mov [buffer+1], al
  jmp show
  
  

show:
  mov eax, 4
  mov ebx, 1
  mov ecx, buffer
  mov edx, 2
  int 0x80

exit:
  mov eax, 1
  xor ebx, ebx
  int 0x80
