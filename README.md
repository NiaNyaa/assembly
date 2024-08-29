Run x86 Assembly:
```
nasm -f elf32 name_file.asm -o name_file.o
ld -m elf_i386 -o name_file name_file.o
./name_file
```


```
al (8-bit): Hanya bisa menampung nilai dari 0 hingga 255.
ax (16-bit): Bisa menampung nilai dari 0 hingga 65,535.
eax (32-bit): Bisa menampung nilai dari 0 hingga 4,294,967,295.
rax (64-bit): Bisa menampung nilai dari 0 hingga 18,446,744,073,709,551,615.
```
