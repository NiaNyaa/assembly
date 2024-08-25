section .data
    msg db 'Hasil: ', 0 ; String untuk mencetak hasil
    len equ $-msg       ; Panjang string msg

section .bss
    res resb 5          ; Buffer untuk menyimpan hasil biner sebagai ASCII

section .text
    global _start

_start:
    ; Penjumlahan Biner
    mov al, 0010b       ; Memuat angka biner pertama (0001)
    add al, 0010b       ; Menambahkan angka biner kedua (0001), hasilnya 0010

    ; Konversi ke ASCII
    mov cl, 4           ; Jumlah bit (4-bit)
    mov edi, res + 3    ; Mengatur pointer ke akhir buffer (untuk menyimpan digit ASCII)
    mov [edi+1], byte 0 ; Terminator string ASCII (null-terminated string)

convert_loop:
    mov bl, al          ; Salin hasil ke BL
    and bl, 1           ; Ambil bit paling rendah
    add bl, '0'         ; Konversi bit ke karakter ASCII ('0' atau '1')
    mov [edi], bl       ; Simpan karakter di buffer
    dec edi             ; Pindahkan pointer buffer ke kiri
    shr al, 1           ; Shift kanan AL untuk memproses bit berikutnya
    dec cl              ; Kurangi bit counter
    jnz convert_loop    ; Ulangi sampai semua bit diproses

    ; Output
    ; Menampilkan string 'Hasil: '
    mov eax, 4          ; sys_write
    mov ebx, 1          ; File descriptor 1 (stdout)
    mov ecx, msg        ; Pesan yang akan dicetak
    mov edx, len        ; Panjang pesan
    int 0x80            ; Panggil kernel untuk mencetak

    ; Menampilkan hasil konversi biner ke ASCII
    mov eax, 4          ; sys_write
    mov ebx, 1          ; File descriptor 1 (stdout)
    mov ecx, res        ; Buffer hasil yang akan dicetak
    mov edx, 4          ; Panjang hasil (4 karakter)
    int 0x80            ; Panggil kernel untuk mencetak

    ; Keluar
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; Status exit code 0
    int 0x80            ; Panggil kernel untuk keluar
