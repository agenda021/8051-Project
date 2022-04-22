ds1 equ 30h
ds2 equ 31h
ds3 equ 32h
ds4 equ 33h

dc1 equ 34h
dc2 equ 35h
dc3 equ 36h

sl1 bit p2.0
sl2 bit p2.1
sl3	bit p2.2
sl4 bit p2.3
count equ 40h
org 0000h
mov ds1,#00h
mov ds2,#00h
mov ds3,#09h
mov ds4,#09h

main: mov count,#01h
loop:call display
djnz count ,loop
call incr
cjne a,#09h+1,loop
loop2: call display
djnz count ,loop2
call incr1
cjne a,#00h-1,loop2

 jmp main
incr:  inc ds1
mov a , ds1
cjne a,#09h+1,out
mov ds1,#00h
  inc ds2
mov a, ds2
cjne a,#09h+1,out
mov ds1,#00h
mov ds2,#00h
ret
incr1:  dec ds3
mov a,ds3
cjne a,#00h-1,out
 mov ds3,#09h
 dec ds4
 mov a, ds4
cjne a,#00h-1,out
mov ds3,#09h
mov ds4,#09h
   ret
out: ret

display: clr sl1
setb sl2
setb sl3
setb sl4

mov dptr,#disp_lut
mov a,ds1
movc a,@a+dptr
mov p0,a

call delay

setb sl1
clr sl2
setb sl3
setb sl4

mov dptr,#disp_lut
mov a,ds2
movc a,@a+dptr
mov p0,a

call delay

setb sl1
setb sl2
clr sl3
setb sl4

mov dptr,#disp_lut
mov a,ds3
movc a,@a+dptr
mov p0,a

call delay

setb sl1
setb sl2
setb sl3
clr sl4

mov dptr,#disp_lut
mov a,ds4
movc a,@a+dptr
mov p0,a

call delay

ret

delay:
; mov dc3,#07d
here:mov dc2,#05h
again:mov dc1,#10h
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

end