;-------------------------------------
; Statics
;-------------------------------------
colorSetBetween:
	dw $0310,$0162,$0675,$0030,$0402,$0061,$0041,$0021
	dw $0302,$0373,$0530,$0100,$0210,$0777,$0017,$0000

colorWhite:
	dw $0070

txt_start: db 84,100,"InfiniteMSX",255

txt_worldOrg: db 80,80,"World: 0 - 0",255
txt_livesOrg: db 92,88,"Lives:",255
txt_highOrg: db 60,128,"High score:      ",255

txt_continue: db 72,116,"F5 to continue",255
txt_gameover: db 92,100,"Game Over",255

txt_pause: 	db 56,54,"Pause... Zzzzz..",255
txt_passOrg: db 56,54,"The password is",255

txt_between1: db 40,180,"Morgath: HAHA you will",255
txt_between2: db 8,188,"NEVER find the princess IDIOT!",255

StatusbarOrg:
    db 0,0
	db 192+24,1
	db 0,0
	db 168,0
	db 0,0
	db 16,0
	db 0,0,$d0

copyBackground:
    db 0,0
	db 0,2
	db 0,0
	db 0,0
	db 0,0
	db 160,0
	db 0,0,$d0

betweenImage:
    db 0,0
	db 0,3
	db 28,0
	db 30,0
	db 200,0
	db 132,0
	db 0,0,$d0

