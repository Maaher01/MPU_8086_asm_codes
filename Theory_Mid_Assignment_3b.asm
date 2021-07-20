.model small
.stack 100h

.data
    
    StarNumber dw 5
    style db '*'    

.code 


     

main proc 
    mov ax, @data
    mov ds, ax
    
    mov cx, 8
    mov ah, 0 ; count
    
    mov al, 02h
    mov bl, 04h
    xor al, bl
    
    mov dl, al
    
    savepoint:
    
    process:
    shr dl, 1
    jc CountInc
    
    loop process
    
    mov bh, 01h
    cmp ah, bh
    je adjacent
    jne notAdjacent
    
    
    
    CountInc: 
        inc ah
        jmp savepoint 
    
     
     adjacent:
        mov dl, 01h
        hlt
       
     
     notAdjacent:
        mov dl, 00h
        hlt
     
     
    
    
    
    
    
    
     
    
    
     
    
    
    

endp main
end main          
  
  