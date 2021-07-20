.model small
.stack 100h

.data

arr db 6,3,1,4,0,8,9,2,7,5  
len equ $-arr
even db 5 dup (?)  
odd db 5 dup (?)

.code
main proc
    mov ax, data
    mov ds, ax 
    
    lea si, arr
    lea di,even 
    lea bx, odd 
    
    mov cx, len
    mov dl, 02h
    
    process: 
    mov ax, si
    div dl
    
    cmp ah, 0
    je equal  
    jne unequal
    
    back:
    loop process
    hlt 
    
    equal:  
    mov dh, [si] 
    mov [di], dh 
    inc si      
    inc di       
    jmp back  
    
    unequal:
    mov dh, [si] 
    mov [bx],dh 
    inc si       
    inc bx       
    jmp back
    
endp main
end main  




        

    