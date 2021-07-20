.model small
.stack 100h       
.data 
seg dw 0000h
off dw 0002h   
prev dw 0
curr dw 0 

.code
main proc
    mov ax, @data
    mov ds, ax   
    
    mov ax,1
    mov dx,1
    mov bx,seg
    mov ss,bx
    mov word ptr ss:[bx],ax   
    mov bx,0001h
    mov word ptr ss:[bx],ax   
    
    mov cx,21
    
    fib: 
    mov bx,ax
    add ax,dx 
    mov dx,bx   
    
    mov bx,off
    mov word ptr ss:[bx] , ax  
    
    inc bx
    mov off,bx 
    
    loop fib 
                    
endp main  
end main 