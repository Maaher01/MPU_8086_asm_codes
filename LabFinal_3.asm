include 'emu8086.inc'
.model
.stack 100h
.data 
str db 20 dup('$')
len equ $-str

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    lea si , str
    
    mov cx, 4
    input:
        mov ah, 01h
        int 21h
        mov [si], al
        inc si
    loop input
    
    mov dh, 0
    mov dl, 0
    mov ah, 0
    mov al, 0
     
    lea si, str
    
    mov cx, 4
    
    comparison:
        mov bl, [si]
        cmp bl, '9'
        jl notOk
        cmp bl, '9'
        jg ok
    point:
    loop comparison 
      
    hlt        
        
    notOk:
        inc dl
        inc si
        jmp point
            
    ok: 
        inc al
        inc si    
        jmp point 
        
endp main
end main 

