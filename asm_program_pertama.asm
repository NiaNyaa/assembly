section .data
    pesan db 'hai', 0

section .text
    global _start
    
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, pesan
    mov edx, 4
    int 0x80
    
    ; keluar dari program
    mov eax, 1
    xor ebx, ebx
    int 0x80
