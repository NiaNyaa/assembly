
section .data
    msg db 'Arg: ', 0

section .bss
    arg resb 100

section .text
    global _start

_start:
    ; load argc (argument count)
    mov eax, [esp]

    ; check if argc > 1 (meaning argv[1] exists)
    cmp eax, 1
    jle no_args

    ; load argv[1]
    mov esi, [esp+4]    ; argv[0] (program name)
    mov esi, [esp+8]    ; argv[1]

    ; copy argv[1] to arg buffer
    mov edi, arg
copy_arg:
    lodsb
    stosb
    test al, al
    jnz copy_arg

    ; print the message "Arg: "
    mov eax, 4          
    mov ebx, 1          
    mov ecx, msg        
    mov edx, 5          
    int 0x80            

    ; print the argument
    mov eax, 4          
    mov ebx, 1          
    mov ecx, arg        
    mov edx, 100        
    int 0x80            

    ; exit program
    mov eax, 1          
    xor ebx, ebx        
    int 0x80            

no_args:
    ; print error message "Error: No argument passed"
    mov eax, 4          
    mov ebx, 1          
    mov ecx, error_msg  
    mov edx, 26         
    int 0x80            

    ; exit program
    mov eax, 1          
    xor ebx, ebx        
    int 0x80            

section .data
    error_msg db 'Error: No argument passed', 0

