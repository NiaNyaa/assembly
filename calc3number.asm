
section .data
  number1 dw 100       
  number2 dw 50    
section .bss
  buffer resb 4
section .text
  global _start
_start:
  mov ax, [number1] 
  add ax, [number2]
  
  mov dx, 0
  mov bx, 1000
  div bx
  add ax, '0'
  mov [buffer], al
  
  mov ax, dx            
  mov dx, 0
  mov bx, 100
  div bx
  add al, '0'
  mov [buffer+1], al
  
  mov ax, dx            
  mov dx, 0
  mov bx, 10
  div bx
  add al, '0'
  mov [buffer+2], al
  
  mov al, dl
  add al,'0'
  mov [buffer+3], al

show:
  mov eax, 4
  mov ebx, 1
  mov ecx, buffer
  mov edx, 5            
  int 0x80
exit:
  mov eax, 1
  xor ebx, ebx
  int 0x80
  
