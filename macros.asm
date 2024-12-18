; TeddyWareZ MSX Z80 source file.
;
; Prog: macro's
; Code: d-fader^TwZ.
; Date: april 6, 1999
;
; cmnt: none.
; 
; coded in Chaos Assembler 2.0
;
; (C) 1999 TeddyWareZ!

; error codes returned in register C after a disk-error occurs:
Err_DiskOffline:			equ %00000010
Err_DiskIOError:			equ %00001010
Err_WriteProtect:			equ %00000000



; Key Codes
; Key codes used for the routine ScanKey in macro's.asm

key_0:		equ $0100
key_1:		equ $0200
key_2:		equ $0400
key_3:		equ $0800
key_4:		equ $1000
key_5:		equ $2000
key_6:		equ $4000
key_7:		equ $8000

key_8:		equ $0101
key_9:		equ $0201
minus:		equ $0401
equal:		equ $0801
backslash:		equ $1001
left_brk:		equ $2001
right_brk:		equ $4001
semicolon	 	equ $8001

apostrophe:		equ $0102
back_apostrophe:	equ $0202
comma:		equ $0402
dot:			equ $0802
slash:		equ $1002
acc:			equ $2002
key_a:		equ $4002
key_b:		equ $8002

key_c:		equ $0103
key_d:		equ $0203
key_e:		equ $0403
key_f:		equ $0803
key_g:		equ $1003
key_h:		equ $2003
key_i:		equ $4003
key_j:		equ $8003

key_k:		equ $0104
key_l:		equ $0204
key_m:		equ $0404
key_n:		equ $0804
key_o:		equ $1004
key_p:		equ $2004
key_q:		equ $4004
key_r:		equ $8004

key_s:		equ $0105
key_t:		equ $0205
key_u:		equ $0405
key_v:		equ $0805
key_w:		equ $1005
key_x:		equ $2005
key_y:		equ $4005
key_z:		equ $8005

shift:		equ $0106
control:		equ $0206
graph:		equ $0406
caps:			equ $0806
code:			equ $1006
f1:			equ $2006
f2:			equ $4006
f3:			equ $8006

f4:			equ $0107
f5:			equ $0207
escape:		equ $0407
tab:			equ $0807
stop:			equ $1007
backspace:		equ $2007
select:		equ $4007
return:		equ $8007

space:		equ $0108
home:			equ $0208
insert:		equ $0408
delete:		equ $0808
;left:			equ $1008
;up:			equ $2008
;down:			equ $4008
;right:		equ $8008

num_star:		equ $0109
num_plus:		equ $0209
num_slash:		equ $0409
num_0:		equ $0809
num_1:		equ $1009
num_2:		equ $2009
num_3:		equ $4009
num_4:		equ $8009

num_5:		equ $010a
num_6:		equ $020a
num_7:		equ $040a
num_8:		equ $080a
num_9:		equ $100a
num_minus:		equ $200a
num_comma:		equ $400a
num_dot:		equ $800a

;-----------------------------------------------------------------------------------------------

; Important PORTS on MSX.
vram_rw	equ $98				; VRAM read or write port.
vdp_rw:	equ $99				; I - Read Status reg. O - Write to VDP.
palette:	equ $9a				; Palette write port.
vdp_ind	equ $9b				; Indirect VDP access write port.

;-----------------------------------------------------------------------------------------------

; some system addresses:
CurLoc:		equ $f3dc
CurDrive:		equ $f247

;-----------------------------------------------------------------------------------------------

; --- All MSX 1 BIOS calls ---
chkram		equ $0000
rdslt			equ $000C
chrgtr		equ $0010
wrslt			equ $0014
outdo			equ $0018
calslt		equ $001C
dcompr		equ $0020
enaslt		equ $0024
getypr		equ $0028
callf			equ $0030
keyint		equ $0038
initio		equ $003B
inifnk		equ $003E
disscr		equ $0041
enascr		equ $0044
wrtvdp		equ $0047
rdvrm			equ $004A
wrtvrm		equ $004D
setrd			equ $0050
filvrm		equ $0056
ldirmv		equ $0059
ldirvm		equ $005C
chgmod:		equ $005F
chgclr		equ $0062
nmi			equ $0066
clrspr		equ $0069
initxt		equ $006C
init32		equ $006F
inigrp		equ $0072
inimlt		equ $0075
settxt		equ $0078
sett32		equ $007B
setgrp		equ $007E
setmlt		equ $0081
calpat		equ $0084
calatr		equ $0087
gspsiz		equ $008A
grpprt		equ $008D
gicini		equ $0090
wrtpsg		equ $0093
rdpsg			equ $0096
strtms		equ $0099
chsns			equ $009C
chget			equ $009F
chput			equ $00A2
lptout		equ $00A5
lptstt		equ $00A8
cnvchr		equ $00AB
pinlin		equ $00AE
inlin			equ $00B1
qinlin		equ $00B4
breakx		equ $00B7
iscntc		equ $00BA
ckcntc		equ $00BD
beep			equ $00C0
cls			equ $00C3
posit			equ $00C6
fnksb			equ $00C9
erafnk		equ $00CC
dspfnk		equ $00CF
totext		equ $00D2
gtstck		equ $00D5
gttrig		equ $00D8
gtpad			equ $00DB
gtpdl			equ $00DE
tapion		equ $00E1
tapin			equ $00E4
tapiof		equ $00E7
tapoon		equ $00EA
tapout		equ $00ED
tapoof		equ $00F0
stmotr		equ $00F3
lftq			equ $00F6
putq			equ $00F9
rightc		equ $00FC
leftc			equ $00FF
upc			equ $0102
tupc			equ $0105
downc			equ $0108
tdownc		equ $010B
scalxy		equ $010E
mapxy			equ $0111
fetchc		equ $0114
storec		equ $0117
setatr		equ $011A
readc			equ $011D
setc			equ $0120
nsetcx		equ $0123
gtaspc		equ $0126
pntini		equ $0129
scanr			equ $012C
scanl			equ $012F
chgcap		equ $0132
chgsnd		equ $0135
rslreg		equ $0138
wslreg		equ $013B
rdvdp			equ $013E
snsmat		equ $0141
phydio		equ $0144
format		equ $0147
isflio		equ $014A
outdlp		equ $014D
getvcp		equ $0150
getvc2		equ $0153
kilbuf		equ $0156
calbas		equ $0159
; --- end of all MSX 1 BIOS calls ---

forclr      equ $f3e9
bakclr      equ $feea
bdrclr      equ $f3eb

; Basic Disk Operation System (BDOS)
bdos_call	equ $f37d				; BDOS address

sys_reset	equ 00				; System Reset
con_inp	equ 01				; Console Input
con_out	equ 02				; Console Output
aux_inp	equ 03				; AUX input
aux_out	equ 04				; AUX output
lst_out	equ 05				; LST output
dircon_io	equ 06				; Direct Console I/O
dir_inp1	equ 07				; Direct Input no echo, no check
dir_inp2	equ 08				; Direct Input no echo
str_out	equ 09				; String Output
buf_inp	equ 10				; Buffered Input
con_stat	equ 11				; Console Status
get_vers	equ 12				; Get Version Number
dsk_reset	equ 13				; Disk Reset
sel_dsk	equ 14				; Select Disk
open		equ 15				; Open File
close		equ 16				; Close File
s_first	equ 17				; Search First
s_next	equ 18				; Search Next
del_file	equ 19				; Delete file
seq_rd	equ 20				; Sequential Read
seq_wr	equ 21				; Sequential Write
create	equ 22				; Create File
rename	equ 23				; Rename File
get_lv	equ 24				; Get Login Vector
get_ddn	equ 25				; Get Default Drive Name
set_dma	equ 26				; Set DMA address
get_alloc	equ 27				; Get Allocation
rnd_rd	equ 33				; Random Read
rnd_wr	equ 34				; Random Write
get_fs	equ 35				; Get File Size
set_rrec	equ 36				; Set Random Record
rnd_bw	equ 38				; Random Block Write
rnd_br	equ 39				; Random Block Read
rnd_zero	equ 40				; Random Write With Zero Fill
get_date	equ 42				; Get Date
set_date	equ 43				; Set Date
get_time	equ 44				; Get Time
set_time	equ 45				; Set Time
set_vf	equ 46				; Set/Reset Verify Flag
abs_dr	equ 47				; Absolute Disk Read
abs_dw	equ 48				; Absolute Disk Write
;-----------------------------------------------------------------------------------------------


read		equ 1
write		equ 0

