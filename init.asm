init:
; Typical routine to select the ROM on page 8000h-BFFFh from page 4000h-7BFFFh

	call	RSLREG
	rrca
	rrca
	and	3	;Keep bits corresponding to the page 4000h-7FFFh
	ld	c,a
	ld	b,0
	ld	hl,EXPTBL
	add	hl,bc
	ld	a,(hl)
	and	80h
	or	c
	ld	c,a
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	a,(hl)
	and	0Ch
	or	c
	ld	h,080h
	call	ENASLT		; Select the ROM on page 8000h-BFFFh
init_start:
	ld a,5
	call chgmod
	call disscr
	call enableSprites
	call clearSprites
	;call resetScreen

	; intro and intromusic + SFX
	call memload_intro

    ; place sfx
    ld hl,sfx_org
    ld de,sfxbank
    ld bc,sfx_end-sfx_org
    ldir 

	; force 60hz
	call set60hz

	call MSXMusic_Detect
	call replay_init
    call replay_equalization_on
	call ttsfx_init

	ld a,false
	ld (onIce),a
    ld hl,0
    ld (playerHighScore),hl

	; copies
    ld hl,copysOrg
    ld de,copys
    ld bc,15*18
    ldir

    ld hl,textbarOrg
    ld de,textbar
    ld bc,72
    ldir

    ld hl,spritePosOrg
    ld de,spritePositionPlayer
    ld bc,128
    ldir

	call memload_statusandfont
	call memload_logo
	call logo

	call memload_introdemo	
	call memload_intro
	call introdemo

restart:
	; LOAD FONT and Statusbar
	call memload_titlescreen
	call memload_options	
	call memload_intro

	call titlescreen

	call memload_between

	; set gfx and maps world 1
	ld a,(playerWorld)
	call loadWorldGfx
	ld a,(playerWorld)
	call setWorld	

