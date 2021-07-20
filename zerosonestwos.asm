.model small
.stack 100h

.data

    arr db 5,2,8,9,12,3,1,6,13
    len equ $-arr
    
    zeros db 5 dup (?)
    ones db 5 dup (?)
    twos db 5 dup (?)
    
    index_for_zeros dw 0
    index_for_ones dw 0
    index_for_twos dw 0

.code

pushToArray macro index
    
    mov al,[si]
    mov di, index
    add [di], al
    
    inc di
    mov index, di
    
    jmp back
    
endm pushToArray

main proc

    mov ax, @data
    mov ds, ax
    
    lea si, arr
    lea di, zeros
    mov index_for_zeros, di
    
    lea di, ones
    mov index_for_ones, di
    
    lea di, twos
    mov index_for_twos, di
    
    mov cx, len
    
    mov bl, 03h
    
    process:
           
           mov ah, 00h
           mov al, [si]
           div bl
           
           cmp ah, 01h
           je pushToOnes
           jl pushToZeros
           jg pushToTwos
           
           back:
           inc si
                        
    loop process
    
    hlt
    
    pushToZeros:
    pushToArray index_for_zeros 
          
    pushToOnes:
    pushToArray index_for_ones
       
    pushToTwos:
    pushToArray index_for_twos
              
    break:
        
endp main
end main