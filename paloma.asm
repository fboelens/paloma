    output c:/msx/Paloma/paloma.rom

; system calls for paging
ENASLT:	equ	0024h
INIT32:	equ	006Fh
CHPUT:	equ	00A2h	; Address of character output routine of main Rom BIOS
RSLREG:	equ	0138h
LDIRVM: equ $5C
ADDR_CLIKSW:  equ $f3db

RAM_PageSize:	equ	02000h	; 8kB
RAM_8K:         equ 02000h;
RAM_16K:        equ 04000h;
RAM_32K:        equ 08000h;
RAM_64K:        equ 0FFFFh;

; ROM Page switching
ROM_SelectPage1a: equ 00000h ; 0000 - 1fff (page 1)
ROM_SelectPage1b: equ 02000h ; 2000 - 3fff (page 1)

ROM_SelectPage2a: equ 04000h ; 4000 - 5fff (page 2)
ROM_SelectPage2b: equ 06000h ; 6000 - 7fff (page 2)
ROM_SelectPage3a: equ 08000h ; 8000 - 9fff (page 3)
ROM_SelectPage3b: equ 0A000h ; a000 - bfff (page 3)

LINL32:	equ	0F3AFh

tile_heart:         equ 226
tile_key:           equ 224
tile_key2:          equ 225
tile_invincible:    equ 232
tile_reverse:       equ 227
tile_door:          equ 228
tile_spikeUp:       equ 152
tile_spikeDown:     equ 156
tile_animationDead: equ 180
tile_platform1:     equ 233
tile_platform2:     equ 235
tile_blockPlatform: equ 237
tile_switch_off:    equ 238
tile_switch_on:     equ 239
tile_pass1:         equ 240
tile_pass2:         equ 241

sfx_select:         equ 0000h
sfx_dead:           equ 0100h
sfx_heart:          equ 0200h
sfx_key:            equ 0300h
sfx_cagefall:       equ 0400h
sfx_pause:          equ 0500h
sfx_enemydead:      equ 0600h
sfx_invincible:     equ 0700h
sfx_opendoor:       equ 0800h
sfx_reverse:        equ 0900h
sfx_shoot:          equ 0A00h
sfx_switchoff:      equ 0B00h
sfx_switchon:       equ 0C00h

mapLength:      equ 768+40

left:           equ 00000010b
right:          equ 00000100b
down:           equ 00000001b
up:             equ 00001000b

true:           equ 1
false:          equ 0

;define CHEATMODE
define MSX2				; Used in speed equalization
define SFXPLAY_ENABLED	; Enable the SFX functionality.
;define TAIL_ON			; Limit volume to 1
;--- Only set 1 of the settings below for the period table
define PERIOD_A440		; Modern 
;define PERIOD_A432		; Earth
;define PERIOD_A445		; Konami
;define PERIOD_A448		; Classical


	defpage 0,ROM_SelectPage2a,RAM_16K ; 4000-8000 main code + music player and sfx
    defpage 2,ROM_SelectPage3a,RAM_16K ; 8000-C000 titlescreen music + game over music + enddemo stuff
    defpage 4,ROM_SelectPage3a,RAM_16K ; 8000-C000 mapdata+spritedata+music world 1
    defpage 6,ROM_SelectPage3a,RAM_16K ; 8000-C000 mapdata+spritedata+music world 2
    defpage 8,ROM_SelectPage3a,RAM_16K ; 8000-C000 mapdata+spritedata+music world 3
    defpage 10,ROM_SelectPage3a,RAM_16K ; 8000-C000 mapdata+spritedata+music world 4
    defpage 12,ROM_SelectPage3a,RAM_16K ; 8000-C000 mapdata+spritedata+music world 5
    defpage 14,ROM_SelectPage3a,RAM_16K ; title gfx + statusbar
    defpage 16,ROM_SelectPage3a,RAM_16K ; world 1+2 gfx
    defpage 18,ROM_SelectPage3a,RAM_16K ; world 3+4 gfx
    defpage 20,ROM_SelectPage3a,RAM_16K ; world 5 gfx + options gfx
    defpage 22,ROM_SelectPage3a,RAM_16K ; intro gfx
    defpage 24,ROM_SelectPage3a,RAM_16K ; intro gfx2
    defpage 26,ROM_SelectPage3a,RAM_16K ; exit demo gfx
    defpage 28,ROM_SelectPage3a,RAM_16K ; logo
    defpage 30,ROM_SelectPage3a,RAM_16K ; in between world gfx
    page 0

	db	41h,42h
	dw	init,0,0,0,0,0,0
    ;-------------------------------------
    ; Includes
    ;-------------------------------------
    include "init.asm"
    include "game.asm"
    include "staticdata.asm"
    include "maps.asm"
    include "player.asm"
    include "enemy.asm"
    include	"graphics.asm"
    include "swapping.asm"
    include "macros.asm"
    include "decompress.asm"     
    include "ending.asm"
    ; Trilotracker
	include "tt/fmdetect.asm"
	include	"tt/ttreplayFM.asm"
	include	"tt/ttreplayFMDAT.asm"
    include "tt/ttsfxplayPSG.asm"
    
    include "sprites.asm"

    map	0xc000
    include	"tt/ttreplayFMRAM.asm"
    include "tt/ttsfxplayPSG_RAM.asm"    
    include "data.asm"    

    page 2
page_intro:
    include "titlescreen.asm"
    include "demos.asm"
    include "staticInitData.asm"
sfx_org:
    incbin "palomasfx.afb"
sfx_end:

song_title:
	module sng1
    include	"music/pal-titl.asm"
    endmodule
song_gameover: 
    module sng2
    include  "music/pal-govr.asm"
    endmodule
song_intro: 
    module sng3
    include  "music/pal-intr.asm"
    endmodule
song_extro: 
    module sng4
    include  "music/pal-end.asm"
    endmodule

colors_intro1:
    dw $0221,$0111,$0121,$0131,$0241,$0361,$0314,$0436
    dw $0771,$0742,$0531,$0413,$0321,$0777,$0211,$0000  
colors_intro2:
    dw $0000,$0121,$0242,$0041,$0132,$0011,$0463,$0370
    dw $0301,$0242,$0061,$0674,$0021,$0777,$0402,$0000  
colors_intro3:
    dw $0011,$0021,$0064,$0335,$0123,$0370,$0301,$0675
    dw $0666,$0041,$0061,$0373,$0770,$0777,$0402,$0000  
colors_intro4:
    dw $0011,$0021,$0064,$0106,$0207,$0004,$0123,$0675
    dw $0770,$0041,$0061,$0373,$0140,$0777,$0130,$0000  

    ; page 4,6,8,10,12 for worlds
    page 4
page_world1:
song_world1:
    module sng3
    include "music/pal-l1.asm"    
    endmodule
    include "maps/maps_world1.asm"
sprites_world1:
    include "sprites/sprites-world1.asm"    
colors_world1:
	dw $0020, $0002, $0130, $0240, $0351, $0572, $0007, $0624
	dw $0514, $0555, $0070, $0674, $0770, $0777, $0333, $0000
txt_pass1:   db 56,62,"AvRf",255

    page 6
page_world2:
song_world2:
    module sng4
    include "music/pal-l4.asm"    
    endmodule    
    include "maps/maps_world2.asm"
sprites_world2:    
    include "sprites/sprites-world2.asm"    
colors_world2:
	dw $0101, $0002, $0212, $0240, $0351, $0572, $0007, $0322
	dw $0411, $0622, $0070, $0674, $0770, $0777, $0333, $0000
txt_pass2:   db 56,62,"p64E",255

    page 8
page_world3:
song_world3:
    module sng5
    include "music/pal-l2.asm"    
    endmodule
    include "maps/maps_world3.asm"
sprites_world3:    
    include "sprites/sprites-world3.asm"    
colors_world3:
	dw $0112, $0012, $0213, $0240, $0351, $0371, $0007, $0324
	dw $0411, $0622, $0070, $0674, $0770, $0777, $0333, $0000
txt_pass3:   db 56,62,"Nt2A",255

    page 10
page_world4:
song_world4:    
    module sng6
    include "music/pal-l3.asm"    
    endmodule
    include "maps/maps_world4.asm"
sprites_world4:    
    include "sprites/sprites-world4.asm"    
colors_world4:
	dw $0100, $0002, $0327, $0240, $0351, $0020, $0007, $0667
	dw $0510, $0200, $0070, $0674, $0770, $0777, $0333, $0000
txt_pass4:   db 56,62,"Vs2R",255

    page 12
page_world5:
song_world5:    
    module sng7
    include "music/pal-l5.asm"    
    endmodule    

    include "maps/maps_world5.asm"
sprites_world5:    
    include "sprites/sprites-world5.asm"    
colors_world5:
	dw $0001, $0004, $0112, $0240, $0351, $0123, $0007, $0355
	dw $0223, $0572, $0070, $0674, $0770, $0777, $0514, $0000
txt_pass5:   db 56,62,"AeQP",255

txt_endBoss1: db 56,100,"Oh princess!!!",255
txt_endBoss2: db 56,108,"Are you okay!?",255

    ; all gfx compresssed with bitbuster
    page 14
img_title:
    incbin "gfx/paloma-title.pck"
img_status:
    incbin "gfx/paloma-status.pck"

    page 16
img_world1:
    incbin "gfx/paloma-world1.pck"
img_world2:
    incbin "gfx/paloma-world2.pck"

    page 18
img_world3:
    incbin "gfx/paloma-world3.pck"
img_world4:
    incbin "gfx/paloma-world4.pck"

    page 20
img_world5:
    incbin "gfx/paloma-world5.pck"
img_options:    
    incbin "gfx/paloma-options.pck"

    page 22
img_intro1:
    incbin "gfx/paloma-intro1.pck"

    page 24
img_intro2:    
    incbin "gfx/paloma-intro2.pck"
img_intro3:    
    incbin "gfx/paloma-intro3.pck"

    page 26
img_ending:
    incbin "gfx/paloma-ending.pck"

    page 28
img_logo:
    incbin "gfx/paloma-logo.pck"
    include "logo.asm"
song_logo:
    include "music/pal-logo.asm"    

    page 30
img_between:    
    incbin "gfx/paloma-between.pck"
song_between:
    include "music/pal-betw.asm"    
    include "betweenworlds.asm"

