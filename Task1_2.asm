.model small
.stack 100h       
.data     
x db 4
y db 3 
tempx dw 0
tempy dw 0 
 
.code
main proc
    mov ax, @data
    mov ds, ax   
    mov al,x
    dec al
    mov bl,al
    mul bl
    mov dx,ax
    mov al,y
    dec al
    mov bl,al
    mul bl 
    add ax,dx 
    mov tempx,ax 
    mov bx, 0F000h
    mov ss,bx
    mov bx, 0FFFEh      
    mov word ptr ss:[bx],ax
                     
endp main  
end main 