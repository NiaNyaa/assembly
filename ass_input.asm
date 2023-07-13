section .data
    pesan db 'masukkan teks: ', 0
    buffer db 100
    panjang_buffer equ 100
    
section .text
    global _start
    
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, pesan
    mov edx, 15
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, panjang_buffer
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, panjang_buffer
    int 0x80
    
    mov eax, 1
    xor ebx, ebx
    int 0x80
