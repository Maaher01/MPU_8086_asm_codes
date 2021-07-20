include 'emu8086.inc'
.model small
.stack 100h
.data

    num db 5
    asterisk db '*'

.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ch, 00h
    mov cl, num
    mov bl, 01h
    
    loop1:
    mov cx, bx
    
    loop2:
    cmp bl, num
    jg exit
    
    mov ah, 02h
    mov dl, asterisk
    int 21h
    loop loop2
    
    inc bl
    mov ah, 02h
    mov dl, 0ah
    int 21h
    mov dl, 0dh
    int 21h
    loop loop1
    
    exit:
    
endp main
end main