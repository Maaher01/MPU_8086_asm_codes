include 'emu8086.inc'
.model small
.stack 100h
.data
str db 30 dup('$')  
char db 0

.code
main proc
    mov ax,@data
    mov ds,ax 

    lea si,str  
    
    input:          
    mov ah, 01h
    int 21h  
    cmp al, 13  
    je char_input
       
    store:
    mov [si],al 
    inc si
    jmp input     
    
    char_input:      
    gotoxy 0,2
    mov ah,01h
    int 21h
    mov char,al   
                          
    mov bh,0
    mov bl,0
    lea si,str   
    
    check: 
    cmp [si],'$'
    je break 
    cmp [si],al  
    je found    
    inc bl     
    inc si
    
    jmp check  
    
found:  
gotoxy 0,2
mov ah,0h
mov ax,bx
call print_num_uns
define_print_num_uns   

break:

endp main
end main