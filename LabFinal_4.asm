.model small
.stack 100h
.data
str db 5 dup('$') 
a db 0 
e db 0
i db 0
o db 0
u db 0

.code
main proc
        mov ax, @data
        mov ds, ax 
        
        lea si, str
        mov cx, 5 
        
        input:
            mov ah, 01h
            int 21h
            mov [si], al
            inc si
        loop input
        
        lea si, str
        mov cx, 5
        comp:
            mov bl, [si]
            cmp bl, 'a'
            je counta
            
            save_a:
            
            cmp bl, 'A'
            je counta
            
            saveA:
            
            cmp bl, 'e'
            je counte
            
            save_e:
            
            cmp bl, 'E'
            je counte
            
            saveE: 
            
            cmp bl, 'i'
            je counti
            
            save_i:
                  
            cmp bl, 'I'
            je counti
            
            saveI:
            
            cmp bl, 'o'
            je counto
            
            save_o:
            
            cmp bl, 'O'
            je counto
            
            saveO:
            
            cmp bl, 'u'
            je countu
            
            save_u:
            
            cmp bl, 'U'
            je countu
            
            saveU: 
            
            inc si
            
          loop comp
            
          hlt   
            
          counta:
            add a, 1 
            cmp bl, '_'
            jl saveA
            jg save_a
            
          counte:
            add e, 1
            cmp bl, '_'
            jl saveE
            jg save_e
            
          counti:
            add i, 1
            cmp bl, '_'
            jl saveI
            jg save_i
            
          counto:
            add o, 1
            cmp bl, '_'
            jl saveO
            jg save_o
            
          countu:
            add u, 1
            cmp bl, '_'
            jl saveU
            jg save_u
                 
endp main
end main