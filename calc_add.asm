section .data
    buffer db '0000000000', 0   ; Buffer untuk menyimpan hasil konversi angka

section .text
    global _start

_start:
    ; Misalnya, kita menjumlahkan dua angka besar
    mov eax, 5323   ; Angka pertama (2147483648)
    add eax, 5342   ; Tambahkan dengan angka kedua (2147483647)
                          ; Hasilnya adalah 4294967295, yang merupakan maksimum unsigned 32-bit integer

    ; Konversi digit milyaran
    mov ebx, 1000000000   ; Pembagi untuk milyaran
    xor edx, edx          ; Bersihkan EDX untuk menerima sisa hasil bagi
    div ebx               ; EAX / 1000000000, EAX = digit milyaran, EDX = sisa
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer], al      ; Simpan di buffer

    ; Konversi digit ratus juta
    mov eax, edx          ; Pindahkan sisa hasil bagi ke EAX
    mov ebx, 100000000    ; Pembagi untuk ratus juta
    xor edx, edx          ; Bersihkan EDX
    div ebx               ; EAX / 100000000, EAX = digit ratus juta, EDX = sisa
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer + 1], al  ; Simpan di buffer

    ; Konversi digit puluhan juta
    mov eax, edx          ; Pindahkan sisa ke EAX
    mov ebx, 10000000     ; Pembagi untuk puluhan juta
    xor edx, edx          ; Bersihkan EDX
    div ebx               ; EAX / 10000000, EAX = digit puluhan juta, EDX = sisa
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer + 2], al  ; Simpan di buffer

    ; Konversi digit jutaan
    mov eax, edx          ; Pindahkan sisa ke EAX
    mov ebx, 1000000      ; Pembagi untuk jutaan
    xor edx, edx          ; Bersihkan EDX
    div ebx               ; EAX / 1000000, EAX = digit jutaan, EDX = sisa
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer + 3], al  ; Simpan di buffer

    ; Konversi digit ratus ribu
    mov eax, edx          ; Pindahkan sisa ke EAX
    mov ebx, 100000       ; Pembagi untuk ratus ribu
    xor edx, edx          ; Bersihkan EDX
    div ebx               ; EAX / 100000, EAX = digit ratus ribu, EDX = sisa
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer + 4], al  ; Simpan di buffer

    ; Konversi digit puluhan ribu
    mov eax, edx          ; Pindahkan sisa ke EAX
    mov ebx, 10000        ; Pembagi untuk puluhan ribu
    xor edx, edx          ; Bersihkan EDX
    div ebx               ; EAX / 10000, EAX = digit puluhan ribu, EDX = sisa
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer + 5], al  ; Simpan di buffer

    ; Konversi digit ribuan
    mov eax, edx          ; Pindahkan sisa ke EAX
    mov ebx, 1000         ; Pembagi untuk ribuan
    xor edx, edx          ; Bersihkan EDX
    div ebx               ; EAX / 1000, EAX = digit ribuan, EDX = sisa
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer + 6], al  ; Simpan di buffer

    ; Konversi digit ratusan
    mov eax, edx          ; Pindahkan sisa ke EAX
    mov ebx, 100          ; Pembagi untuk ratusan
    xor edx, edx          ; Bersihkan EDX
    div ebx               ; EAX / 100, EAX = digit ratusan, EDX = sisa
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer + 7], al  ; Simpan di buffer

    ; Konversi digit puluhan
    mov eax, edx          ; Pindahkan sisa ke EAX
    mov ebx, 10           ; Pembagi untuk puluhan
    xor edx, edx          ; Bersihkan EDX
    div ebx               ; EAX / 10, EAX = digit puluhan, EDX = sisa
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer + 8], al  ; Simpan di buffer

    ; Konversi digit satuan
    mov eax, edx          ; Pindahkan sisa ke EAX
    add eax, '0'          ; Konversi digit ke ASCII
    mov [buffer + 9], al  ; Simpan di buffer

    ; Tampilkan hasil
    mov eax, 4            ; sys_write
    mov ebx, 1            ; stdout
    mov ecx, buffer       ; Pointer ke buffer
    mov edx, 10           ; Panjang string (10 karakter)
    int 0x80              ; Panggil kernel

    ; Keluar dari program
    mov eax, 1            ; sys_exit
    xor ebx, ebx          ; Status 0
    int 0x80
