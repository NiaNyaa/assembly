section .data
  var db 1, 2, 3
  buffer db 0
  
section .text
  global _start
  
_start:
  lea eax, [var]
  mov al, [eax]
  add al, '0'
  mov [buffer], al
  
  mov eax, 4
  mov ebx, 1
  lea ecx, [buffer]
  mov edx, 1
  int 0x80
  
  mov eax, 1
  xor ebx, ebx
  int 0x80
