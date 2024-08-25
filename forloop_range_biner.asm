section .data
    newline db 0xA   ; newline character

section .bss
    counter resb 1   ; reserve space for counter
    res resb 8       ; reserve space for binary result (8-bit number)

section .text
    global _start

_start:
    ; Initialize counter to 1
    mov byte [counter], 1

loop_start:
    ; Load the current counter value into AL
    mov al, [counter]
    ; Convert the value in AL to binary and print it
    call print_binary

    ; Print newline
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, newline    ; pointer to newline character
    mov edx, 1          ; length = 1
    int 0x80

    ; Increment counter
    inc byte [counter]

    ; Check if the counter has reached 101 (end of loop)
    cmp byte [counter], 1001 ; here is the value xD
    jne loop_start      ; Jump to loop_start if counter < 101

    ; Exit
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; return 0
    int 0x80

; Function to print binary representation of the number in AL
print_binary:
    ; Prepare registers for the loop
    mov cl, 8           ; Process 8 bits
    mov edi, res + 7    ; Point to the end of the buffer

print_loop:
    mov bl, al          ; Copy the value in AL to BL
    and bl, 1           ; Get the lowest bit
    add bl, '0'         ; Convert to ASCII ('0' or '1')
    mov [edi], bl       ; Store the character in the buffer
    dec edi             ; Move buffer pointer to the left
    shr al, 1           ; Shift right AL to process the next bit
    dec cl              ; Decrement bit counter
    jnz print_loop      ; Repeat until all bits are processed

    ; Print the binary value
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    lea ecx, [edi + 1]  ; Pointer to the start of the result in buffer
    mov edx, 8          ; Length of the result (8 characters)
    int 0x80

    ret
