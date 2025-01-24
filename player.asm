; player movement based on keys and gravity
playerMovement:
    ld a,false
    ld (playerLeftBlocked),a
    ld (playerRightBlocked),a    
    ld (playerDownBlocked),a
    ld (playerOnPlatform),a
    ld (playerOnPlatform2),a

    call checkJoyStick

    ; gravity
    call playerDown

    ld a,(playerIsDead)
    cp true
    ret z

    call iceMoveLeft
    call iceMoveRight

    ld a,(playerReverse)
    cp false
    call z,playerMovementNormal

    ld a,(playerReverse)
    cp true
    call z,playerMovementReverse

    ; moet de speler springen?
    ld a,(playerJumpBoolean)
    cp true
    call z,playerJump

    ; player wants to jump (up key)
    ld a,(joyStickValueY)
    cp up
    jp z,playerUp

    ; player wants to jump (space)
    call checkTrigger
    jp z,playerUp

    ld a,false
    ld (playerSpaceTriggered),a

    ret

iceMoveLeft:
    ld a,(onIce)
    cp false
    ret z

    ld a,(joyStickValueX)
    cp left
    ret z

    ld a,(playerIceLeft)
    cp 0
    ret z
    cp 255
    jp z,resetIce

    ; ice move left
    ld a,(playerIceLeft)
    add a,-2
    ld (playerIceLeft),a

    jp playerLeft
    
iceMoveRight:
    ld a,(onIce)
    cp false
    ret z

    ld a,(joyStickValueX)
    cp right
    ret z

    ld a,(playerIceRight)
    cp 0
    ret z
    cp 255
    jp z,resetIce

    ld a,(playerIceRight)
    add a,-2
    ld (playerIceRight),a

    jp playerRight

playerMovementNormal:
    ; player moves to the left
    ld a,(joyStickValueX)
    cp left
    call z,playerLeft

    ; player moves to the right
    ld a,(joyStickValueX)
    cp right
    call z,playerRight
    ret

playerMovementReverse:
    ; player moves to the left
    ld a,(joyStickValueX)
    cp left
    call z,playerRight    

    ; player moves to the right
    ld a,(joyStickValueX)
    cp right
    call z,playerLeft
    ret

playerLeft:
    ld a,(playerIceRight)
    or a
    jp nz,playerLeft.2

    ; check linksmidden
    ld hl,(spritePositionPlayer)
    ld de,((6) & #00ff) + ((2) << 8)
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    ret z

    ; check linksboven
    ld hl,(spritePositionPlayer)
    ld de,((10) & #00ff) + ((2) << 8)
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    ret z

    ; check linksonder
    ld hl,(spritePositionPlayer)
    ld de,((15) & #00ff) + ((2) << 8)
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    ret z

    ld a,left
    ld (playerDirection),a

    ; box move?
    ld ix,spritePositionPlayer
    call BoxCollisionCheck
    call c,setBoxLeft
    ld a,(playerLeftBlocked)
    dec a
    ret z

    ld a,(spritePositionPlayer+1)
    dec a    
    ld (spritePositionPlayer+1),a
    ld (spritePositionPlayer+5),a

    ld a,(onIce)
    cp false
    jp z,playerLeft.4

    ld a,(playerIceLeft)
    inc a
    cp 16
    jp z,playerLeft.4
    ld (playerIceLeft),a

playerLeft.4:
    ld a,(playerJumpBoolean)
    cp true
    jp z,playerLeft.3

playerLeft.2:
    ld a,(playerIsDead)
    cp true
    ret z

    ld hl,(playerMovePointer)
    ld a,(hl)
    cp 255
    call z,playerMovePointerReset
    ld bc,2*48
    call setPlayerSprites

    ld a,(playerMoveCounter)
    inc a
    ld (playerMoveCounter),a

    ld a,(playerMoveCounter)
    cp 4
    ret nz
    xor a
    ld (playerMoveCounter),a
    ld hl,playerMovePointer
    inc (hl)
    ret

playerLeft.3:
    jp playerJumpSpriteLeft

playerRight:
    ld a,(playerIceLeft)
    or a
    jp nz,playerRight.2

    ; check rechtboven
    ld hl,(spritePositionPlayer)
    ld de,((6) & #00ff) + ((14) << 8)
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    ret z

    ; check rechtboven
    ld hl,(spritePositionPlayer)
    ld de,((10) & #00ff) + ((14) << 8)
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    ret z

    ; check rechtsonder
    ld hl,(spritePositionPlayer)
    ld de,((15) & #00ff) + ((14) << 8)
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    ret z

    ld a,right
    ld (playerDirection),a

    ; box move?
    ld ix,spritePositionPlayer
    call BoxCollisionCheck
    call c,setBoxRight
    ld a,(playerRightBlocked)
    dec a
    ret z

    ld a,(spritePositionPlayer+1)
    inc a
    ld (spritePositionPlayer+1),a
    ld (spritePositionPlayer+5),a

    ld a,(onIce)
    cp false
    jp z,playerRight.4

    ld a,(playerIceRight)
    inc a
    cp 16
    jp z,playerRight.4
    ld (playerIceRight),a

playerRight.4:
    ld a,(playerJumpBoolean)
    cp true
    jp z,playerRight.3

playerRight.2:
    ld a,(playerIsDead)
    cp true
    ret z

    ld hl,(playerMovePointer)
    ld a,(hl)
    cp 255
    call z,playerMovePointerReset
    ld bc,0
    call setPlayerSprites

    ld a,(playerMoveCounter)
    inc a
    ld (playerMoveCounter),a

    ld a,(playerMoveCounter)
    cp 4
    ret nz
    xor a
    ld (playerMoveCounter),a

    ld hl,playerMovePointer
    inc (hl)
    ret

playerRight.3:
    jp playerJumpSpriteRight

playerMovePointerReset:
    ld hl,playerMove
    ld (playerMovePointer),hl
    ld a,(hl)
    ret

playerMove:
    db 0,32,64,32,255

playerDown:
    ld a,(playerJumpBoolean)
    cp true
    ret z

    call checkDown
    ld a,(playerDownBlocked)
    cp true
    ret z
    ld a,(playerOnPlatform)
    cp true 
    ret z
    ld a,(playerOnPlatform2)
    cp true 
    ret z
  

playerDown2:
    ld a,true
    ld (playerFalling),a

    ld a,(spritePositionPlayer)
    add a,4
    or %00000011
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a

    ret

playerUp:
    ld a,(playerSpaceTriggered) ; continue jumping not allowed
    cp true
    ret z
    
    ld a,true
    ld (playerSpaceTriggered),a

    ld a,(playerJumpBoolean)
    cp false
    ret nz

    ld a,(playerFalling)
    dec a
    ret z

    ld a,true
    ld (playerJumpBoolean),a

    ld a,(playerDirection)
    cp right
    jp z,playerJumpSpriteRight

playerJumpSpriteLeft:
    ; jump to left sprite
    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColorsPlayerJumpRight
    ld bc,((#98) & #00ff) + ((32) << 8)
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteDataPlayerJumpLeft
    ld bc,((#98) & #00ff) + ((64) << 8)
    otir
    ret

playerJumpSpriteRight:
    ; jump to right sprite
    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColorsPlayerJumpRight
    ld bc,((#98) & #00ff) + ((32) << 8)    
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteDataPlayerJumpRight
    ld bc,((#98) & #00ff) + ((64) << 8)    
    otir
    ret

playerJump:
    ld hl,(playerJumpPosition)
    ld a,(hl)
    inc hl
    ld ( playerJumpPosition),hl
    cp 128
    jp z,playerJumpReset

    ; check linksboven voor springen
    ld hl,(spritePositionPlayer)
    ld de,((4) & #00ff) + ((4) << 8)
    add hl,de
    call checkTile
    call checkPlayerSpecialTiles
    call checkPlayerSurroundingsBlocker
    ret z

    ; check middenboven voor springen
    ld hl,(spritePositionPlayer)
    ld de,((4) & #00ff) + ((8) << 8)
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    ret z

    ; check rechtsboven voor springen
    ld hl,(spritePositionPlayer)
    ld de,((4) & #00ff) + ((12) << 8)
    add hl,de
    call checkTile
    call checkPlayerSpecialTiles
    call checkPlayerSurroundingsBlocker
    ret z


    ld hl,(playerJumpPosition)
    dec hl
    ld b,(hl)
    ld a,(spritePositionPlayer)
    add b
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a

    ret

playerJumpReset:
    ld a,false
    ld (playerJumpBoolean),a
    ld hl,playerJumpTable
    ld (playerJumpPosition),hl

    ld a,(playerDirection)
    cp left
    jp z,playerJumpReset2

    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColorsPlayer+32
    ld bc,((#98) & #00ff) + ((32) << 8)
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteDataPlayer+64
    ld bc,((#98) & #00ff) + ((64) << 8)
    otir
    ret

playerJumpReset2
    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColorsPlayer+32
    ld bc,((#98) & #00ff) + ((32) << 8)
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteDataPlayer+256
	ld bc,((#98) & #00ff) + ((64) << 8)
    otir
    ret

playerJumpTable:
    ;db -4,-4,-4,-4,-4,-2,-2,-2,-2,0,0,0,0,0,0,0,0,0,128 ; 30
    db -4,-4,-4,-4,-4,-2,-2,-2,-2,-1,-1,0,0,0,0,0,0,128

checkDown:
    ld a,(spritePositionPlayer)
    inc a
    and %00000111
    or a
    jp nz,checkDown3

    ld a,(playerFalling)
    cp false
    jp z,checkDown2

    ld a,false
    ld (playerFalling),a

checkDown2:
    
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((4) << 8)
    add hl,de
    call checkTile
    sub 140
    cp 12
    jp c,autoMovePlayerRight

    ; check rechtsonder voor lopende band rechts
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((12) << 8)
    add hl,de
    call checkTile
    sub 140
    cp 12
    jp c,autoMovePlayerRight

    ; check linksonder voor lopende band links
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((4) << 8)
    add hl,de
    call checkTile
    sub 128
    cp 12
    or a
    jp c,autoMovePlayerLeft

    ; check rechtsonder voor lopende band links
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((12) << 8)
    add hl,de
    call checkTile
    sub 128
    cp 12
    jp c,autoMovePlayerLeft

    ; check linksonder voor brekende vloer
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((4) << 8)    
    add hl,de
    call checkTile
    ld c,a
    and %11111000
    cp 184
    call z,breakDownFloor

    ; check rechtsonder voor brekende vloer
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((12) << 8)
    add hl,de
    call checkTile
    ld c,a
    and %11111000
    cp 184
    call z,breakDownFloor

    ; check middenonder voor brekende vloer
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((8) << 8)    
    add hl,de
    call checkTile
    ld c,a
    and %11111000
    cp 184
    call z,breakDownFloor

    ; check linksonder voor vallen
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((4) << 8)
    add hl,de
    call checkTile
    call checkPlayerSurroundingsFallBlocker
    call z,blockPlayerDown

    ; check middenonder voor vallen
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((8) << 8)
    add hl,de
    call checkTile
    ld c,a
    and %11100000
    cp 96
    call z,resetIce
    ld a,c
    call checkPlayerSurroundingsFallBlocker
    call z,blockPlayerDown

    ; check rechtsonder voor vallen
    ld hl,(spritePositionPlayer)
    ld de,((18) & #00ff) + ((12) << 8)    
    add hl,de
    call checkTile
    call checkPlayerSurroundingsFallBlocker
    call z,blockPlayerDown

checkDown3:
    call checkPlayerOnPlatform

    ld a,(playerDownBlocked)
    cp true
    ret z

    ; on box
    ld ix,spritePositionPlayer
    call BoxCollisionCheckTop
    ret nc

    ld a,(spritePositionBox)
    ld b,a
    ld a,(spritePositionPlayer)
    sub b
    jp c,blockPlayerDown

    ret

blockPlayerLeft:
    ld a,true
    ld (playerLeftBlocked),a
    ret

blockPlayerRight:
    ld a,true
    ld (playerRightBlocked),a
    ret

blockPlayerDown:
    ld a,true
    ld (playerDownBlocked),a
    ret


checkPlayerOnPlatform:
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    ; left/right platform
    ld a,(platform1Y)
    or a
    jp z,checkPlayerOnPlatform2
    sub 17
    ld c,a
    ld a,(py)
    sub c
    jp nz,checkPlayerOnPlatform2

    ld ix,platform1X
    call PlatformCollisionCheck
    jp nc,checkPlayerOnPlatform2
    
    ld a,true
    ld (playerOnPlatform),a
    ret

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; player on platform up/down
checkPlayerOnPlatform2:
    ld a,(platform2Move)
    cp up
    jp z,checkPlayerOnPlatform3

    ld a,(playerDownBlocked)
    cp true
    ret z
    
checkPlayerOnPlatform3:
    ld a,(platform2Y)
    or a
    ret z

    ld c,a
    ld a,(py)
    add 18
    sub c
    and %11111000
    or a
    ret nz

    ld ix,platform2X
    call PlatformCollisionCheck
    ret nc

    ld a,(platform2Y)
    sub 16
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a

    ld a,true
    ld (playerOnPlatform2),a
    ret

; checks the tiles around the object
; hl points to spriteobject with coordinates (Y,X)
checkTile:
    ld a,l
    ld c,h
    ld hl,map
    srl c
    srl c
    srl c
    ld d,0
    ld e,c

    ld (currentTileX),de
    add hl,de
    and 11111000b
    ld (currentTileY),a        

    ld e,a
    ;ld d,0

    sla e
    rl d
    sla e
    rl d
    add hl,de
    ld a,(hl) ; geeft tilenummer terug
    ret


; a = tilenumber
checkPlayerSpecialTiles:
    cp tile_key
    jp z,setKeyfound

    cp tile_key2
    jp z,setKeyfound

    cp tile_invincible
    jp z,setPlayerInvincible

    cp tile_reverse
    jp z,setPlayerReverse

    cp tile_heart
    jp z,setPlayerLife
    

    cp tile_spikeUp+1
    jp z,setPlayerIsDead

    cp tile_spikeUp+2
    jp z,setPlayerIsDead

    cp tile_spikeUp+3
    jp z,setPlayerIsDead

    cp tile_spikeDown+1
    jp z,setPlayerIsDead

    cp tile_spikeDown+2
    jp z,setPlayerIsDead

    cp tile_spikeDown+3
    jp z,setPlayerIsDead

    cp tile_pass1
    jp z,doPass
    cp tile_pass2
    jp z,doPass


    cp tile_animationDead
    jp z,setPlayerIsDead
    cp tile_animationDead+1
    jp z,setPlayerIsDead
    cp tile_animationDead+2
    jp z,setPlayerIsDead
    
    cp tile_animationDead+3
    jp z,setPlayerIsDead

    cp tile_switch_on
    jp z,setSwitchOff
    cp tile_switch_off
    jp z,setSwitchOn

    ld c,a
    ld a,(option_dif)
    cp 1 ; beginner
    ld a,c
    ret z

    ld c,a
    sub 240
    jp nc,setPlayerIsDead
    ld a,c

    ret

resetIce:
    xor a
    ld (playerIceLeft),a
    ld (playerIceRight),a
    ret

playerCollision:
    ld a,(hl) ; gaat enemy al dood?
    cp false
    jp nz,main

    ld a,(playerInvincible)
    cp false
    jp z,playerDead
 

    call killEnemy

    jp main


;-------------------------------------
; level complete
;-------------------------------------
checkLevelComplete
    ld a,(keysLeft)
    or a
    call z,setLevelComplete
    ld a,tile_door
    ret

setLevelComplete:
    ld a,true
    ld (levelCompleted),a
    ret

openDoor:
    ld	bc,sfx_opendoor
    call	ttsfx_start

    ld hl,doortiles
    call DoCopy

    ; check level for endboss scene
    ld a,(playerStage)
    cp 9
    ret nz

    ld a,(playerWorld)
    cp 5
    ret nz

    ld hl,(colorSetPointer)
    call SetColor

    ; fireballs kill
    ld hl,enemy2Dead    
    call killEnemy
    ld hl,enemy3Dead    
    call killEnemy
    ld hl,enemy4Dead    
    call killEnemy
    ld hl,enemy5Dead    
    call killEnemy

    ld a,218
    ld (spritePositionHelp),a
    ld (spritePositionHelp+4),a
    ld (spritePositionHelp+8),a
    ld (spritePositionHelp+12),a
    halt

    ld a,true
    ld (cageFall),a

    ret

doLevelCompleted:
    ld hl,(colorSetPointer)
    call SetColor

    ld a,true
    ld (playerIsDead),a

    ld a,8
    call replay_fade_out

    ld a,(spritePositionPlayer)
    sub 4
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a    

    ld	bc,sfx_enemydead
    call	ttsfx_start

    call killAllEnemies

doLevelCompleted2:
    ld a,(option_dif)
    cp 3
    jp nc,doLevelCompleted4
    
    call setPlayerLife2
    ld b,50
    call wait
doLevelCompleted4:
    ld de,(colorSetPointer)
    ld hl,blackPalette
    call colorFader

    call replay_pause
    call resetInterrupt

    ld b,20
    call wait


    ; point to next map in the world
    ld de,mapLength
    ld hl,(mapPointer)
    add hl,de
    ld (mapPointer),hl


    ; next text
    ld hl,(textWorldPointer)
doLevelCompleted3:
    ld a,(hl)
    cp 255
    inc hl    
    jp nz,doLevelCompleted3
    ld (textWorldPointer),hl

    ; and next background
    ld de,40
    ld hl,(mapBGPointer)    
    add hl,de
    ld (mapBGPointer),hl

    ; next player stage
    ld a,(playerStage)
    inc a
    ld (playerStage),a
    cp 10
    jp nz,gameStart

    ; level 10 reached!!  next world
    call memload_betweenCode
    call betweenWorlds

    ; new world
    xor a
    ld (playerStage),a
    ld a,(playerWorld)
    inc a
    ld (playerWorld),a

    ld a,(playerWorld)
    call loadWorldGfx
    ld a,(playerWorld)
    call setWorld

    jp gameStart

killAllEnemies:
    ; kill all enemies
    ld b,6
    ld hl,enemy1Dead
killAllEnemies2:

    ld a,(hl) ; enemy dead?
    cp false
    call z,killEnemy
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl
    inc hl

    djnz killAllEnemies2

    ld b,100
    jp wait

;-------------------------------------
; invincible
;-------------------------------------
doPlayerInvisible:
    ld a,(isrInvincible)
    sub 30
    call ns,setPlayerUnInvincible

    bit 1,a
    jp z,doPlayerInvisible2

    ld hl,colorWhite    
    call SetColor

    ld	bc,sfx_invincible
    jp ttsfx_start
    
doPlayerInvisible2:
    ld hl,(colorSetPointer)
    jp SetColor

setPlayerInvincible:
    xor a
    ld (hl),a
    call replaceTileDefault

    xor a
    ld (isrInvincible),a

    ld a,true
    ld (playerInvincible),a
    ret

setPlayerUnInvincible:
    ld a,false
    ld (playerInvincible),a

    ld hl,(colorSetPointer)
    jp SetColor

;-------------------------------------
; extra live
;-------------------------------------
setPlayerLife:
    xor a
    ld (hl),a
    call replaceTileDefault

setPlayerLife2:
    ld	bc,sfx_heart
    call	ttsfx_start

    ld hl,playerLives
    inc (hl)
    call writeLifes

    ld a,50
    jp addScore

;-------------------------------------
; reverse
;-------------------------------------
doPlayerReverse:
    ld a,(isrReverse)
    sub 25
    call ns,setPlayerUnReverse
    ret

setPlayerReverse:
    xor a
    ld (hl),a
    call replaceTileDefault

    ld bc,sfx_reverse
    call ttsfx_start

    xor a
    ld (isrReverse),a

    ld a,true
    ld (playerReverse),a
    or a
    ret
setPlayerUnReverse:
    ld a,false
    ld (playerReverse),a
    ret

;-------------------------------------
; keys
;-------------------------------------
setKeyfound:
    xor a
    ld (hl),a
    call replaceTileDefault
    
    ld	bc,sfx_key
    call	ttsfx_start
    
    ld hl,keysLeft
    dec (hl)
    ld a,(hl)
    or a
    call z,openDoor

    call writeKeysFound

    ld a,100
    call addScore

    or a
    ret

replaceTileDefault:
    ld a,(currentTileY)
    ld (mapdy),a
    ld (mapsy),a

    ld a,(currentTileX)
    add a,a
    add a,a
    add a,a
    ld (mapdx),a
    ld (mapsx),a
    ld a,2
    ld (maptiles+3),a
    ld a,$d0
    ld (maptiles+14),a
    ld hl,maptiles
    call DoCopy
    ld a,1
    ld (maptiles+3),a
    ld a,$98 ; timp
    ld (maptiles+14),a
    ret

replaceTileSwitchOn:
    di
    call replaceTileDefault

    ld a,120
    ld (mapsx),a
    ld a,184
    ld (mapsy),a
    ld hl,maptiles
    call DoCopy
    ei
    ret

replaceTileSwitchOff:
    di
    call replaceTileDefault

    ld a,112
    ld (mapsx),a
    ld a,184
    ld (mapsy),a
    ld hl,maptiles
    call DoCopy
    ei
    ret

;-------------------------------------
; box
;-------------------------------------
setBoxLeft:
    ; boxmove alleen mogelijk als speler op zelfde hoogte of hoger staat
    ld a,(spritePositionBox)
    ld b,a
    ld a,(spritePositionPlayer)
    dec a
    sub b
    jp nc,blockPlayerLeft

    ; and player right of the box
    ld a,(px)
    ld c,a
    ld a,(spritePositionBox+1)
    sub c
    ret nc

    ; box is blocked
    ld hl,(spritePositionBox)
    ld de,((10) & #00ff) + ((0) << 8)
    add hl,de
    dec h
    call checkTileEnemy
    call checkObjectSurroundingsBlocker
    jp z,blockPlayerLeft
setBoxLeft2:
    ld a,(boxmoveCounter)
    or a
    ret nz

    ld a,left
    ld (boxmove),a
    ld a,2
    ld (boxmoveCounter),a
    or a
    ret

setBoxRight:
    ld a,(spritePositionBox)
    ld b,a
    ld a,(spritePositionPlayer)
    dec a
    sub b
    jp nc,blockPlayerRight

    ; and player left of the box
    ld a,(px)
    ld c,a
    ld a,(spritePositionBox+1)
    sub c
    ret c

    ; box is blocked
    ld hl,(spritePositionBox)
    ld de,((10) & #00ff) + ((16) << 8)    
    add hl,de
    call checkTileEnemy
    call checkObjectSurroundingsBlocker
    jp z,blockPlayerRight ; speler mag er ook niet langs

setBoxRight2
    ld a,(boxmoveCounter)
    or a
    ret nz

    ld a,right
    ld (boxmove),a
    ld a,2
    ld (boxmoveCounter),a
    ret

checkBoxUnderGround:
    ld a,(boxmoveCounter)
    or a
    ret nz
    ; check linksonder voor lopende band en brekende vloer
    ld hl,(spritePositionBox)
    ld de,((18) & #00ff) + ((12) << 8)    
    add hl,de
    call checkTileEnemy
    sub 128
    cp 12
    jp c,setBoxLeft2
    
    ; check linksonder voor lopende band en brekende vloer
    ld hl,(spritePositionBox)
    ld de,((18) & #00ff) + ((2) << 8)    
    add hl,de
    call checkTileEnemy
    sub 140
    cp 12
    jp c,setBoxRight2

    ld hl,(spritePositionBox)
    ld de,((18) & #00ff) + ((2) << 8)    
    add hl,de
    call checkTileEnemy
    ld c,a
    and %11111000
    cp 184
    jp z,breakDownFloor

    ld hl,(spritePositionBox)
    ld de,((18) & #00ff) + ((14) << 8)    
    add hl,de
    call checkTileEnemy
    ld c,a
    and %11111000
    cp 184
    jp z,breakDownFloor

    ld hl,(spritePositionBox)
    ld de,((18) & #00ff) + ((8) << 8) 
    add hl,de
    call checkTileEnemy
    ld c,a
    and %11111000
    cp 184
    jp z,breakDownFloor
    jp setBoxDown

setBoxDown:
    ld hl,(spritePositionBox)
    ld de,((18) & #00ff) + ((0) << 8)     
    add hl,de
    call checkTileEnemy
    call checkPlayerSurroundingsFallBlocker
    ret z

    ld hl,(spritePositionBox)
    ld de,((18) & #00ff) + ((15) << 8)     
    add hl,de
    call checkTileEnemy
    call checkPlayerSurroundingsFallBlocker
    ret z

    ld a,(boxmoveCounter)
    or a
    ret nz

    ld a,down
    ld (boxmove),a
    ld a,4
    ld (boxmoveCounter),a

    ret


;-------------------------------------
; player on floor
;-------------------------------------
breakDownFloor:
    ld a,(breakDownFloorCounter)
    inc a
    ld (breakDownFloorCounter),a
    cp 14
    jp nz,breakDownFloor2
    xor a
    ld (breakDownFloorCounter),a
    
    ld a,c
    inc a ; pak volgende tile
    cp 188 ; laatste blok.. lelijk jaja..
    jp z,breakDownFloorBroken
    cp 192 ; laatste blok.. lelijk jaja..
    jp z,breakDownFloorBroken

    ld (hl),a

    ; break langzaam
	ld c,a
	and %11100000		; bereken sy
    srl a
    srl a
    add a,128
	ld (mapsy),a

	ld a,c
	and %00011111		; bereken sx
	add a,a
	add a,a
	add a,a
	ld (mapsx),a

    di
    ld a,(currentTileY)
    ld (mapdy),a

    ld a,(currentTileX)
    add a,a
    add a,a
    add a,a
    ld (mapdx),a

    ld hl,maptiles
    call DoCopy
    ei
breakDownFloor2:
    ld a,true
    ld (playerDownBlocked),a
    ret

breakDownFloorBroken:
    xor a ; vervangende tile    
    ld (hl),a

    jp replaceTileDefault

autoMovePlayerLeft:
    ;call playerLeft
    ld a,(spritePositionPlayer+1)
    dec a    
    ld (spritePositionPlayer+1),a
    ld (spritePositionPlayer+5),a

    ld a,true
    ld (playerDownBlocked),a
    ret

autoMovePlayerRight:
    ;call playerRight    
    ld a,(spritePositionPlayer+1)
    inc a    
    ld (spritePositionPlayer+1),a
    ld (spritePositionPlayer+5),a

    ld a,true
    ld (playerDownBlocked),a
    ret

; check if a player is being blocked by a tile (tile 64-127) 
checkPlayerSurroundingsBlocker:
    neg
    bit 6,a
    ret nz
    and %10000000
    cp 128
    ret

; check if a player is being blocked by a tile (tile 64-127) or 192-223
checkPlayerSurroundingsFallBlocker:
    ; Between 192-208?
    ld c,a
    and %11110000
    cp 192
    ret z
    ld a,c

    cp 184
    ret z

    neg
    bit 6,a
    ret nz ; kleiner dan 64? dan terug
    ld c,a
    and %10000000
    cp 128
    ret ; kleiner dan 128? dan terug met flag gehezen

checkObjectSurroundingsBlocker:
    neg
    bit 6,a
    ret nz
    and %10000000
    cp 128
    ret

;-------------------------------------
; player dead
;-------------------------------------

setPlayerIsDead:
    ld a,(playerInvincible)
    cp true
    ret z

    ld a,true
    ld (playerIsDead),a
    ret

playerDead:
    halt
    ld	bc,sfx_dead
    call	ttsfx_start
    
    ld a,true
    ld (playerIsDead),a

    ;call resetInterrupt
    ;ld hl,isrMusic
    ;call setInterrupt
    ;ld b,25
    ;call wait

    call resetInterrupt
    ld hl,isr
    call setInterrupt

    ld b,5 ; 10 animatieframes

playerDeadAnimation:
    push bc

    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColorsExplosion
    ld bc,((#98) & #00ff) + ((32) << 8)    
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteDataExplosion
    ld bc,((#98) & #00ff) + ((64) << 8)    
    otir

    ld b,3
    call wait

    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColorsExplosion+32
    ld bc,((#98) & #00ff) + ((32) << 8)    
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteDataExplosion+64
    ld bc,((#98) & #00ff) + ((64) << 8)    
    otir

    ld b,3
    call wait

    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColorsExplosion+64
    ld bc,((#98) & #00ff) + ((32) << 8)    
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteDataExplosion+128
    ld bc,((#98) & #00ff) + ((64) << 8)    
    otir

    ld b,3
    call wait

    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColorsExplosion+32
    ld bc,((#98) & #00ff) + ((32) << 8)
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteDataExplosion+64
    ld bc,((#98) & #00ff) + ((64) << 8)    
    otir

    ld b,3
    call wait

    pop bc
    djnz playerDeadAnimation

    ld a,4
    call replay_fade_out

    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColorsRIP
    ld bc,((#98) & #00ff) + ((32) << 8)    
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteDataRIP
    ld bc,((#98) & #00ff) + ((64) << 8)    
    otir
    
playerDeadWait:
    halt
    call checkTrigger
    jp nz,playerDeadWait
    

    ld de,(colorSetPointer)
    ld hl,blackPalette
    call colorFader
    
    call replay_pause
    call resetInterrupt

    ld a,(playerLives)
    dec a
    ld (playerLives),a

    jp gameStart

;
; EnemyCollisionCheck
;
;   Calculates whether a collision occurs between the player
;   and an enemy
;
; IN: ix - pointer to enemy data record
; OUT: Carry set if collision
; CHANGES: AF
;
PLAYER_COLLISION_OFFSET_X: equ 0
PLAYER_COLLISION_OFFSET_Y: equ 0
PLAYER_WIDTH: equ 16
PLAYER_HEIGHT: equ 16

ENEMY_COLLISION_OFFSET_X: equ 0
ENEMY_COLLISION_OFFSET_Y: equ 0
ENEMY_COLLISION_WIDTH equ 16
ENEMY_COLLISION_HEIGHT equ 16
ENEMY_X: equ 1
ENEMY_Y: equ 0

EnemyCollisionCheck:
        ld      a,(px)  ; read player x-coordinate          [14]
        add     2       ; add offset for smaller rectangle  [8]
        ld      b,a     ;                                   [5]
        ld      c,8    ; set the width of the player       [8]
        
        ld      a,(ix+1)    ; read enemy x-coordinate           [21]
        add     2       ; add offset for smaller rectangle  [21]
        ld      e,10    ; set the width of the enemy        [21]

        call    .check  ;                                   [18]
        ret     nc      ;                                   [12/6]

        ld      a,(py)  ; read player y-coordinate          [14]
        add     2       ; add offset for smaller rectangle  [8]
        ld      b,a     ;                                   [5]
        ld      c,10    ; set the height of the player      [8]
        
        ld      a,(ix+0)    ; read enemy y-coordinate           [21]
        add     2       ; add offset for smaller rectangle  [21]
        ld      e,10    ; set the height of the enemy      [21]

.check:
        sub     b               ; calculate x2-x1              [5]
        jr      nc,.other       ; don't jump if x2<x1          [13/8]
        neg                     ; use negative value           [10]
        sub     e               ; compare with size 1          [5]
        ret                     ; return result                [11]
.other:
        sub     c               ; compare with size 1          [5]
        ret                     ; return result                [11]

BoxCollisionCheckTop:
        ld d,2
        jp BoxCollisionCheck2
BoxCollisionCheck:
        ld d,0
BoxCollisionCheck2:
        ld      a,(spritePositionBox+1)  ; read player x-coordinate          [14]
        add     2       ; add offset for smaller rectangle  [8]
        ld      b,a     ;                                   [5]
        ld      c,12    ; set the width of the player       [8]
        
        ld      a,(ix+1)    ; read enemy x-coordinate           [21]
        add     2       ; add offset for smaller rectangle  [21]
        ld      e,12    ; set the width of the enemy        [21]

        call    .check  ;                                   [18]
        ret     nc      ;                                   [12/6]

        ld      a,(spritePositionBox)  ; read player y-coordinate          [14]
        sub d
        ld      b,a     ;                                   [5]
        ld      c,16    ; set the height of the player      [8]
        
        ld      a,(ix+0)    ; read enemy y-coordinate           [21]
        ld      e,16    ; set the height of the box      [21]
.check:
        sub     b               ; calculate x2-x1              [5]
        jr      nc,.other       ; don't jump if x2<x1          [13/8]
        neg                     ; use negative value           [10]
        sub     e               ; compare with size 1          [5]
        ret                     ; return result                [11]
.other:
        sub     c               ; compare with size 1          [5]
        ret                     ; return result                [11]


PlatformCollisionCheck:
        ld      a,(px)  ; read player x-coordinate          [14]
        add     10       ; add offset for smaller rectangle  [8]
        ld      b,a     ;                                   [5]
        ld      c,0    ; set the width of the player       [8]
        
        ld      a,(ix)    ; read enemy x-coordinate           [21]
        ld      e,20    ; set the width of the enemy        [21]

        ;jp    .check  ;                                   [18]

.check:
        sub     b               ; calculate x2-x1              [5]
        jr      nc,.other       ; don't jump if x2<x1          [13/8]
        neg                     ; use negative value           [10]
        sub     e               ; compare with size 1          [5]
        ret                     ; return result                [11]
.other:
        sub     c               ; compare with size 1          [5]
        ret                     ; return result                [11]

