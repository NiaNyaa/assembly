section .data
  num1 db 10
  num2 db 10
  sama db "Sama"
  sama_len equ $ - sama
  beda db "Beda"
  beda_len equ $ - beda
  
section .text
  global _start
  
_start:
  mov eax, [num1]
  mov ebx, [num2]
  cmp eax, ebx
  je ifsama
  

ifsama:
  mov eax, 4
  mov ebx, 1
  mov ecx, sama
  mov edx, sama_len
  int 0x80
  jmp exit

ifbeda:
  mov eax, 4
  mov ebx, 1
  mov ecx, beda
  mov edx, beda_len
  int 0x80
  jmp exit
  

exit:
  mov eax, 1
  xor ebx, ebx
  int 0x80
  
