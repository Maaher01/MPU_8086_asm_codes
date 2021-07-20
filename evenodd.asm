.model small
.stack 100h

.data

    arr db 5,2,8,9,12,13
    len equ $-arr
    
    evenVar db 0
    oddVar db 0

.code 

main proc

    mov ax, @data
    mov ds, ax
        
    lea si, arr
    
    mov cl, 00h
    
    a:
    
        cmp cl, len
        je exit
        
        mov ah, 00h
        mov al, [si]
        mov bl, 02h
        div bl         
                      
        cmp ah, 01h
        je odd
        jne even
        
        back:
        inc cl
        inc si
            
    jmp a
    
    odd:                 
    mov dh, [si]
    add oddVar, dh
    jmp back
        
    even:
    mov dl, [si]
    add evenVar, dl
    jmp back
    
    exit:
           
endp main
end main