logo:
    ld a,15
    ld (forclr),a
    ld a,15
    ld (bakclr),a
    ld (bdrclr),a
    call chgclr

    ld a,0
	ld (ADDR_CLIKSW), a

	di
	ld a,($f3e0)	; set spritemode op 16x16
	or %00000010
	and %11111110
	ld ($f3e0),a
	out ($99),a
	ld a,1+128
	out ($99),a

    ld a,31		; (*2048)
	out ($99),a
	ld a,6+128
	out ($99),a		; set register 6
	
	ld a,%11101111
	out ($99),a
	ld a,5+128
	out ($99),a		; set register 5
	
	ld a,%00000001
	out ($99),a
	ld a,11+128
	out ($99),a		; set register 11

	ei
	
	;options
	ld a,2 ; difficuly is 
	ld (option_dif),a
    ld a,5
    ld (defaultLives),a
    ld bc,200
    ld (defaultTime),bc
 
	ld a,4
	ld (option_fm_bal),a
	ld (option_psg_bal),a
	ld a,15
	ld (option_sfx_vol),a

	ld hl,isrMusic
	call setInterrupt
	ld hl,song_logo
	call replay_loadsong

	ld hl,colorSetLogo
	call SetPalette

	call enascr
    ld b,255
    call wait
    ld b,100
    call wait

    call replay_pause
	call resetInterrupt
    ret

colorSetLogo:
	dw $0000,$0251,$0222,$0333,$0444,$0555,$0666,$0012
	dw $0013,$0014,$0015,$0016,$0017,$0777,$0002,$0000
