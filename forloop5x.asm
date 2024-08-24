
section .data
    hello db 'Hello, World!', 0xA  
    hello_len equ $ - hello         

section .bss
    count resb 1                    

section .text
    global _start

_start:
    mov byte [count], 5            

print_hello:
    mov eax, 4                      
    mov ebx, 1                      
    mov ecx, hello                  
    mov edx, hello_len              
    int 0x80                        

    dec byte [count]                ; Decrement counter
    jnz print_hello                 ; Jump if not zero (i.e., if counter > 0)

exit:
    mov eax, 1                      
    xor ebx, ebx                    
    int 0x80                        

