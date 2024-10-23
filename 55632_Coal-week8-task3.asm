.model small
.stack 100h

.data
    ; Declare integers to be pushed onto the stack
    int1 dw 10
    int2 dw 20
    int3 dw 30
    int4 dw 40
    int5 dw 50

.code
main proc
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Push integers onto the stack
    push int1
    push int2
    push int3
    push int4
    push int5

    ; Pop integers from the stack and store in registers for demonstration 
    pop ax      ; Pop the last pushed integer (50)
    ; You can add code here to use or display AX if desired
    pop bx      ; Pop the next integer (40)
    ; Similarly, you can add code here to use or display BX
    pop cx      ; Pop the next integer (30)
    pop dx      ; Pop the next integer (20)
    pop si      ; Pop the first pushed integer (10)

    ; At this point, AX, BX, CX, DX, SI contain the popped values.

    ; Clearing the stack using BP
    mov bp, sp  ; Set BP to the current stack pointer (SP)
    ; Note: No need to manually clear the stack after popping; this example is just to demonstrate using BP.

    ; Exit program
    mov ax, 4C00h   ; Terminate program
    int 21h
main endp  
end main