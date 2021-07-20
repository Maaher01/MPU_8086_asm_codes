include 'emu8086.inc'
.model small
.stack 100h
.data
    arr1 db 1, 2, 3, 4, 5
    arr2 db 5, 4, 3, 2, 1
    sumarray db 5 dup (?)
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, arr1
    lea di, arr2
    lea bx, sumarray
    mov cx, 5
    
    adding:
    mov ax, [si]
    mov dx, [di]
    add ax, dx
    mov [bx], ax
    
    inc si
    inc di
    inc bx
    loop adding:
    
    
endp main
end main