; generate maps and animation of the tiles
generateMap:

    ld a,0
    ld (mapbgdx),a
    ld (mapbgdy),a
    ld (platform1X),a
    ld (platform2X),a
    ld (platform1Y),a
    ld (platform2Y),a
    ld (platform1Wait),a
    ld (platform2Wait),a
    ld (level_switch_time),a
    ld (cageFall),a
    ld (playerOnPlatform),a
    ld (playerOnPlatform2),a

    ld a,true
    ld (level_switch),a

    ld a,right
    ld (platform1Move),a
    ld a,down
    ld (platform2Move),a
    ld b,8
    ld c,5
    ld hl,(mapBGPointer)
generateMapBGLoop:
    push bc
    ld a,(hl)

	ld b,a
	and %00011000		; bereken sy
    sla a
    sla a
	ld (mapbgsy),a

	ld a,b
	and %00000111		; bereken sx
	sla a
	sla a
    sla a
    sla a
    sla a
	ld (mapbgsx),a

    push hl
    ld hl,mapTilesBG
    call DoCopy
    pop hl

    ld a,(mapbgdx)
    add a,32
    ld (mapbgdx),a

    inc hl    
    pop bc
    djnz generateMapBGLoop

    dec c
    ld a,c
    cp 0
    jp z,generateMap2

    ld a,(mapbgdy)
    add a,32
    ld (mapbgdy),a

    ld b,8
    jp generateMapBGLoop

generateMap2:
    ld hl,copyBackground
    call DoCopy

    ld a,0
    ld (keysLeft),a

    ; pak juiste map..
    ld bc,mapLength
    ld de,map
    ld hl,(mapPointer)
    ldir

    ld hl,map
    
    ld b,32
    ld c,24
generateMapLoop:
    push bc

    ld a,(hl)
    cp 0 
    jp z,generateMapLoop2

    cp tile_blockPlatform
    jp z,generateMapLoop2

	ld b,a
	and %11100000		; bereken sy
    srl a
    srl a
    add a,128
	ld (mapsy),a

	ld a,b
	and %00011111		; bereken sx
	sla a
	sla a
	sla a
	ld (mapsx),a

    ld a,(mapsy)
    sub 128
    cp 24
    call z,generateMapSolid
    cp 16
    call z,generateMapSolid

    push hl
    ld hl,maptiles
    call DoCopy
    pop hl

    ; most tiles use transparent copys
    ld a,$98
    ld (maptiles+14),a

generateMapLoop2:
    ; check for special tiles
    ld a,(hl)
    ; sleutel tile?
    cp tile_key
    call z,generateMapAddKey

    cp tile_key2
    call z,generateMapAddKey

    ; exit door?
    cp tile_door
    call z,generateMapSetDoor
    
    ; spike?
    cp tile_spikeUp
    call z,saveSpike

    ; spike?
    cp tile_spikeDown
    call z,saveSpike

    cp tile_platform1
    call z,savePlatform1

    cp tile_platform2
    call z,savePlatform2

    cp tile_switch_off
    call z,setInitSwitchOff
    
    ; animation tile (rotate)
    and %11000000
    cp 128
    call z,saveAnimationTile

    ld a,(mapdx)
    add a,8
    ld (mapdx),a

    pop bc
    inc hl    
    djnz generateMapLoop

    dec c
    ld a,c
    cp 0
    ret z

    ld a,(mapdy)
    add a,8
    ld (mapdy),a

    ld b,32
    jp generateMapLoop

generateMapAddKey:
    push hl
    ld hl,keysLeft
    inc (hl)
    pop hl
    ret

generateMapSolid:
    ld a,(mapsx)
    sub 128
    ret c

    ld c,a
    ld a,$d0
    ld (maptiles+14),a
    ld a,c
    ret


generateMapSetDoor:
    push af
    ld a,(mapdx)
    ld (doordx),a
    ld a,(mapdy)
    ld (doordy),a
    pop af
    ret

setupMapObjects:
    ld hl,map
    ld de,768
    add hl,de
    ld a,(hl)
    sla a
    sla a
    sla a
    ld (spritePositionPlayer+1),a
    ld (spritePositionPlayer+5),a
    inc hl
    ld a,(hl)
    sla a
    sla a
    sla a
    dec a   ; shifted + 1 bug for sprites
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a
    inc hl
    ld b,6 ; 6 enemies
    ld ix,spritePositionEnemy1
    ld iy,enemy1Number
setupMapObjectEnemies:    
    call setEnemySpritePos ;     db 1,7,0,2,2 ; enemy
    inc hl
    ld (ix),a
    ld (ix+4),a
    ld a,c
    ld (ix+1),a
    ld (ix+5),a
    ld de,8    
    add ix,de

    push hl
    push bc
    ld a,(hl) ; enemy number
    ld hl,0
    cp 0
    jp z,setupMapObjectEnemies3
  

    ld de,192
    ld b,a
setupMapObjectEnemies2: 
    add hl,de
    djnz setupMapObjectEnemies2

setupMapObjectEnemies3
    ld (iy),l
    inc iy
    ld (iy),h

    pop bc
    pop hl

    inc hl
    inc iy
    ld a,(hl)
    ; enemy direction
    ld (iy),a

    inc hl
    inc iy
    ld a,(hl)
    ; enemy ai
    ld (iy),a

    inc iy
    ; enemy dead
    ld a,0
    ld (iy),a

    inc hl
    inc iy    
    ld a,0
    ld (iy),a ; ai state
    inc iy
    ld a,(hl)
    ld (iy),a ; speed

    inc iy
    ld a,4
    ld (iy),a ; movecounter

    inc hl
    inc iy

    djnz setupMapObjectEnemies
    
    ; boxen
    call setEnemySpritePos ; eigenlijk voor box     ; x,y,number,direction, ai
    ld (spritePositionBox),a
    ld (spritePositionBox+4),a
    ld a,c
    ld (spritePositionBox+1),a
    ld (spritePositionBox+5),a
    
    ret

setEnemySpritePos:
    ld a,(hl) ; xpos enemie
    cp 0
    jp z,setEnemySpritePos2
    sla a
    sla a
    sla a
    ld c,a

    inc hl
    ld a,(hl) ;y pos enemie
    sla a
    sla a
    sla a
    dec a
    ret

setEnemySpritePos2:
    ld c,0
    ld a,218
    inc hl
    ret


savePlatform1:
    push hl
    ld hl,platform1Y
    ld a,(mapdy) ; x-positie van destination opslaan
    ld (hl),a
    ld (pf1dy),a
    ld (p1rdy),a
    ld (p1rsy),a
    inc hl
    ld a,(mapdx) ; y-positie van destination opslaan
    ld (hl),a
    pop hl
    ld a,0
    ret

savePlatform2:
    push hl
    ld hl,platform2Y
    ld a,(mapdy) ; x-positie van destination opslaan
    ld (hl),a
    inc hl
    ld a,(mapdx) ; y-positie van destination opslaan
    ld (hl),a
    ld (pf2dx),a
    ld (p2rdx),a
    ld (p2rsx),a
    pop hl
    ld a,0
    ret

saveSpike:
    push hl
    ld hl,(spikePos)
    ld (hl),a ; bewuste tile opslaan
    inc hl
    ld a,(mapdx) ; x-positie van destination opslaan
    ld (hl),a
    inc hl
    ld a,(mapdy) ; y-positie van destination opslaan
    ld (hl),a
    inc hl
    ld (spikePos),hl
    pop hl
    ld a,0
    ret

saveAnimationTile:
    ld a,(hl) 
    and %00011000
    cp 24
    ret z ; niet de laatste 8 van de regel meenemen

    ld a,(hl)

    push hl
    ld hl,(animationPos)
    ld (hl),a ; bewuste tile opslaan
    inc hl
    ld a,(mapdx) ; x-positie van destination opslaan
    ld (hl),a
    inc hl
    ld a,(mapdy) ; y-positie van destination opslaan
    ld (hl),a
    inc hl
    ld (animationPos),hl
    pop hl
    ret

animateSpikes:
    ld hl,spikeSpace

    ld a,(spikeCounter)
    inc a
    ld (spikeCounter),a
    cp 50
    jp z,animateSpikesLoop
    cp 70
    jp z,animateSpikesLoop
    cp 90
    jp z,animateSpikesLoop
    cp 200
    jp z,animateSpikesLoop

    ret

; spikespace takes 3 positions per spike (atm 64/3 spikes max)
animateSpikesLoop:
    ld a,(hl) ; spike nummer
    cp 0
    ret z ; animaties doorlopen?
    inc a ; zet hier volgende tile klaar
    cp tile_spikeUp+4 ; laatste animatie? dan resetten
    call z,animateResetTileSpike
    cp tile_spikeDown+4 ; laatste animatie? dan resetten
    call z,animateResetTileSpike


    ld (hl),a

    push af

	ld c,a
	and %11100000		; bereken sy
    srl a
    srl a
    add a,128
	ld (spikesy2),a

	ld a,c
	and %00011111		; bereken sx
	sla a
	sla a
	sla a
	ld (spikesx2),a

    inc hl
    ld a,(hl)
    ld e,a
    ld (spikedx),a
    ld (spikesx),a
    inc hl
    ld a,(hl)
    ld c,a
    ld (spikedy),a
    ld (spikesy),a
    push hl
    push bc

    ld a,2
    ld (spiketiles+3),a
    ld a,$d0
    ld (spiketiles+14),a    
    ld hl,spiketiles
    call DoCopy
    ld a,1
    ld (spiketiles+3),a
    ld a,$98
    ld (spiketiles+14),a    


    ld a,(spikesx2)
    ld (spikesx),a
    ld a,(spikesy2)
    ld (spikesy),a
    ei
    ld hl,spiketiles
    call DoCopy
    pop bc
    ; aanpassen in map
    ld hl,map
    ld d,0
    srl e
    srl e
    srl e
    add hl,de

    ld b,0
    sla c
    rl b
    sla c
    rl b
    add hl,bc
    ld b,h
    ld c,l

    pop hl
    pop af
    ld (bc),a ; place new spike on map
    inc hl

    jp animateSpikesLoop
    ret

animateResetTileSpike:
    sub 4
    ret

animateTiles:
    ld hl,animationSpace
animateTilesLoop:
    ld a,(hl)
    cp 0
    ret z ; animaties doorlopen?

    ld c,a
    and %00000011
    cp 3 ; laatste animatie? dan volgende keer terug
    ld a,c
    call z,animateResetTile


    inc a ; zet hier volgende tile klaar
    ld (hl),a

	and %11100000		; bereken sy
    srl a
    srl a
    add a,128
	ld (animsy),a

	ld a,c
	and %00011111		; bereken sx
	sla a
	sla a
	sla a
    ld (animsx),a

    inc hl
    ld a,(hl)
    ld (animdx),a
    inc hl
    ld a,(hl)
    ld (animdy),a
    push hl

    ld hl,animtiles
    call DoCopy

    pop hl

    inc hl
    jp animateTilesLoop

animateResetTile
    ld a,c
    sub 4
    ld (hl),a
    ret

mapMoveLeft:
    db 128,129,130,131
    db 132,133,134,135
    db 136,137,138,139
    db 255
mapMoveRight:
    db 140,141,142,143
    db 144,145,146,147
    db 148,149,150,151
    db 255
mapBreakFloor:
    db 184,185,186,187,188,189,190,191
    db 255

