include 'emu8086.inc'
.model small
.stack 100h
.data
    array db 0,1,2,3,4,5,6,7,8,9
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, array
    mov cx, 10
    mov bl, [si]
    mov bh, [si]
    
    loop1:
    cmp [si], bl
    jl updateMin
    
    loop2:
    cmp [si], bh
    jg updateMax
    
    resume:
    inc si
    loop loop1
    
    print 'Smallest value is: '
    add bl, 48
    mov dl, bl
    mov ah, 02h
    int 21h
    
    print ' Largest value is: '
    add bh, 48
    mov dl, bh
    mov ah, 02h
    int 21h
    
    jmp exit
    
    updateMin:
    mov bl,[si]
    jmp resume
    
    updateMax:
    mov bh, [si]
    jmp resume
    
    exit:
    
endp main
end main