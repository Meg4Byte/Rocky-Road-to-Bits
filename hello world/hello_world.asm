section .data
    hello db 'Hello, World!', 0    ; our string, with a null terminator

section .text
    global _start

_start:
    ; write our string to stdout
    mov rax, 1                      
    mov rdi, 1                      
    mov rsi, hello                  
    mov rdx, 13                    
    syscall                       

    ; exit the program
    mov rax, 60                  
    xor rdi, rdi                
    syscall                    

