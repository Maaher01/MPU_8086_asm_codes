include 'emu8086.inc'     
.model small
.stack 100h
.data                
matrix db 5,2,6   
       db 8,3,6  
       db 9,0,1
       db 7,5,6
transpose db 4 dup(?)     
          db 4 dup(?)
          db 4 dup(?)                               
temp dw 0 
start dw 0
                               
.code
main proc
    mov ax,@data
    mov ds,ax  
   
    lea si,matrix
    lea di,transpose  
   
    mov cx,3
    
    outer:  
    mov start,si 
     
    mov temp,cx
    
    mov cx,4 
    
    inner:  
    mov al,[si]
    mov [di],al
     
    jmp increment 
     
    savepoint:   
    loop inner 
     
    mov cx,temp 
    mov si,start
    inc si

    loop outer 
    jmp break
    
    increment:
    inc si
    inc si
    inc si
    inc di
    jmp savepoint          
break:
    
endp main
end main