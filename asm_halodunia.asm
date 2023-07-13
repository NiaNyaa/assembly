section .data
    pesan1 db 'Halo ', 0
    pesan2 db 'Dunia', 0
    
section .text
    global _start
    
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, pesan1
    mov edx, 5
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, pesan2
    mov edx, 5
    int 0x80
    
    mov eax, 1
    xor ebx, ebx
    int 0x80
