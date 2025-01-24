titlescreen:

buildTitleScreen:
    di

	ld hl,isrMusic
	call setInterrupt

	ld  hl,song_title
	call    replay_loadsong
	ei

	ld a,1
	ld (playerWorld),a

buildTitleScreen2:
	ld hl,colorSetTitleScreen
	call SetPalette

    ld hl,txt_title_start
    call writeText
    ld hl,txt_title_options
    call writeText
    ld hl,txt_title_pass
    call writeText

    ; handpointer

    xor a
    ld (spritePositionHand+2),a
    ld a,4
    ld (spritePositionHand+6),a
    ld a,157
    ld (spritePositionHand),a
    ld (spritePositionHand+4),a
    ld a,144
    ld (spritePositionHand+1),a
    ld (spritePositionHand+5),a
    
    call updateHandSprite

    ld hl,spriteColorsHand
	ld	de,$7400
	ld	bc,32
	ld	a,3
    call	CopyRamVram

    ld hl,spriteDataHand
    ld	de,$7800
	ld	bc,64
	ld	a,3
    call	CopyRamVram

    call enascr
    ld hl,waveData
    ld (wavePointer),hl

    ld b,30
waveLoop:
    push bc
    call wave
    pop bc
    djnz waveLoop
    ei

    ld a,1
    ld (menuStatus),a

waitForSpace:
    halt
    ld b,0              ; F5
    call readKey
    ld hl,playerWorld    
    
    IFDEF	CHEATMODE    
    bit 1,a ; 1
    jp z,setLevel1
    bit 2,a ; 2
    jp z,setLevel2
    bit 3,a ; 3
    jp z,setLevel3
    bit 4,a ; 4
    jp z,setLevel4
    bit 5,a ; 5
    jp z,setLevel5
    ENDIF
    
    call checkJoyStick

    ld a,(joyStickValueY)
    cp up
    call z,menuUp
    ld a,(joyStickValueY)
    cp down
    call z,menuDown

    call updateHandSprite

	call checkTrigger
	jp nz, waitForSpace
exitTitleScreen:
    ld bc,sfx_opendoor
    call ttsfx_start

    ld b,10
exitTitleScreen2:
    push bc
    call disableSprites
    ld b,5
    call wait    
    
    call enableSprites
    ld b,5
    call wait
    pop bc
    djnz exitTitleScreen2

    ; fade out
    ld de,colorSetTitleScreen
    ld hl,blackPalette
    call colorFader

    ld a,(menuStatus)
    cp 2 ; options
    jp z,optionsScreen
    cp 3
    jp z,passWordScreen
    
    ld a,4
    call replay_fade_out
	call replay_pause
	call resetInterrupt

    ; start game
	ld a,(defaultLives)
	ld (playerLives),a

	ld a,(defaultLives)
	ld (playerLives),a
	xor a
	ld (playerStage),a
    ld hl,0
    ld (playerScore),hl

    ret

setMaxLife:
    ld a,99
    ld (defaultLives),a
    ld bc,sfx_heart
    call ttsfx_start
    ld b,50
    call wait
    jp exitTitleScreen

setLevel
    ld (hl),a
    ld bc,sfx_heart
    call ttsfx_start
    ld b,50
    call wait
    jp exitTitleScreen


setLevel1:
    ld (hl),1
    jp exitTitleScreen
setLevel2:
    ld (hl),2
    jp exitTitleScreen
setLevel3:
    ld (hl),3
    jp exitTitleScreen
setLevel4:
    ld (hl),4
    jp exitTitleScreen
setLevel5:
    ld (hl),5
    jp exitTitleScreen

menuUp:
    ld a,(menuStatus)
    cp 1
    ret z
    dec a
    ld (menuStatus),a

    ld a,(spritePositionHand)
    sub 8
    ld (spritePositionHand),a
    ld (spritePositionHand+4),a

    call updateHandSprite
    ld	bc,sfx_select
    call	ttsfx_start
    call checkJoyStickWait
    ret

menuDown:
    ld a,(menuStatus)
    cp 3
    ret z
    inc a
    ld (menuStatus),a

    ld a,(spritePositionHand)
    add 8
    ld (spritePositionHand),a
    ld (spritePositionHand+4),a
    
    call updateHandSprite
    ld	bc,sfx_select
    call	ttsfx_start
    call checkJoyStickWait    

    ret

; --------------------------------------------------
passWordScreen:
    call disscr
    call resetScreen
    ld hl,txt_pass_info1
    call writeText

    ld hl,txt_pass_info2
    call writeText

    ld hl,txt_pass_info3
    call writeText

    ld hl,txt_pass_info4
    call writeText

    ld a,1
    ld (menuStatus),a

    ld a,216
    ld (spritePositionHand),a
    call updateHandSprite

    call enascr

    ; fade in
    ld hl,colorSetTitleScreen
    ld de,blackPalette
    call colorFader

    xor a
    ld (txt_pass_position),a

    call kilbuf
passWordScreen2:
    call chget
    cp 27
    jp z,do_menuExit2

    cp 8
    jp z,do_passWordBS

    cp 13
    jp z,passWordCheck

    ld c,a

    sub 33
    jp c,passWordScreen2

    ld d,132
    ld e,76

    ld a,(txt_pass_position)
    cp 4
    jp z,passWordScreen2
    inc a
    ld (txt_pass_position),a
passWordScreen3:
    add a,a
    add a,a
    add a,a
    add a,d
    ld d,a
    ld a,c

    push af
    call writeLetter

    ld a,(txt_pass_position)
    dec a
    ld d,0
    ld e,a
    ld hl,txt_pass_input
    add hl,de
    pop af
    ld (hl),a


    ld bc,sfx_key
    call ttsfx_start
    jp passWordScreen2

do_passWordBS:
    ld a,(txt_pass_position)
    or a
    jp z,passWordScreen2
    dec a
    ld (txt_pass_position),a

    ld d,140
    ld e,76
    ld c,32

    add a,a
    add a,a
    add a,a
    add a,d
    ld d,a
    ld a,c
    call writeLetter

    ld bc,sfx_reverse
    call ttsfx_start
    jp passWordScreen2

passWordCheck:
    ld a,(txt_pass_position)
    cp 4
    jp nz,passWordScreen2

    ld b,4
    ld hl,txt_pass_input
    ld de,pw1
    call strcmp
    ld hl,playerWorld
    ld a,1
    jp z,setLevel

    ld b,4
    ld hl,txt_pass_input
    ld de,pw2
    call strcmp
    ld hl,playerWorld
    ld a,2    
    jp z,setLevel

    ld b,4
    ld hl,txt_pass_input
    ld de,pw3
    call strcmp
    ld hl,playerWorld
    ld a,3    
    jp z,setLevel

    ld b,4
    ld hl,txt_pass_input
    ld de,pw4
    call strcmp
    ld hl,playerWorld
    ld a,4    
    jp z,setLevel

    ld b,4
    ld hl,txt_pass_input
    ld de,pw5
    call strcmp
    ld hl,playerWorld
    ld a,5    
    jp z,setLevel

    ld b,4
    ld hl,txt_pass_input
    ld de,pw6
    call strcmp
    jp z,setMaxLife

    ld b,4
    ld hl,txt_pass_input
    ld de,pw7
    call strcmp
    jp z,ending2


    ld bc,sfx_reverse
    call ttsfx_start
    xor a
    ld (txt_pass_position),a

    ld hl,txt_pass_info2
    call writeText
    jp passWordScreen2

ending2:
    call replay_pause
    call resetInterrupt
    jp ending


; --------------------------------------------------
optionsScreen:
    call disscr

    ld hl,optionsscreenOrg
    call DoCopy  

    ld a,96
    ld (spritePositionHand),a
    ld (spritePositionHand+4),a
    ld a,56
    ld (spritePositionHand+1),a
    ld (spritePositionHand+5),a
    call updateHandSprite
    
    ld b,3
    call wait

    call enascr

    ld a,1
    ld (menuStatus),a

    call do_setDifficulty
    call do_setFreq
    call do_setPSGVolume
    call do_setFMVolume
    call do_setSFXVolume

    ; fade in
    ld hl,colorSetTitleScreen
    ld de,blackPalette
    call colorFader

options:
    halt
    call checkJoyStick

    ld a,(joyStickValueY)
    cp up
    call z,menuUpOptions
    ld a,(joyStickValueY)
    cp down
    call z,menuDownOptions

    ld a,(joyStickValueX)
    cp left
    call z,do_menuLeft

    ld a,(joyStickValueX)
    cp right
    call z,do_menuRight


	call checkTrigger ; do something
    jp z,do_menuExit

    ld b,7              ; escape
    call readKey
    bit 2,a
	call z,do_menuExit2

    call updateHandSprite

    jp options

menuUpOptions:
    ld a,(menuStatus)
    cp 1
    ret z
    dec a
    ld (menuStatus),a

    ld a,(spritePositionHand)
    sub 16
    ld (spritePositionHand),a
    ld (spritePositionHand+4),a

    call updateHandSprite
    ld	bc,sfx_select
    call	ttsfx_start
    call checkJoyStickWait

    ret

menuDownOptions:
    ld a,(menuStatus)
    cp 6
    ret z
    inc a
    ld (menuStatus),a

    ld a,(spritePositionHand)
    add a,16
    ld (spritePositionHand),a
    ld (spritePositionHand+4),a

    call updateHandSprite
    ld	bc,sfx_select
    call	ttsfx_start
    call checkJoyStickWait 
    ret


updateHandSprite:
	ld	hl,spritePositionHand
	ld	de,$7600
	ld	bc,8 
	ld	a,3
    call	CopyRamVram
    ret

do_menuLeft:
    call checkJoyStickWait 

    ld	bc,sfx_select
    call	ttsfx_start

    ld a,(menuStatus)
    cp 1
    jp z,do_menu1Left
    cp 2
    jp z,do_menu2Left
    cp 3
    jp z,do_menu3Left
    cp 4
    jp z,do_menu4Left
    cp 5
    jp z,do_menu5Left
    jp options

do_menuRight:
    call checkJoyStickWait 
    
    ld	bc,sfx_select
    call	ttsfx_start

    ld a,(menuStatus)
    cp 1
    jp z,do_menu1Right
    cp 2
    jp z,do_menu2Right
    cp 3
    jp z,do_menu3Right
    cp 4
    jp z,do_menu4Right
    cp 5
    jp z,do_menu5Right
    jp options

do_menu1Left:
    ld a,(option_dif)
    cp 1
    jp z,options
    dec a
    ld (option_dif),a
    call do_setDifficulty
    call checkJoyStickWait
    jp options

do_menu1Right:
    ld a,(option_dif)
    cp 4
    jp z,options
    inc a
    ld (option_dif),a
    call do_setDifficulty
    call checkJoyStickWait    
    jp options
    
do_menu2Left:
    ld a,(option_fm_bal)
    or a
    ret z
    dec a
    ld (option_fm_bal),a
    call replay_set_FM_balance
    
    call do_setFMVolume
    call checkJoyStickWait    
    jp options
do_menu2Right:
    ld a,(option_fm_bal)
    cp 4
    ret z
    inc a
    ld (option_fm_bal),a
    call replay_set_FM_balance    
    call do_setFMVolume
    call checkJoyStickWait        
    jp options

do_menu3Left:
    ld a,(option_psg_bal)
    or a
    ret z
    dec a
    ld (option_psg_bal),a
    call replay_set_PSG_balance
    call do_setPSGVolume
    call ttsfx_psg_balance
    call checkJoyStickWait        
    jp options

do_menu3Right:
    ld a,(option_psg_bal)
    cp 4
    ret z
    inc a
    ld (option_psg_bal),a
    call replay_set_PSG_balance
    call do_setPSGVolume
    call checkJoyStickWait        
    jp options

do_menu4Left:
    ld a,(option_sfx_vol)
    or a
    ret z
    dec a
    ld (option_sfx_vol),a
    call ttsfx_psg_balance
    call do_setSFXVolume

    ld	bc,sfx_select
    call ttsfx_start

    call checkJoyStickWait        
    jp options

do_menu4Right:
    ld a,(option_sfx_vol)
    cp 15
    ret z
    inc a
    ld (option_sfx_vol),a
    call ttsfx_psg_balance
    call do_setSFXVolume

    ld	bc,sfx_select
    call ttsfx_start

    call checkJoyStickWait        
    jp options

do_menu5Left:
    call set50hz
    call do_setFreq
    jp options


set50hz:
    // set 50 hz
    ld a,50
    ld (option_freq),a
   
    di
    ld a,($FFE8)
    set 1,a
    ld ($ffe8),a
	out ($99),a
	ld a,9+128
	out ($99),a		; set register 9
    ei

    call replay_equalization_on

    ret

do_menu5Right:
    call set60hz
    call do_setFreq
    jp options 

set60hz:    
    // set 60 hz
    ld a,60
    ld (option_freq),a

    di
    ld a,($FFE8)
    res 1,a
    ld ($ffe8),a
	out ($99),a
	ld a,9+128
	out ($99),a		; set register 9
    ei

    call replay_equalization_on
        
    ret


do_setDifficulty:
    ld a,(option_dif)
    cp 1
    jp z,do_setDifficultyBeginner
    cp 2
    jp z,do_setDifficultyEasy
    cp 3
    jp z,do_setDifficultyMedium
    cp 4
    jp z,do_setDifficultyHard

do_setDifficultyBeginner:
    ld hl,txt_options_dif_beginner
    call writeText

    ld a,5
    ld (defaultLives),a
    ld bc,200
    ld (defaultTime),bc
    ret

do_setDifficultyEasy:
    ld hl,txt_options_dif_easy
    call writeText

    ld a,5
    ld (defaultLives),a
    ld bc,200
    ld (defaultTime),bc

    ret
do_setDifficultyMedium:
    ld hl,txt_options_dif_medium
    call writeText

    ld a,3
    ld (defaultLives),a
    ld bc,150
    ld (defaultTime),bc
    ret
do_setDifficultyHard:
    ld hl,txt_options_dif_hard
    call writeText

    ld a,1
    ld (defaultLives),a
    ld bc,150
    ld (defaultTime),bc

    ret

do_setFreq:
    ld a,(option_freq)
    cp 60
    jp z,do_setFreq60
    
    ld hl,txt_options_hertz_50
    call writeText
    ret
do_setFreq60:
    ld hl,txt_options_hertz_60
    call writeText
    ret

do_setFMVolume:
    ld a,(option_fm_bal)

    ld d,168
    ld e,114
    add a,48
    call writeLetter

    ret

do_setPSGVolume:
    ld a,(option_psg_bal)
    ld d,168
    ld e,130
    add a,48
    call writeLetter

    ret 

do_setSFXVolume:
    ld a,(option_sfx_vol)
    cp 10
    jp nc,do_setSFXVolume2

    ld d,168
    ld e,146
    add a,48
    call writeLetter

    ld d,176
    ld e,146
    ld a,32
    call writeLetter

    ret

do_setSFXVolume2:
    push af
    ld d,168
    ld e,146
    ld a,49
    call writeLetter
    ld d,176
    ld e,146
    pop af
    add a,38
    call writeLetter
    ret

do_menuExit:
    ld a,(menuStatus)
    cp 6
    jp nz,options

do_menuExit2:
    ; fade out
    ld de,colorSetTitleScreen
    ld hl,blackPalette
    call colorFader

    ld b,5
    call wait

    ld a,8
    call replay_fade_out
    call replay_pause

    call disscr
    call resetInterrupt

    jp restart


wave:
	ei
	halt
	
	di                    ; no breaks
	ld a,2             ; status reg. #2
	out ($99),a
	ld  a,15 or 128
	out ($99),a

	ld a,18 or 128     ; register 18 (vdp(19)) instellen op $9B
	out ($99),a
	LD  a,17 or 128
	out ($99),a

	ld hl,(wavePointer)     ; zet pointer goed
	ld a,(hl)
	cp -1
	jr nz,wave2

	ld hl,waveData
wave2:
	inc hl
    ld (wavePointer),hl

wave3:
	in a,($99)
    and $40
    jr nz,wave3

	ld b,212

wave4:
	in a,($99)
    and $20
    jr z,wave4

    ld a,(hl)          ; zorg dat de pointer goed staat
    cp    -1
    jr nz,wave5
    ld hl,waveData

wave5:
	ld a,(hl)
    out   ($9B),A

    inc hl
	djnz wave4

	xor a
    out ($99),a
    ld a,15 or 128
    out ($99),a

	xor a ; reg #18=0 (leuk effect als dit weg is...)
	out ($9B),a

	in a,($aa)
	and $f0
	or 8
    out ($aa),a
	in a,($a9)
	and 1
	ret

; b = length
; hl = str1
; de = str2
strcmp:
    ld a,(de)
    cpi
    inc de
    ret nz
    djnz strcmp
    ret

waveData:
	DB 7,5,3,2,2,1,1,1,0,0,0,0 ; wave data
    DB 1,1,1,2,2,3,5,7 ; laatste en eerste gelijk !!!
    DB -1              ; einde

txt_title_start: db 160,160,"Start",255
txt_title_options: db 160,168,"Options",255
txt_title_pass: db 160,176,"Password",255

txt_pass_info1: db 34,68,"Do you know a password?",255
txt_pass_info2: db 84,76,"Enter:     ",255
txt_pass_info3: db 8,176,"Hint: Passwords can be found",255
txt_pass_info4: db 8,184," in the first stage of a world.",255

txt_options_hertz_50: db 168,162,"50Hz",255
txt_options_hertz_60: db 168,162,"60Hz",255
txt_options_dif_easy: db 168,98,    "Normal  ",255
txt_options_dif_medium: db 168,98,  "Hard    ",255
txt_options_dif_hard: db 168,98,    "Die-hard",255
txt_options_dif_beginner: db 168,98,"Beginner",255

pw1: db "AvRf"
pw2: db "p64E"
pw3: db "Nt2A"
pw4: db "Vs2R"
pw5: db "AeQP"
pw6: db "LOVE"
pw7: db "KILL"

colorSetTitleScreen:
	dw $0221,$0101,$0121,$0131,$0241,$0361,$0314,$0547
	dw $0771,$0742,$0531,$0413,$0321,$0777,$0100,$0000
