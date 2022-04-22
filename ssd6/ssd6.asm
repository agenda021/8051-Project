ds1 equ 30h


dc1 equ 34h
dc2 equ 35h
dc3 equ 36h

sl1 bit p2.0

count equ 40h
org 0000h

mov p0,#00h

mov ds1,#00h


main: mov count,#25h
loop:call display
djnz count ,loop
call incr
cjne a,#09h,loop
loop2: call display
djnz count ,loop2
call incr1
cjne a,#00h,loop2

incr:  inc ds1
mov a , ds1
cjne a,#09h,out
mov ds1,#09h
ret
incr1:  dec ds1
mov a , ds1
cjne a,#00h,out
 mov ds1,#00h
 ret

out: ret

  



display: clr sl1


mov dptr,#disp_lut
mov a,ds1
movc a,@a+dptr
mov p0,a

call delay



ret

delay:
; mov dc3,#07d
here:mov dc2,#05h
again:mov dc1,#0ffh
djnz dc1,$
djnz dc2,again
;djnz dc3,here
   ret 
disp_lut:
db 0fch 
db 60h
db 0dah
db 0f2h
db 066h
 db 0b6h
db 0beh
db 0e0h
db 0feh
db 0f6h
 


db 0eeh
db 03eh
db 9ch
db 7ah
db 9eh
db 8fh

end