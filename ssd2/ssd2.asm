ds1 equ 30h
ds2 equ 31h
ds3 equ 32h
ds4 equ 33h

dc1 equ 34h
dc2 equ 35h
dc3 equ 36h

sl1 bit p2.0
sl2 bit p2.1
sl3 bit p2.2
sl4 bit p2.3

org 0000h
mov p0,#00h
mov r0,#01h
mov a,#01h 

mov ds1,#01h


incr:inc ds1

main: call display
jmp incr

display: clr sl1
setb sl2
setb sl3
setb sl4

mov dptr,#disp_lut
mov a,ds1
movc a,@a+dptr
mov p0,a

call delay


mov a,r0
ret

delay:
; mov dc3,#07d
here:mov dc2,#500
again:mov dc1,#500
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