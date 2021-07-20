include 'emu8086.inc'     
.model small
.stack 100h
.data 
arr1 db 1, 2, 3, 4, 5
arr2 db 5, 4, 3, 2, 1  
sumarr db dup(0)  
temp dw 0
temp2 dw 0

.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea si,arr1
    lea di,arr2 
    lea bx,sumarr
    
    mov cx,5    
    
    sum: 
    mov al,[si] 
    mov ah,[di]
    add al,ah 
    mov [bx],al 
    inc si
    inc di  
    inc bx
    
    loop sum   
    
    lea si,sumarr
    
    gotoxy 0,1
    mov cx,5  
    
    print_sum:  
    mov ah,0
    mov al,[si]
    call print_num_uns
    define_print_num_uns
    mov ah,02h
    mov dl,' '
    int 21h
         
    inc si
    loop print_sum
    
break: 

endp main
end main