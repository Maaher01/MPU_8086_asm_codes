include 'emu8086.inc'
.model small
.stack 100h
.data
array db 50 dup(0) 

dimension dw ?
temp dw ?

.code 
main proc
        mov ax, @data
        mov ds, ax 
        
        mov ah, 01h
        int 21h
        sub al, 30h
        mov ah, 0 
        mov bx, ax
        mul ax
        mov dimension, bx
        mov temp, ax
        
        mov ah, 02h
        mov dl, 0ah
        int 21h
        mov dl, 0dh
        int 21h

        mov cx, dimension
        a:
            mov [si], 1
            mov dx, dimension
            inc dx
            add si, dx
        
        loop a
        
        lea si, array
        mov cx, temp
        b:  
            mov ah, 02h
            mov dl, [si]
            add dl, 48
            int 21h
            inc si
            
        loop b 
        hlt
                    
define_print_num
define_print_num_uns                
endp main
end main