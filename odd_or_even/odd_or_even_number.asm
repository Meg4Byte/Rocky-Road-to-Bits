section .bss
    num resb 4        ; Reserve 4 bytes for the input number
    result resb 1     ; Reserve 1 byte for the result message ('E' or 'O')

section .data
    msg db 'Enter a number: ', 0
    len equ $ - msg

    even_msg db 'Even', 0
    odd_msg db 'Odd', 0

section .text
    global _start

_start:
    ; Print the prompt message
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    ; Read the input number
    mov rax, 0
    mov rdi, 0
    mov rsi, num
    mov rdx, 4
    syscall

    ; Convert the input number from ASCII to integer
    movzx rax, byte [num]       ; move the first byte of input to rax and zero-extend
    sub rax, '0'                ; convert ASCII to integer

    ; Check if the number is odd or even
    mov rbx, rax
    and rbx, 1
    cmp rbx, 0
    je .even

.odd:
    mov rsi, odd_msg
    jmp .print_result

.even:
    mov rsi, even_msg

.print_result:
    ; Print the result message
    mov rax, 1
    mov rdi, 1
    mov rdx, 4
    syscall

    ; Exit the program
    mov rax, 60
    xor rdi, rdi
    syscall

