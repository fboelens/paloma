; H_TIMI:  HL is interrupt address
setInterrupt:
    push hl
	; new hook
	ld hl,$fd9f		; oude hook opslaan
	ld de,isrCurrent
	ld bc,5
	ldir
	ld a,$c9		; zet een ret (c9) neer op hook
	ld ($fd9f),a
	pop hl
	ld ($fd9f+1),hl
	ld a,$c3		; zet een jp op fd9f
	ld ($fd9f),a    
	ret

resetInterrupt:
    ld b,3
    call wait
resetInterrupt2:
	ld a,$c9		; hook terug zetten
	ld ($fd9f),a	; een ret (c9) op fd9f

	ld hl,isrCurrent+4
	ld de,$fd9f+4
	ld bc,5
	lddr
	ret

;
; Set the palette to the one HL points to...
; Modifies: AF, BC, HL (=updated)
; Enables the interrupts.
;
SetPalette:
    xor a           ; set p#pointer to zero.
    di
    out (#99),a
    ld a,16+128
    ei
    out (#99),a
    ld bc,#209A     ; out 32x to port #9A
    otir
    ret

SetColor:
    xor a           ; set p#pointer to zero.
    di
    out (#99),a
    ld a,16+128
    ei
    out (#99),a
    ld bc,#029A     ; out 32x to port #9A ; color 0 only
    otir
    ret


;
; Fast DoCopy, by Grauw
; In:  HL = pointer to 15-byte VDP command data
; Out: HL = updated
;
DoCopy:
    ld a,32
    di
    out (#99),a
    ld a,17 + 128
    out (#99),a
    ld c,#9B
VDPready:
    ld a,2
    di
    out (#99),a     ; select s#2
    ld a,15 + 128
    out (#99),a
    in a,(#99)
    rra
    ld a,0          ; back to s#0, enable ints
    out (#99),a
    ld a,15 + 128
    ei
    out (#99),a     ; loop if vdp not ready (CE)
    jp c,VDPready
    outi            ; 15x OUTI
    outi            ; (faster than OTIR)
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    outi
    ret

CopyRamVram:
	push	af

	ld	a,c
	ld	(CRVLastOut),a

	pop	af
	push	hl

	ex	de,hl
	call	SetVramWrite
	pop	hl
	ld	a,b
	or	a
	jp	z,CRVLoop1Done
	ld	d,b
	ld	c,$98

CpRamVramLp1:
	ld	b,$00
	otir

	dec	d
	jr	nz,CpRamVramLp1

CRVLoop1Done:
	ld	a,(CRVLastOut)
	or	a
	ret	z

	ld	b,a

	ld	c,$98
	otir

	ret
;--------------------------------------------------------------------------
SetVramWrite:
; routine : Set Vram Pointer in write mode.
; in      : A - page, HL - offset
; out     : none.
; cmnt    : none.

	di

	out	($99),a	 	; out page to 			register #14 of the VDP
	ld	a,14+128	;
	out	($99),a	;

	ld	a,l	; Get LSB of offset
	out	($99),a	; out to VDP

	ld	a,h	; Get MSB of offset

	and	$3f	; clear last two bits
	or	$40	; set bit 6 (write)

	out	($99),a	; iut to VDP

	ei

	ret

colorFader:
; routine : Colorfader
; in      : DE - Palette to fade from, HL - Palette to fade to.
; out     : none.
; cmnt    : none.

	push hl

	ex de,hl

	ld de,dataPalette
	ld bc,32
	ldir

	pop hl

	ld b,8
colorFader.2:
	push bc
	push hl

	ld de,dataPalette

	ld b,16
colorFader.1:
	push bc

	ld a,(de)					; $00
	srl a	
	srl a
	srl a
	srl a
	ld b,a					; $00

	ld a,(hl)					; $77
	srl a
	srl a
	srl a
	srl a						; $07

	cp b						; nc
	jp z,colorFader.NoChange1

	jp c,colorFader.Decrease1

	inc b
	inc b
colorFader.Decrease1:
	dec b
	
colorFader.NoChange1:
	ld a,(de)
	and $0f

	ld c,a

	ld a,(hl)
	and $0f

	cp c
	jp z,colorFader.NoChange2

	jp c,colorFader.Decrease2

	inc c
	inc c
colorFader.Decrease2:
	dec c
colorFader.NoChange2:
	ld a,b
	add a,a
	add a,a
	add a,a
	add a,a
	or c

	ld (de),a

	inc de
	inc hl

	ld a,(de)
	ld b,a
	ld a,(hl)
	cp b
	jp z,colorFader.NoChange3

	jp c,colorFader.Decrease3

	inc b
	inc b
colorFader.Decrease3:
	dec b

colorFader.NoChange3:
	ld a,b
	ld (de),a

	inc de
	inc hl

	pop bc

	djnz colorFader.1

    ld hl,dataPalette
    call SetPalette

	ei
	halt
	halt

	pop hl
	pop bc

	djnz colorFader.2

	ret

blackPalette:
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

; reg.: keyrow
readKey:
    di
    in a,(#AA)
    and #F0         ; only change bits 0-3
    or b            ; row xxx
    out (#AA),a
    in a,(#A9)      ; read row into A
    ei
	ret


checkTrigger:
	ld a,1
	call gttrig
	cp $ff
	ret z ; joystick action button?

	xor a
	call gttrig
	cp $ff
	
	ret 

checkJoyStickWait:
	call checkJoyStick
	or a
	jp nz,checkJoyStickWait
	ret

checkJoyStick:
	ld ix,joyStickValueY
	ld (ix),0
	ld (ix+1),0
	
	; check keyboard
	xor a
	call gtstck
	or a
	jp nz,checkJoyStick2

	; nothing happened? check joystick 0
	ld a,1
	call gtstck
	or a
	ret z ; nothing

checkJoyStick2:
    ; a = 1 - 8 -> u,ru,r,rd,d,ld,l,lu
	cp 1
	jp z,checkJoyStick_up
	cp 2
	call z,checkJoyStick_up
	jp z,checkJoyStick_right
	cp 3
	jp z,checkJoyStick_right
	cp 4
	call z,checkJoyStick_right
	jp z,checkJoyStick_down
	cp 5
	jp z,checkJoyStick_down
	cp 6
	call z,checkJoyStick_down
	jp z,checkJoyStick_left
	cp 7
	jp z,checkJoyStick_left
	cp 8
	call z,checkJoyStick_up
	jp z,checkJoyStick_left
	ret

checkJoyStick_up:
	ld (ix),up
	ret

checkJoyStick_right:
	ld (ix+1),right
	ret

checkJoyStick_down:
	ld (ix),down
	ret

checkJoyStick_left:
	ld (ix+1),left
	ret


; Input: HL = number to convert, DE = location of ASCII string
; Output: ASCII string at (DE)
Num2Dec:
	ld	bc,-10000
	call	Num1
	ld	bc,-1000
	call	Num1
	ld	bc,-100
	call	Num1
	ld	c,-10
	call	Num1
	ld	c,b

Num1:
	ld	a,'0'-1
Num2:
	inc	a
	add	hl,bc
	jr	c,Num2
	sbc	hl,bc

	ld	(de),a
	inc	de
	ret

enableSprites:
	ld a,$28
	out ($99),a
	ld a,8+128
	out ($99),a		; set register 8
	ret

disableSprites:
	ld a,$2a
	out ($99),a
	ld a,8+128
	out ($99),a		; set register 8
	ret

fillRam:
    ld (de),a
    inc de
    djnz fillRam
	ret

writeText:
    ld a,(hl)
    ld (ledx),a
    inc hl    
    ld a,(hl)
    ld (ledy),a
    inc hl
writeTextLoop:
    ld a,(hl)
    cp 255
    ret z

    sub 32    
    ld c,a

    srl a
    srl a
    and %00011000
    add a,193
    ld (lesy),a

    ld a,c
    and %00011111
    add a,a
    add a,a
    add a,a
    ld (lesx),a
    
    push hl
    ld hl,letters
    push bc
    call DoCopy
    pop bc
    pop hl

    ld a,(ledx)
    add a,8
    ld (ledx),a

    inc hl
    jp writeTextLoop
  
writeLetter:
    sub 32
    ld c,a

    srl a
    srl a
    and %00011000
    add a,193
    ld (lesy),a

    ld a,c
    and %00011111
    add a,a
    add a,a
    add a,a
    ld (lesx),a

    ld a,d
    ld (ledx),a
    ld a,e
    ld (ledy),a


    ld hl,letters
    call DoCopy
    ret
