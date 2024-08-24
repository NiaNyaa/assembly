x86 Assembly:
```
nasm -f elf32 name_file.asm -o name_file.o
ld -m elf_i386 -o name_file name_file.o
./name_file
```
