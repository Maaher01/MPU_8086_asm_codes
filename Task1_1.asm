.model small
.stack 100h       
.data
.code
main proc
    mov ax, @data
    mov ds, ax  
    
    mov al,02h  
    mov bl, 04h
    mul bl     
    mov bx,0F000h 
    mov ds,bx
    mov bx,0FFFEh
    mov word ptr ds:[bx],ax           
    
    mov ah,0 
    mov al,08h
    mov bl,02h
    div bl
    mov bx,0F000h
    mov ds,bx
    mov bx,0FFFFh
    mov byte ptr ds:[bx], al     
                    
endp main 
end main 