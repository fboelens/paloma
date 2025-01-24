memload_titlescreen:
    ld a,:img_title
    ld (ROM_SelectPage3a),a
    ld a,:img_title+1
    ld (ROM_SelectPage3b),a

    xor a
    ld  hl,0
    call SetVramWrite

    ld hl,img_title	; address of compressed gfx
    ld de,0		; address to load to in VRAM
    xor a		; start decompressing new data
    call depack_loop

    ret

memload_ending:
    ld a,:img_ending
    ld (ROM_SelectPage3a),a
    ld a,:img_ending+1
    ld (ROM_SelectPage3b),a

    xor a
    ld  hl,0
    call SetVramWrite

    ld hl,img_ending	; address of compressed gfx
    ld de,0		; address to load to in VRAM
    xor a		; start decompressing new data
    call depack_loop

    ret

memload_logo:
    ld a,:img_logo
    ld (ROM_SelectPage3a),a
    ld a,:img_logo+1
    ld (ROM_SelectPage3b),a

    xor a
    ld  hl,0
    call SetVramWrite

    ld hl,img_logo	; address of compressed gfx
    ld de,0		; address to load to in VRAM
    xor a		; start decompressing new data
    call depack_loop
    ret

memload_statusandfont:
    ld a,:img_status
    ld (ROM_SelectPage3a),a
    ld a,:img_status+1
    ld (ROM_SelectPage3b),a


    ld a,3
    ld  hl,128*64
    call SetVramWrite

    ld hl,img_status	; address of compressed gfx
    ld de,128*64		; address to load to in VRAM
    xor a		        ; start decompressing new data
    call depack_loop
    ret

memload_options:
    ld a,:img_options
    ld (ROM_SelectPage3a),a
    ld a,:img_options+1
    ld (ROM_SelectPage3b),a

    ld a,6
    ld  hl,0
    call SetVramWrite

    ld hl,img_options	; address of compressed gfx
    ld de,0		; address to load to in VRAM
    xor a		; start decompressing new data
    call depack_loop

    ret

memload_demofont:
    ld a,:img_intro2
    ld (ROM_SelectPage3a),a
    ld a,:img_intro2+1
    ld (ROM_SelectPage3b),a

    ld a,2 ; page 1; 
    ld  hl,0
    call SetVramWrite

    ld hl,img_intro3	; address of compressed gfx
    ld de,0		; address to load to in VRAM
    xor a		; start decompressing new data
    call depack_loop
    ret

memload_introdemo:
    ld a,:img_intro1
    ld (ROM_SelectPage3a),a
    ld a,:img_intro1+1
    ld (ROM_SelectPage3b),a

    ld a,6 ; page 3
    ld  hl,0
    call SetVramWrite

    ld hl,img_intro1	; address of compressed gfx
    ld de,0		; address to load to in VRAM
    xor a		; start decompressing new data
    call depack_loop

    call memload_demofont

    ld a,4 ; page 2
    ld  hl,0
    call SetVramWrite

    ld hl,img_intro2	; address of compressed gfx
    ld de,0		; address to load to in VRAM
    xor a		; start decompressing new data
    call depack_loop

    ret

depack_loop:
    push de		; push VRAM address

    ld de,decompressSpace	; decompress to this address
    call bitbuster.depack
    
    pop de		; pop VRAM address
    
    push af		; push blocks remaining status
    push hl		; push pointer to next compressed block
    push de		; push VRAM address
    push bc		; push length of decompressed data
    
    ld hl,decompressSpace	; address of decompressed data

    ; repeat b-times
    ld c,$98
    ld b,0
    otir
    ld b,0
    otir
    ld b,0
    otir
    ld b,0
    otir

    pop bc		; pop length of decompressed data
    pop hl		; pop VRAM address
    add hl,bc	; calculate VRAM address for next block
    ex de,hl	; and put it in DE
    pop hl		; pop pointer to next compressed block
    pop af		; pop blocks remaining status

    jr nz,depack_loop	; loop while more blocks remaining
    ret

memload_intro:
    ld a,:page_intro
    ld (ROM_SelectPage3a),a
    ld a,:page_intro+1
    ld (ROM_SelectPage3b),a
    ret

memload_betweenCode:
    ld a,:img_between
    ld (ROM_SelectPage3a),a
    ld a,:img_between+1
    ld (ROM_SelectPage3b),a
    ret

memload_between:
    ld a,:img_between
    ld (ROM_SelectPage3a),a
    ld a,:img_between+1
    ld (ROM_SelectPage3b),a
    ld hl,img_between

    push hl
    ld a,6
    ld  hl,0
    call SetVramWrite

    pop hl ; hl points to rom with gfx data
    ld de,0		; address to load to in VRAM
    xor a		; start decompressing new data
    call depack_loop

    ret

memload_world1:
    ld a,:img_world1
    ld (ROM_SelectPage3a),a
    ld a,:img_world1+1
    ld (ROM_SelectPage3b),a
    ld hl,img_world1
    call memloadWorldToVram
    ret

memload_world2:
    ld a,:img_world2
    ld (ROM_SelectPage3a),a
    ld a,:img_world2+1
    ld (ROM_SelectPage3b),a
    ld hl,img_world2
    call memloadWorldToVram
    ret

memload_world3:
    ld a,:img_world3
    ld (ROM_SelectPage3a),a
    ld a,:img_world3+1
    ld (ROM_SelectPage3b),a
    ld hl,img_world3
    call memloadWorldToVram
    ret

memload_world4:
    ld a,:img_world4
    ld (ROM_SelectPage3a),a
    ld a,:img_world4+1
    ld (ROM_SelectPage3b),a
    ld hl,img_world4
    call memloadWorldToVram
    ret

memload_world5:
    ld a,:img_world5
    ld (ROM_SelectPage3a),a
    ld a,:img_world5+1
    ld (ROM_SelectPage3b),a
    ld hl,img_world5
    call memloadWorldToVram
    ret


memloadWorldToVram:
    push hl
    ld a,2
    ld  hl,0
    call SetVramWrite

    pop hl ; hl points to rom with gfx data
    ld de,0		; address to load to in VRAM
    xor a		; start decompressing new data
    call depack_loop

    ret

loadWorldGfx:
    cp 1
    jp z,memload_world1
    cp 2
    jp z,memload_world2
    cp 3
    jp z,memload_world3
    cp 4
    jp z,memload_world4
    cp 5
    jp z,memload_world5

    ret

setWorld:
    cp 1
    jp z,setWorld1
    cp 2
    jp z,setWorld2
    cp 3
    jp z,setWorld3
    cp 4
    jp z,setWorld4
    cp 5
    jp z,setWorld5
    ret

setWorld1:
    ld a,:page_world1
    ld (ROM_SelectPage3a),a
    ld a,:page_world1+1
    ld (ROM_SelectPage3b),a

    ld hl,maps_world1
    ld (mapPointer),hl

    ld hl,maps_bg_world1
    ld (mapBGPointer),hl

    ld hl,sprites_world1
    ld (spriteDataEnemyPointer),hl
    ld hl,sprites_world1+(384*6)
    ld (spriteColorsEnemyPointer),hl

    ld hl,texts_world1
    ld (textWorldPointer),hl

    ld hl,colors_world1
    ld (colorSetPointer),hl

    ld ix,maps_world1
    ld iy,maps_bg_world1
    call skipStage

    ld hl,txt_pass1
    ld de,txt_pass
    ld bc,7
    ldir

    ld a,false
    ld (onIce),a

    ; box sprite
    ld hl,sprites_world1+(384*6)+(192*6)
    call updateBoxSprites
    ret

setWorld2:
    ld a,:page_world2
    ld (ROM_SelectPage3a),a
    ld a,:page_world2+1
    ld (ROM_SelectPage3b),a

    ld hl,maps_world2
    ld (mapPointer),hl
    ld hl,maps_bg_world2
    ld (mapBGPointer),hl

    ld hl,sprites_world2
    ld (spriteDataEnemyPointer),hl
    ld hl,sprites_world2+(384*7)
    ld (spriteColorsEnemyPointer),hl

    ld hl,texts_world2
    ld (textWorldPointer),hl

    ld hl,colors_world2
    ld (colorSetPointer),hl

    ld ix,maps_world2
    ld iy,maps_bg_world2
    call skipStage

    ld hl,txt_pass2
    ld de,txt_pass
    ld bc,7
    ldir 

    ld a,false
    ld (onIce),a

    ; box sprite
    ld hl,sprites_world2+(384*7)+(192*7)
    call updateBoxSprites

    ret

setWorld3:
    ld a,:page_world3
    ld (ROM_SelectPage3a),a
    ld a,:page_world3+1
    ld (ROM_SelectPage3b),a

    ld hl,maps_world3
    ld (mapPointer),hl
    ld hl,maps_bg_world3
    ld (mapBGPointer),hl

    ld hl,sprites_world3
    ld (spriteDataEnemyPointer),hl
    ld hl,sprites_world3+(384*6)
    ld (spriteColorsEnemyPointer),hl

    ld hl,texts_world3
    ld (textWorldPointer),hl

    ld hl,colors_world3
    ld (colorSetPointer),hl

    ld ix,maps_world3
    ld iy,maps_bg_world3
    call skipStage

    ld hl,txt_pass3
    ld de,txt_pass
    ld bc,7
    ldir 

    ld a,false
    ld (onIce),a

    ; box sprite
    ld hl,sprites_world3+(384*6)+(192*6)
    call updateBoxSprites

    ret

setWorld4:
    ld a,:page_world4
    ld (ROM_SelectPage3a),a
    ld a,:page_world4+1
    ld (ROM_SelectPage3b),a

    ld hl,maps_world4
    ld (mapPointer),hl
    ld hl,maps_bg_world4
    ld (mapBGPointer),hl

    ld hl,sprites_world4
    ld (spriteDataEnemyPointer),hl
    ld hl,sprites_world4+(384*6)+192
    ld (spriteColorsEnemyPointer),hl

    ld hl,texts_world4
    ld (textWorldPointer),hl

    ld hl,colors_world4
    ld (colorSetPointer),hl

    ld ix,maps_world4
    ld iy,maps_bg_world4
    call skipStage

    ld hl,txt_pass4
    ld de,txt_pass
    ld bc,7
    ldir 

    ld a,true
    ld (onIce),a

    ; box sprite
    ld hl,sprites_world4+(384*6)+(192*6)+(3*64)+(32*3)
    call updateBoxSprites

    ret

setWorld5:
    ld a,:page_world5
    ld (ROM_SelectPage3a),a
    ld a,:page_world5+1
    ld (ROM_SelectPage3b),a

    ld hl,maps_world5
    ld (mapPointer),hl
    ld hl,maps_bg_world5
    ld (mapBGPointer),hl

    ld hl,sprites_world5
    ld (spriteDataEnemyPointer),hl
    ld hl,sprites_world5+(384*7)
    ld (spriteColorsEnemyPointer),hl

    ld hl,texts_world5
    ld (textWorldPointer),hl

    ld hl,colors_world5
    ld (colorSetPointer),hl

    ld ix,maps_world5
    ld iy,maps_bg_world5
    call skipStage

    ld hl,txt_pass5
    ld de,txt_pass
    ld bc,7
    ldir 

    ld a,false
    ld (onIce),a

    ; box sprite
    ld hl,sprites_world5+(384*7)+(192*7)
    call updateBoxSprites

    ret


skipStage:
    ld a,(playerStage)
    or a
    ret z
    ld b,a
    ld de,mapLength
skipStage2:
    add ix,de
    djnz skipStage2
    ld (mapPointer),ix

    ld b,a
    ld de,40

skipStage3:
    add iy,de
    djnz skipStage3
    ld (mapBGPointer),iy

    ret