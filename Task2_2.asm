include 'emu8086.inc'
.model small
.stack 100h
.data
str db 16 dup('$')

.code
main proc
    mov ax,@data
    mov ds,ax   
               
    lea si,str  
    mov bh,0
    mov bl,0 
    
    string:
    mov ah, 01h
    int 21h  
    cmp al, 13  
    je break 
    
    comparison:  
    cmp al,'1' 
    je countinc
      
    not1:
    mov [si],al 
    inc si
    jmp string        
    
    countinc:
     inc bl  ; increment 1 count
     jmp not1  
    
break:
gotoxy 0,1  

mov ax,bx
call print_num_uns
define_print_num_uns   


endp main
end main