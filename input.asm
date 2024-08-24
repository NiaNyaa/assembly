
section .data
    prompt_name db 'Name:', 0
    prompt_name_len equ $ - prompt_name

    prompt_age db 'Age:', 0
    prompt_age_len equ $ - prompt_age

    newline db 0xA

section .bss
    name_buffer resb 256
    age_buffer resb 10
    name_length resb 10
    age_length resb 10

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_name
    mov edx, prompt_name_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, name_buffer
    mov edx, 256
    int 0x80
    mov [name_length], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_age
    mov edx, prompt_age_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, age_buffer
    mov edx, 10
    int 0x80
    mov [age_length], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, name_buffer
    movzx edx, byte [name_length]
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, age_buffer
    movzx edx, byte [age_length]
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
                               
