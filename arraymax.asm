include 'emu8086.inc'
.model small
.stack 100h
.data
    array db 0,1,2,3,4,5,6,7,8, 9

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, array
    mov cx, 10
    mov bl, [si]
    
    loop1:
    cmp [si], bl
    jge max
    comparison:
    inc si
    loop loop1
    
    print "The maximum number in the array is: "
    add bl, 48
    mov dl, bl
    mov ah, 02h
    int 21h
    
    max:
    mov bl, [si]
    jmp comparison
    
endp main
end main