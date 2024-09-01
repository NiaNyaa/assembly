section .data
    msg db 'Count: ', 0     ; Pesan yang akan ditampilkan sebelum angka
    newline db 0xA         ; Karakter newline

section .bss
    counter resb 1         ; Ruang untuk counter
    buffer resb 4          ; Ruang untuk buffer hasil konversi

section .text
    global _start

_start:
    ; Inisialisasi counter ke 1
    mov byte [counter], 1

loop_start:
    ; Load counter ke AL
    mov al, [counter]

    ; Konversi angka ke string dan simpan di buffer
    call int_to_str

    ; Tampilkan pesan "Count: "
    mov eax, 4            ; sys_write
    mov ebx, 1            ; stdout
    mov ecx, msg          ; pointer ke pesan
    mov edx, 7            ; panjang pesan
    int 0x80              ; panggil kernel

    ; Tampilkan hasil konversi angka
    mov eax, 4            ; sys_write
    mov ebx, 1            ; stdout
    lea ecx, [buffer]    ; pointer ke buffer
    mov edx, 4            ; panjang hasil (maksimal 4 karakter)
    int 0x80              ; panggil kernel

    ; Tampilkan newline
    mov eax, 4            ; sys_write
    mov ebx, 1            ; stdout
    mov ecx, newline      ; pointer ke newline
    mov edx, 1            ; panjang newline
    int 0x80              ; panggil kernel

    ; Increment counter
    inc byte [counter]

    ; Periksa apakah counter >= 101
    cmp byte [counter], 101
    jl loop_start         ; Jika counter < 101, lanjutkan loop

    ; Keluar dari program
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; status 0
    int 0x80              ; panggil kernel

; Fungsi untuk mengkonversi integer ke string
int_to_str:
    mov ecx, buffer       ; pointer ke buffer
    movzx eax, al         ; ambil nilai counter (1 byte ke 32-bit)
    mov edi, 10           ; divisor untuk angka desimal

    ; Konversi angka ke string
    mov ebx, 0            ; inisialisasi panjang string
    add ecx, 4            ; pointer ke akhir buffer

convert_loop:
    xor edx, edx          ; bersihkan EDX
    div edi               ; EAX / 10, hasil di EAX, sisa di EDX
    add dl, '0'           ; konversi ke karakter ASCII
    dec ecx               ; mundur pointer buffer
    mov [ecx], dl         ; simpan karakter di buffer
    inc ebx               ; panjang string
    test eax, eax         ; apakah sisa hasil bagi 0?
    jnz convert_loop      ; jika tidak, lanjutkan konversi

    ; Null-terminate string
    mov byte [ecx - 1], 0

    ret
