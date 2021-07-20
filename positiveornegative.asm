.model small
.stack 100h
.data
    msg1 db 10,13, "Enter a number:$"
    msg2 db 10,13, "The number is positive$"
    msg3 db 10,13, "The number is negative$"
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov dx, offset msg1
    mov ah, 09h
    int 21h
    
    input:
    mov ah, 01h
    int 21h
    
    cmp al, 20h
    
    mov bl, al
    mov cl, 30h
    
    cmp bl, cl
    jg positive
    jl negative
    
    positive:
    lea dx, msg2
    mov ah, 09h
    int 21h
    jmp exit:
    
    negative:
    lea dx, msg3
    mov ah, 09h
    int 21h
    jmp exit:
    
    exit:
  
endp main
end main