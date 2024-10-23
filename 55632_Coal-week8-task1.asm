.model small
.stack 100h

.data
    inputString db "Muhammad Waqas", 0  ; Input string with null terminator

.code
main proc
    mov ax, @data         ; Setup data segment
    mov ds, ax

    ; Determine the length of the string
    lea si, inputString   ; SI points to the start of the string

find_length:
    mov al, [si]          ; Load each character from the string into AL
    cmp al, 0             ; Check if it's the null terminator
    je start_reverse      ; If null terminator found, jump to reverse process
    inc si                ; Move SI to the next character
    jmp find_length       ; Continue until null terminator

start_reverse:
    dec si                ; Point SI to the last valid character in the string
    lea di, inputString   ; Load starting address of string into DI

swap_loop:
    cmp si, di            ; Compare start and end pointers (SI and DI)
    jle finish_reverse    ; If SI <= DI, swapping is done
    ; Swap process
    mov al, [di]          ; Load character from the start into AL
    mov bl, [si]          ; Load character from the end into BL
    mov [di], bl          ; Place end character at the start
    mov [si], al          ; Place start character at the end

    inc di                ; Move DI to the next character from the start
    dec si                ; Move SI to the previous character from the end
    jmp swap_loop         ; Repeat until SI and DI meet

finish_reverse:
    ; Exit the program
    mov ax, 4C00h         ; Prepare for program termination
    int 21h               ; Interrupt to exit

main endp
end main