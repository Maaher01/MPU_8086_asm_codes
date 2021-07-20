include 'emu8086.inc'     
.model small
.stack 100h
.data    
str db 50 dup('$') 
len equ $-str 

.code
main proc
    mov ax,@data
    mov ds,ax 
    
    lea si,str
    mov dx,50
    call get_string
    define_get_string   
    
    gotoxy 0,1 
    
    lea si,str
    mov cx,50  
    
    compare: 
    cmp [si],0
    je break
    cmp [si],21h          ; compare with 21h
    jge check_greater     ; if >=21h check if <= 2Fh
    jmp print_char        ; if <21h normal character print
    
    continue:
    inc si
    loop compare   
    
    jmp break
    
    check_greater:
    cmp [si],2Fh
    jle print_space ; if <=2Fh true print space
    jmp print_char  ; else print char   
    
    print_char:
    mov dl,[si]  
    mov ah,02h
    int 21h
    jmp continue
    
    print_space: 
    mov dl,[si] 
    mov ah,02h
    int 21h 
    mov dl,20h  
    mov ah,02h
    int 21h
    jmp continue
       
break: 

endp main
end main