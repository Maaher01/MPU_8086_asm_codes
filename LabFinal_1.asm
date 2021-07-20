include 'emu8086.inc'
.model
.stack 100h
.data 
str db 20 dup(?) 
len equ $-str

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    mov dx, len
    print 'Input String: '
    call get_string

    mov cx, len
    upperCase:
    mov bl, [si]
    cmp bl, 'a'
    jb ok
    cmp bl, 'z'
    ja ok 

    and [si], 11011111b

    ok:
        inc si
        loop upperCase

    lea si, str 
    mov dx,13
    mov ah,2
    int 21h
    mov dx,10
    mov ah,2
    int 21h
    print 'Upper Case: '
    call print_string 

    lea di, str
    mov cx, len

    lowerCase:
    or [di], 00100000b

    ok2:
        inc di
        loop lowerCase

    mov dx,13
    mov ah,2
    int 21h
    mov dx,10
    mov ah,2
    int 21h
    print 'Lower Case: '
    call print_string
    hlt

    define_get_string
    define_print_string
endp main
end main