section .data
  angka dw 1234         ; Menggunakan 'dw' untuk menyimpan angka 16-bit
  
section .bss
  buffer resb 5
  
section .text
  global _start
  
_start:
  mov ax, [angka]       ; Muat nilai 16-bit dari 'angka' ke 'ax'
  
  ; Ambil digit ribuan
  mov dx, 0
  mov bx, 1000
  div bx
  add ax, '0'
  mov [buffer], al
  
  ; Ambil digit ratusan
  mov ax, dx            ; Sisanya sekarang di 'dx'
  mov dx, 0
  mov bx, 100
  div bx
  add al, '0'
  mov [buffer+1], al
  
  ; Ambil digit puluhan
  mov ax, dx            ; Sisanya sekarang di 'dx'
  mov dx, 0
  mov bx, 10
  div bx
  add al, '0'
  mov [buffer+2], al
  
  ; Ambil digit satuan
  mov al, dl            ; 'dl' sekarang berisi digit satuan
  add al, '0'
  mov [buffer+3], al
  
  jmp show

show:
  mov eax, 4
  mov ebx, 1
  mov ecx, buffer
  mov edx, 4            ; Panjang string yang akan ditampilkan adalah 4 karakter
  int 0x80
  
exit:
  mov eax, 1
  xor ebx, ebx
  int 0x80
