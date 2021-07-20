include 'emu8086.inc'
.model small
.stack 100h

.data

.code

main proc

    mov ax, @data
    mov ds, ax
    
    mov bl, 30h
    
    print 'Enter a string: '
    
    input:
    mov ah, 01h
    int 21h
    
    inc bl
    
    cmp al, 20h
    je exit
    
    jmp input
    
    exit:
    sub bl, 01h
    print 'The number of characters in the string is: '
    mov ah, 02h
    mov dl, bl
    int 21h
    
endp main
end main