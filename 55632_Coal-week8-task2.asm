.model small
.stack 100h
.data                 ; Reserve space for future use (if needed)
.code
main proc
    ; Initialize the stack with the first two Fibonacci numbers
    mov ax, 0         ; First Fibonacci number F(0)
    push ax           ; Store F(0) on the stack
    mov ax, 1         ; Second Fibonacci number F(1)
    push ax           ; Store F(1) on the stack

    ; Loop to calculate the next 4 Fibonacci numbers (F(2) to F(5))
    mov cx, 4         ; Set loop counter for 4 iterations

calc_fib:
    pop bx            ; Retrieve the previous Fibonacci number (F(n-1))
    pop ax            ; Retrieve the one before the previous (F(n-2))
    add ax, bx        ; Calculate the next Fibonacci number F(n) = F(n-1) + F(n-2)
    push bx           ; Push F(n-1) back on the stack for the next iteration
    push ax           ; Push the newly calculated F(n) onto the stack

    loop calc_fib     ; Repeat until 6 numbers are generated

    ; Program termination
    mov ax, 4C00h     ; Return control to DOS
    int 21h           ; Interrupt to exit the program

main endp
end main