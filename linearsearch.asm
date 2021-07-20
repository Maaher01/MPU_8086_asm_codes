include 'emu8086.inc'
.model small
.stack 100h
.data
    array db 1,2,3,4,5
    found db 10,13, 'Value found$'
    notfound db 10,13, 'Value not found$'
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 05h
    lea si, array
    
    print 'Enter a number to search: '
    
    mov ah, 01h
    int 21h
    
    sub al, 30h
    mov dl, al
    
    repeat:
    cmp dl, [si]
    je found1
    
    inc si 
    
    loop repeat
    
    lea dx, notfound
    mov ah, 09h
    int 21h
    jmp exit
    
    found1: 
    lea dx, found
    mov ah, 09h
    int 21h
    
    exit: 
        
endp main
end main