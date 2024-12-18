; player movement based on keys and gravity
playerMovement:
    call checkPlayerSurroundings

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

    ; ice move left
    ld a,(playerIceLeft)
    dec a
    dec a
    ld (playerIceLeft),a

    call playerLeft
    ret

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

    ld a,(playerIceRight)
    dec a
    dec a
    ld (playerIceRight),a

    call playerRight
    ret

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
    cp 0
    jp nz,playerLeft.2

    ; check linksboven
    ld hl,(spritePositionPlayer)
    ld d,2
    ld e,7
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    call z,blockLeft

    ; check linksonder
    ld hl,(spritePositionPlayer)
    ld d,2
    ld e,15
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    call z,blockLeft

    ld a,(leftBlocked)
    cp true
    ret z

    ld a,left
    ld (playerDirection),a

    ; box move?
    ld ix,spritePositionPlayer
    call BoxCollisionCheck
    jp c,setBoxLeft

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
    ld a,0
    ld (playerMoveCounter),a
    ld hl,playerMovePointer
    inc (hl)
    ret

playerLeft.3:
    jp playerJumpSpriteLeft
    ret

playerRight:
    ld a,(playerIceLeft)
    cp 0
    jp nz,playerRight.2

    ; check rechtboven
    ld hl,(spritePositionPlayer)
    ld d,14
    ld e,7
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    call z,blockRight

    ; check rechtsonder
    ld hl,(spritePositionPlayer)
    ld d,14
    ld e,15
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    call z,blockRight

    ld a,(rightBlocked)
    cp true
    ret z

    ld a,right
    ld (playerDirection),a

    ; box move?
    ld ix,spritePositionPlayer
    call BoxCollisionCheck
    jp c,setBoxRight

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
    ld a,0
    ld (playerMoveCounter),a

    ld hl,playerMovePointer
    inc (hl)

    ret;

playerRight.3:
    jp playerJumpSpriteRight
    ret

playerMovePointerReset:
    ld hl,playerMove
    ld (playerMovePointer),hl
    ld a,(hl)
    ret

playerMove:
    db 0,32,64,32,255

playerDown:
    ld a,(downBlocked)
    cp true
    ret z

    ld a,(playerOnPlatform)
    ret z
    ld a,(playerOnPlatform2)
    ret z

    ld a,(playerJumpBoolean)
    cp true
    ret z

    ; on box
    ld ix,spritePositionPlayer
    call BoxCollisionCheckTop
    jp nc,playerDown2

    ld a,(spritePositionBox)
    ld b,a
    ld a,(spritePositionPlayer)
    sub b
    jp c,blockDown
    
playerDown2:

    ld a,(spritePositionPlayer)
    ld c,a
    ld a,(playerFall)
    add a,c
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a

    ld a,true
    ld (upBlocked),a

    ld a,4
    ld (playerFall),a

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

    ld a,(upBlocked)
    cp true
    ret z

    ld a,true
    ld (playerJumpBoolean),a

    ld a,(playerDirection)
    cp right
    jp z,playerJumpSpriteRight

playerJumpSpriteLeft:
    ; jump to left sprite
    ld hl,spriteDataPlayerJumpLeft
    ld bc,64
    ld de,spriteData
    ldir

    ld hl,spriteColorsPlayerJumpRight
    ld bc,32
    ld de,spriteColors
    ldir
    ret

playerJumpSpriteRight:
    ; jump to right sprite
    ld hl,spriteDataPlayerJumpRight
    ld bc,64
    ld de,spriteData
    ldir

    ld hl,spriteColorsPlayerJumpRight
    ld bc,32
    ld de,spriteColors
    ldir
    ret

playerJump:
    ld hl,(playerJumpPosition)
    ld a,(hl)
    inc hl
    ld ( playerJumpPosition),hl


    cp 255
    jp z,playerJumpReset
    ld b,a

    ld a,(upBlocked)
    cp true
    ret z

    ld a,(spritePositionPlayer)
    add b
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a

; stop jumproutine if player is on floor tile
playerJumpEnd:
    ld a,(py)
    inc a
    inc a
    and %00000111
    cp 0
    ld a,(hl)
    ret z
    
    push hl
    ld hl,(spritePositionPlayer)
    ld d,8
    ld e,18
    add hl,de
    call checkTile
    call checkPlayerSurroundingsFallBlocker
    pop hl
    ld a,255
    ret z

    push hl
    ld hl,(spritePositionPlayer)
    ld d,8
    ld e,18
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBreakFloor
    pop hl
    ld a,255
    ret z

    ld a,(hl)
    ret

playerJumpReset:
    ld a,false
    ld (playerJumpBoolean),a
    ld hl,playerJumpTable
    ld (playerJumpPosition),hl

    ld a,(playerDirection)
    cp left
    jp z,playerJumpReset2

    ld hl,spriteDataPlayer+64
    ld bc,64
    ld de,spriteData
    ldir

    ld hl,spriteColorsPlayer+32
    ld bc,32
    ld de,spriteColors
    ldir

    ret

playerJumpReset2
    ld hl,spriteDataPlayer+256
    ld bc,64
    ld de,spriteData
    ldir

    ld hl,spriteColorsPlayer+32
    ld bc,32
    ld de,spriteColors
    ldir

    ret

playerJumpTable:
    db -4,-4,-4,-4,-4,-2,-2,-2,-2,0,0,0,0,0,0,0,0,0,255

; do all surrounding tile checks
checkPlayerSurroundings:
    ld a,false
    ld (leftBlocked),a
    ld (rightBlocked),a
    ld (upBlocked),a
    ld (downBlocked),a

    ld a,(py)
    inc a
    and %00000011
    ld c,a
    ld a,4
    sub c
    ld (playerFall),a


checkPlayerSurroundings1:
    ld a,(playerJump)
    cp true
    jp z,checkPlayerSurroundings2

    ; only check falling tiles if player is directly on one of them tiles
    ld a,(py)
    inc a
    and %00000111
    cp 0
    jp nz,checkPlayerSurroundings2

    ; check linksonder voor vallen
    ld hl,(spritePositionPlayer)
    ld d,4
    ld e,18
    add hl,de
    call checkTile
    call checkPlayerSurroundingsFallBlocker
    call z,blockDown

    ; check middenonder voor vallen
    ld hl,(spritePositionPlayer)
    ld d,8
    ld e,18
    add hl,de
    call checkTile
    ld c,a
    and %11100000
    cp 96
    call z,resetIce
    ld a,c
    call checkPlayerSurroundingsFallBlocker
    call z,blockDown

    ; check rechtsonder voor vallen
    ld hl,(spritePositionPlayer)
    ld d,12
    ld e,18
    add hl,de
    call checkTile
    call checkPlayerSurroundingsFallBlocker
    call z,blockDown

    ; check linksonder voor lopende band links
    ld hl,(spritePositionPlayer)
    ld d,12
    ld e,18
    add hl,de
    call checkTile
    call checkPlayerSurroundingsMoveLeft
    push af
    call z,autoMovePlayerLeft
    pop af

    ; check rechtsonder voor lopende band links
    ld hl,(spritePositionPlayer)
    ld d,4
    ld e,18
    add hl,de
    call checkTile
    call checkPlayerSurroundingsMoveLeft
    push af
    call z,autoMovePlayerLeft
    pop af

    ; check linksonder voor lopende band rechts
    ld hl,(spritePositionPlayer)
    ld d,4
    ld e,18
    add hl,de
    call checkTile
    call checkPlayerSurroundingsMoveRight
    push af
    call z,autoMovePlayerRight
    pop af

    ; check rechtsonder voor lopende band rechts
    ld hl,(spritePositionPlayer)
    ld d,12
    ld e,18
    add hl,de
    call checkTile
    call checkPlayerSurroundingsMoveRight
    push af
    call z,autoMovePlayerRight
    pop af

    ; check linksonder voor brekende vloer
    ld hl,(spritePositionPlayer)
    ld d,4
    ld e,18
    add hl,de
    call checkTile
    push hl
    call checkPlayerSurroundingsBreakFloor
    pop hl
    call z,breakDownFloor

    ; check rechtsonder voor brekende vloer
    ld hl,(spritePositionPlayer)
    ld d,12
    ld e,18
    add hl,de
    call checkTile
    push hl
    call checkPlayerSurroundingsBreakFloor
    pop hl
    call z,breakDownFloor

    ; check middenonder voor brekende vloer
    ld hl,(spritePositionPlayer)
    ld d,8
    ld e,18
    add hl,de
    call checkTile
    push hl
    call checkPlayerSurroundingsBreakFloor
    pop hl
    call z,breakDownFloor


checkPlayerSurroundings2:
    ; check linksboven voor springen
    ld hl,(spritePositionPlayer)
    ld d,4
    ld e,4
    add hl,de
    call checkTile
    call checkPlayerSpecialTiles
    call checkPlayerSurroundingsBlocker
    call z,blockUp

    ; check middenboven voor springen
    ld hl,(spritePositionPlayer)
    ld d,8
    ld e,4
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    call z,blockUp

    ; check rechtsboven voor springen
    ld hl,(spritePositionPlayer)
    ld d,12
    ld e,4
    add hl,de
    call checkTile
    call checkPlayerSpecialTiles
    call checkPlayerSurroundingsBlocker
    call z,blockUp

    ; check op deur en dodelijke tiles
    ld hl,(spritePositionPlayer)
    ld d,4
    ld e,2
    add hl,de
    call checkTile
    cp tile_door
    call z,checkLevelComplete

    ld hl,(spritePositionPlayer)
    ld d,8
    ld e,12
    add hl,de
    call checkTile
    call checkPlayerSpecialTiles

    ld hl,(spritePositionPlayer)
    ld d,4
    ld e,12
    add hl,de
    call checkTile
    call checkPlayerSpecialTiles

    ld hl,(spritePositionPlayer)
    ld d,12
    ld e,12
    add hl,de
    call checkTile
    call checkPlayerSpecialTiles

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
    ; player on platform?
    ld a,false
    ld (playerOnPlatform),a
    ld (playerOnPlatform2),a

    ; left/right platform
    ld a,(platform1Y)
    cp 0
    jp z,checkPlayerSurroundings3
    sub 17
    ld c,a
    ld a,(py)
    sub c
    jp nz,checkPlayerSurroundings3

    ld ix,platform1X
    call PlatformCollisionCheck
    jp nc,checkPlayerSurroundings3

    call blockDown
    ld a,true
    ld (playerOnPlatform),a
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; player on platform up/down
checkPlayerSurroundings3:
    ld a,(platform2Move)
    cp up
    jp z,checkPlayerSurroundings4
    
    ld a,(downBlocked)
    cp true
    ret z

checkPlayerSurroundings4:
    ld a,(platform2Y)
    cp 0
    ret z
    sub 19
    ld c,a
    ld a,(py)
    sub c
    and %11111000
    cp 0
    ret nz

    ld ix,platform2X
    call PlatformCollisionCheck
    ret nc

    ld a,(platform2Y)
    sub 17
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a

    call blockDown
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
    ld d,0

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
    sub 240
    jp nc,setPlayerIsDead
    ld a,c

    ret

resetIce:
    ld a,0
    ld (playerIceLeft),a
    ld (playerIceRight),a
    ret

; block a way for the player because of the tiles
blockUp:
    ld a,true
    ld (upBlocked),a
    ret
blockDown:
    ld a,true
    ld (downBlocked),a
    ret
blockLeft:
    ld a,0
    ld (playerIceLeft),a

    ld a,true
    ld (leftBlocked),a
    ret
blockRight:
    ld a,0
    ld (playerIceRight),a

    ld a,true
    ld (rightBlocked),a
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
    cp 0
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
    sub 2
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a    

    ld	bc,sfx_enemydead
    call	ttsfx_start

    call killAllEnemies

doLevelCompleted2:

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
    ld a,0
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
    call wait

    ret

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
    call	ttsfx_start

    ret
doPlayerInvisible2:
    ld hl,(colorSetPointer)
    call SetColor

    ret

setPlayerInvincible:
    ld a,0
    ld (hl),a
    call replaceTileDefault

    ld a,0
    ld (isrInvincible),a

    ld a,true
    ld (playerInvincible),a

    ret
setPlayerUnInvincible:
    ld hl,(colorSetPointer)
    call SetColor

    ld a,false
    ld (playerInvincible),a

    ret

;-------------------------------------
; extra live
;-------------------------------------
setPlayerLife:
    ld a,0
    ld (hl),a
    call replaceTileDefault

    ld	bc,sfx_heart
    call	ttsfx_start

    ld hl,playerLives
    inc (hl)
    call writeLifes

    ld a,50
    call addScore
    ret

;-------------------------------------
; reverse
;-------------------------------------
doPlayerReverse:
    ld a,(isrReverse)
    sub 25
    call ns,setPlayerUnReverse

    ret
setPlayerReverse:
    ld a,0
    ld (hl),a
    call replaceTileDefault

    ld bc,sfx_reverse
    call ttsfx_start

    ld a,0
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
    ld a,0
    ld (hl),a
    call replaceTileDefault
    
    ld	bc,sfx_key
    call	ttsfx_start
    
    ld hl,keysLeft
    dec (hl)
    ld a,(hl)
    cp 0
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
    sla a
    sla a
    sla a
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
    jp nc,blockLeft

    ; box is blocked
    ld hl,(spritePositionBox)
    ld d,0
    ld e,10
    add hl,de
    dec h
    call checkTileEnemy
    call checkObjectSurroundingsBlocker
    jp z,blockLeft
setBoxLeft2:
    ld a,(boxmoveCounter)
    cp 0
    ret nz

    ld a,left
    ld (boxmove),a
    ld a,2
    ld (boxmoveCounter),a
    ret

setBoxRight:
    ld a,(spritePositionBox)
    ld b,a
    ld a,(spritePositionPlayer)
    dec a
    sub b
    jp nc,blockRight

    ; box is blocked
    ld hl,(spritePositionBox)
    ld d,16
    ld e,10
    add hl,de
    call checkTileEnemy
    call checkObjectSurroundingsBlocker
    jp z,blockRight ; speler mag er ook niet langs

setBoxRight2
    ld a,(boxmoveCounter)
    cp 0
    ret nz

    ld a,right
    ld (boxmove),a
    ld a,2
    ld (boxmoveCounter),a
    ret

checkBoxUnderGround:
    ld a,(boxmoveCounter)
    cp 0
    ret nz
    ; check linksonder voor lopende band en brekende vloer
    ld hl,(spritePositionBox)
    ld d,12
    ld e,18
    add hl,de
    call checkTileEnemy
    call checkPlayerSurroundingsMoveLeft
    jp z,setBoxLeft2
    
    ; check linksonder voor lopende band en brekende vloer
    ld hl,(spritePositionBox)
    ld d,2
    ld e,18
    add hl,de
    call checkTileEnemy
    call checkPlayerSurroundingsMoveRight
    jp z,setBoxRight2

    ld hl,(spritePositionBox)
    ld d,2
    ld e,18
    add hl,de
    call checkTileEnemy
    push hl
    call checkPlayerSurroundingsBreakFloor
    pop hl
    jp z,breakDownFloor

    ld hl,(spritePositionBox)
    ld d,14
    ld e,18
    add hl,de
    call checkTileEnemy
    push hl
    call checkPlayerSurroundingsBreakFloor
    pop hl
    jp z,breakDownFloor

    ld hl,(spritePositionBox)
    ld d,8
    ld e,18
    add hl,de
    call checkTileEnemy
    push hl
    call checkPlayerSurroundingsBreakFloor
    pop hl
    jp z,breakDownFloor

    call setBoxDown

    ret

setBoxDown:
    ld hl,(spritePositionBox)
    ld d,0
    ld e,18
    add hl,de
    call checkTileEnemy
    call checkPlayerSurroundingsFallBlocker
    ret z

    ld hl,(spritePositionBox)
    ld d,15
    ld e,18
    add hl,de
    call checkTileEnemy
    call checkPlayerSurroundingsFallBlocker
    ret z

    ld a,(boxmoveCounter)
    cp 0
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
    ld c,a
    call blockDown
    ld a,(breakDownFloorCounter)
    inc a
    ld (breakDownFloorCounter),a
    cp 10
    ret nz
    ld a,0
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
	sla a
	sla a
	sla a
	ld (mapsx),a

    di
    ld a,(currentTileY)
    ld (mapdy),a

    ld a,(currentTileX)
    sla a
    sla a
    sla a
    ld (mapdx),a

    ld hl,maptiles
    call DoCopy
    ei
    ret

breakDownFloorBroken:
    ld a,0 ; vervangende tile    
    ld (hl),a

    call replaceTileDefault
    ret

autoMovePlayerLeft:
    call blockDown
    call playerLeft

    ret

autoMovePlayerRight:
    call blockDown
    call playerRight    

    ret

; check if player is on a breaking floor
checkPlayerSurroundingsBreakFloor:
    ld hl,mapBreakFloor
checkPlayerSurroundingsBreakFloorLoop
    cp (hl)
    ret z   ; blokkade gevonden, geeft dit terug
    inc hl
    ld c,a
    ld a,(hl)
    cp 255
    ld a,c
    jp nz, checkPlayerSurroundingsBreakFloorLoop
    cp 254
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

; check if a player is on a bandwagon to the left
checkPlayerSurroundingsMoveLeft:
    ld hl,mapMoveLeft
checkPlayerSurroundingsMoveLeftLoop:
    cp (hl)
    ret z
    inc hl
    ld c,a
    ld a,(hl)
    cp 255
    ld a,c
    jp nz, checkPlayerSurroundingsMoveLeftLoop
    cp 254
    ret

; check if a player is on a bandwagon to the right
checkPlayerSurroundingsMoveRight:
    ld hl,mapMoveRight
checkPlayerSurroundingsMoveRightLoop:
    cp (hl)
    ret z
    inc hl
    ld c,a
    ld a,(hl)
    cp 255
    ld a,c
    jp nz, checkPlayerSurroundingsMoveRightLoop
    cp 254
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

    ld hl,spriteColorsExplosion
    ld bc,32
    ld de,spriteColors
    ldir

    ld hl,spriteDataExplosion
    ld bc,64
    ld de,spriteData
    ldir

    ld b,3
    call wait

    ld hl,spriteColorsExplosion+32
    ld bc,32
    ld de,spriteColors
    ldir

    ld hl,spriteDataExplosion+64
    ld bc,64
    ld de,spriteData
    ldir

    ld b,3
    call wait

    ld hl,spriteColorsExplosion+64
    ld bc,32
    ld de,spriteColors
    ldir

    ld hl,spriteDataExplosion+128
    ld bc,64
    ld de,spriteData
    ldir

    ld b,3
    call wait

    ld hl,spriteColorsExplosion+32
    ld bc,32
    ld de,spriteColors
    ldir

    ld hl,spriteDataExplosion+64
    ld bc,64
    ld de,spriteData
    ldir

    ld b,3
    call wait

    pop bc
    djnz playerDeadAnimation

    ld a,4
    call replay_fade_out

    ld hl,spriteColorsRIP
    ld bc,32
    ld de,spriteColors
    ldir

    ld hl,spriteDataRIP
    ld bc,64
    ld de,spriteData
    ldir

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

        call    .check  ;                                   [18]
        ret     

.check:
        sub     b               ; calculate x2-x1              [5]
        jr      nc,.other       ; don't jump if x2<x1          [13/8]
        neg                     ; use negative value           [10]
        sub     e               ; compare with size 1          [5]
        ret                     ; return result                [11]
.other:
        sub     c               ; compare with size 1          [5]
        ret                     ; return result                [11]

