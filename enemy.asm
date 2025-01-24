enemyMovement:
    
enemyMovement.E1:
    ld a,(enemy1AI)
    or a
    jp z,enemyMovement.E2
    ld hl,(spritePositionEnemy1)
    ld iy,enemy1Direction
    ld ix,spritePositionEnemy1
    ld e,1
    call enemyMovement1

    ld ix,$7400+32
    ld (spriteColorsSource),ix
    ld ix,$7800+64
    ld (spriteDataSource),ix
    ld hl,(enemyMovePointer)
    ld ix,spritePositionEnemy1
    ld de,(enemy1Number)
    call updateEnemyMovement

enemyMovement.E2:
    ld a,(enemy2AI)
    or a
    jp z,enemyMovement.E3
    ld hl,(spritePositionEnemy2)
    ld iy,enemy2Direction
    ld ix,spritePositionEnemy2
    ld e,2
    call enemyMovement1

    ld ix,$7400+32+32
    ld (spriteColorsSource),ix
    ld ix,$7800+64+64
    ld (spriteDataSource),ix
    ld hl,(enemyMovePointer)
    ld ix,spritePositionEnemy2
    ld de,(enemy2Number)
    call updateEnemyMovement

enemyMovement.E3:    
    ld a,(enemy3AI)
    or a
    jp z,enemyMovement.E4
    ld hl,(spritePositionEnemy3)
    ld iy,enemy3Direction
    ld ix,spritePositionEnemy3
    ld e,3
    call enemyMovement1

    ld ix,$7400+32+64
    ld (spriteColorsSource),ix
    ld ix,$7800+64+128
    ld (spriteDataSource),ix
    ld hl,(enemyMovePointer)
    ld ix,spritePositionEnemy3
    ld de,(enemy3Number)
    call updateEnemyMovement

enemyMovement.E4:
    ld a,(enemy4AI)
    or a
    jp z,enemyMovement.E5
    ld hl,(spritePositionEnemy4)
    ld iy,enemy4Direction
    ld ix,spritePositionEnemy4
    ld e,4
    call enemyMovement1

    ld ix,$7400+32+96
    ld (spriteColorsSource),ix
    ld ix,$7800+64+192
    ld (spriteDataSource),ix
    ld hl,(enemyMovePointer)
    ld ix,spritePositionEnemy4
    ld de,(enemy4Number)
    call updateEnemyMovement

enemyMovement.E5:
    ld a,(enemy5AI)
    or a
    jp z,enemyMovement.E6
    ld hl,(spritePositionEnemy5)
    ld iy,enemy5Direction
    ld ix,spritePositionEnemy5
    ld e,5
    call enemyMovement1

    ld ix,$7400+32+128
    ld (spriteColorsSource),ix
    ld ix,$7800+64+256
    ld (spriteDataSource),ix

    ld hl,(enemyMovePointer)
    ld ix,spritePositionEnemy5
    ld de,(enemy5Number)
    call updateEnemyMovement

enemyMovement.E6:
    ld a,(enemy6AI)
    or a
    jp z,enemyMovement.end
    ld hl,(spritePositionEnemy6)
    ld iy,enemy6Direction
    ld ix,spritePositionEnemy6
    ld e,6
    call enemyMovement1

    ld ix,$7400+32+160
    ld (spriteColorsSource),ix
    ld ix,$7800+64+320
    ld (spriteDataSource),ix
    ld hl,(enemyMovePointer)
    ld ix,spritePositionEnemy6
    ld de,(enemy6Number)
    call updateEnemyMovement

enemyMovement.end:
    ld (enemyMovePointer),hl 
    ret

enemyMovement1:
    ld c,a
    ; enemy wait
    ld a,(iy+3)
    or a
    jp nz,enemyWaitState
    ld a,c

    cp 1
    jp z,enemyMovementAI1 ; left/right
    cp 2
    jp z,enemyMovementAI2 ; up/down
    cp 3
    jp z,enemyMovementAI3 ; left/right nadat sleutels gehaald zijn
    cp 4
    jp z,enemyMovementAI4 ; up/down nadat sleutels gehaald zijn
    cp 5
    jp z,enemyMovementAI5 ; floorwalker
    cp 6
    jp z,enemyMovementAI6 ; walk and wait
    cp 7
    jp z,enemyMovementAI7 ; sudden run
    cp 8
    jp z,enemyMovementAI8 ; up/down enemy 2
    cp 9
    jp z,enemyMovementAI9 ; left/right bij switch on
    cp 10
    jp z,enemyMovementAI10 ; up/down bij switch on
    cp 11
    jp z,enemyMovementAI11 ; left right enemy 2

    cp 98 ; boss
    jp z,enemyMovementAIBoss ;
    cp 99 ; bubble
    jp z,enemyMovementAIBubble ;

    ret

enemyWaitState:
    dec a
    ld (iy+3),a
    
    ret

enemyMovement2:
    ld a,(iy)
    cp left
    jp z,moveEnemyLeft
    cp down
    jp z,moveEnemyDown
    cp right
    jp z,moveEnemyRight
    cp up
    jp z,moveEnemyUp

    ret

updateEnemyMovement:
    ld a,(iy+5) ; movecounter
    inc a
    ld (iy+5),a
    cp 5
    ret nz

    xor a
    ld (iy+5),a
updateEnemyMovement2:
    ld a,(iy+2) ; enemy dood?
    or a
    jp nz,enemyDead

    ld a,(hl)
    cp 255
    call z,enemyMovePointerReset
    push hl

    ld bc,0

    ld a,(iy+1)
    cp 8
    jp z,updateEnemyMovement4
    cp 11
    jp z,updateEnemyMovement4
    cp 99
    jp z,updateEnemyMovement4

    ld a,(iy)
    cp left
    jp nz,updateEnemyMovement3

updateEnemyMovement4:
    ld bc,3*32
updateEnemyMovement3:
    ld a,(hl)
    ld h,d ; de = enemy pointer
    ld l,e
    add hl,bc ; bc = left or right
    ld b,h ; hl = move 1,2,3
    ld c,l
    call setEnemySprites

    pop hl
    inc hl
    ret

enemyMovePointerReset:
    ld hl,enemyMove
    ld a,(hl)
    ret

enemyMovementAI1:
    ; check right
    ld de,((9) & #00ff) + ((16) << 8)
    add hl,de
    call checkTileEnemy
    call checkObjectSurroundingsBlocker
    jp z,changeEnemyDirection

    ld l,(ix)
    ld h,(ix+1)
    ; check left
    ld de,((9) & #00ff) + ((0) << 8)
    add hl,de
    call checkTileEnemy
    call checkObjectSurroundingsBlocker
    jp z,changeEnemyDirection

    call BoxCollisionCheck
    jp c,changeEnemyDirection

    jp enemyMovement2

enemyMovementAI2:
    ; check up
    dec h
    dec h
    ld de,((0) & #00ff) + ((8) << 8)    
    add hl,de
    call checkTileEnemy
    call checkPlayerSurroundingsFallBlocker
    jp z,changeEnemyDirection


    ld l,(ix)
    ld h,(ix+1)
    ld de,((16) & #00ff) + ((8) << 8)    
    add hl,de
    call checkTileEnemy
    call checkPlayerSurroundingsFallBlocker
    jp z,changeEnemyDirection

    jp enemyMovement2

enemyMovementAI8:
    jp enemyMovementAI2

enemyMovementAI11:
    jp enemyMovementAI1

enemyMovementAI3:
    ld a,(keysLeft)
    or a
    ret nz
    jp enemyMovementAI1

enemyMovementAI4:
    ld a,(keysLeft)
    or a
    ret nz
    jp enemyMovementAI2

enemyMovementAI5:
    ; check floortype
    push hl
    ld d,8
    ld e,18
    add hl,de
    call checkTileEnemy
    call checkPlayerSurroundingsFallBlocker
    pop hl
    jp nz,changeEnemyDirection
    
    jp enemyMovementAI1

; princess movements and help text
enemyMovementAI6:
    ld a,r
    srl a
    srl a
    srl a
    cp 2
    call z,enemyMovementAI6_change
    ld a,(iy+3)
    cp 2
    jp z,enemyMovementAI1

    ld a,(spritePositionEnemy6)    
    sub 16
    ld (spritePositionHelp),a
    ld (spritePositionHelp+4),a
    ld (spritePositionHelp+8),a
    ld (spritePositionHelp+12),a

    ld a,(spritePositionEnemy6+1)
    sub 16
    ld (spritePositionHelp+1),a
    ld (spritePositionHelp+5),a
    add 16
    ld (spritePositionHelp+9),a
    ld (spritePositionHelp+13),a

    ret

enemyMovementAI6_change:
    ld a,r
    srl a
    srl a
    srl a
    srl a
    ld (iy+3),a ; ai state
    ret

enemyMovementAI7:
    ld a,(ix)
    ld b,a
    ld a,(py)
    sub b
    or a ; equal height?
    ld a,false 
    jp nz,enemyMovementAI7.continue ; if not, goto normal pace
    
    ld a,(px) ; x
    ld b,a
    ld a,(ix+1)
    ld e,64
    call enemyMovementAI7.check

    ld a,false
    jp nc,enemyMovementAI7.continue

    ld a,true
enemyMovementAI7.continue:
    ld (iy+4),a
    jp enemyMovementAI5

    ret
enemyMovementAI7.check:
        sub b       
        jr nc,enemyMovementAI7.other
        neg         
        ld c,a
        ld a,(iy)
        cp left
        ld a,false
        ret z
        ld a,c
        sub e
        ret
enemyMovementAI7.other:
        ld c,a
        ld a,(iy)
        cp right
        ld a,false
        ret z
        ld a,c
        sub e
        ret


enemyMovementAI9:
    ld a,(level_switch)
    cp true
    ret nz
    jp enemyMovementAI1

enemyMovementAI10:
    ld a,(level_switch)
    cp true
    ret nz
    jp enemyMovementAI2


enemyMovementAIBoss:
    push hl
    ld a,(bossMoveCounter)
    inc a
    ld (bossMoveCounter),a
    cp 20
    call z,enemyMovementAIBoss.newAIBoss

    ld hl,(bossMovePointer)
    ld a,(hl)
    pop hl

    cp 1
    jp z,enemyMovementAI1
    cp 2
    jp z,enemyWait
    cp 3
    jp z,enemyJump
    cp 4
    jp z,enemyShootBubble1
    cp 5
    jp z,enemyShootBubble2
    cp 6
    jp z,enemyShootBubble3
    cp 7
    jp z,enemyShootBubble4

    ret

.newAIBoss:
    xor a
    ld (bossMoveCounter),a

    ld hl,(bossMovePointer)
    inc hl
    ld (bossMovePointer),hl
    ld a,(hl)
    cp 255
    jp z,enemyMovementAIBoss.newAIBossReset
    ret

.newAIBossReset
    ld hl,bossMoveTable
    ld (bossMovePointer),hl
    ret

enemyWait
    ld a,left
    ld (iy),a
    ret

bossMoveTable:
    ;db 1,3,4,255
    db 1,1,1,1,3,4,5,1,1,1,1,1,3,3,6,7,2,1,1,1,1,3,255

enemyMovementAIBubble:
    push hl
    ld hl,bubbleDIV2
    dec e
    dec e
    ld d,0
    add hl,de
    ld a,(hl)
    dec a
    ld (hl),a
    or a
    call z,enemyMovementAIBubble2
    dec (ix+1)    
    dec (ix+5)
    dec (ix+1)    
    dec (ix+5)

    ld a,(ix+1)
    or a
    call z,enemyDeadEnd
    pop hl
    ret

enemyMovementAIBubble2:
    dec (ix)
    dec (ix+4)
    dec (ix)
    dec (ix+4)

    ld a,(ix)
    or a
    call z,enemyDeadEnd

    push hl
    ld hl,bubbleDIV
    ld d,0
    add hl,de
    ld a,(hl)
    pop hl
    ld (hl),a
    ret

changeEnemyDirection:
    ld a,(iy+3); ai state
    or a
    jp nz,changeEnemyDirection2
    
    ld a,r
    srl a
    ld (iy+3),a ; ai state ; wait

changeEnemyDirection2:
    ld a,(iy)
    cp left
    jp z,changeEnemyDirectionRight
    cp down
    jp z,changeEnemyDirectionUp
    cp right
    jp z,changeEnemyDirectionLeft
    cp up
    jp z,changeEnemyDirectionDown

    ; turn around sprite
    ld a,4 ; framerate movements
    ld (iy+5),a ; movecounter

    jp enemyMovement2


changeEnemyDirectionUp:
    ld a,up
    ld (iy),a
    jp enemyMovement2
changeEnemyDirectionRight:
    ld a,right
    ld (iy),a
    jp enemyMovement2
changeEnemyDirectionLeft:
    ld a,left
    ld (iy),a
    jp enemyMovement2
changeEnemyDirectionDown:
    ld a,down
    ld (iy),a
    jp enemyMovement2

enemyJump:
    ld hl,(enemyJumpPosition)
    ld a,(hl)
    inc hl
    ld (enemyJumpPosition),hl

    cp 255
    jp z,enemyJumpReset
    ld b,a

    ld a,(ix)
    add b
    ld (ix),a
    ld (ix+4),a

    ld a,left
    ld (iy),a
    ret

enemyJumpReset:
    ld hl,enemyJumpTable
    ld (enemyJumpPosition),hl

    jp enemyMovementAIBoss.newAIBoss
    ret

enemyJumpTable:
    db -4,-4,-4,-4,-2,-2,0,0,0,0,0,0,0,2,2,4,4,4,4,255


enemyShootBubble1:
    ld a,(enemy2AI)
    cp 99
    ret z

    ld bc,sfx_shoot
    call ttsfx_start

    ld a,99 ; bubble shoot
    ld (enemy2AI),a
    ld ix,spritePositionEnemy2
    push iy
    ld iy,bubbleDIV
    call enemyShoot
    pop iy
    ret

enemyShootBubble2:
    ld a,(enemy3AI)
    cp 99
    ret z

    ld bc,sfx_shoot
    call ttsfx_start

    ld a,99 ; bubble shoot
    ld (enemy3AI),a
    ld ix,spritePositionEnemy3
    push iy
    ld iy,bubbleDIV+1
    call enemyShoot
    pop iy
    ret

enemyShootBubble3:
    ld a,(enemy4AI)
    cp 99
    ret z

    ld bc,sfx_shoot
    call ttsfx_start

    ld a,99 ; bubble shoot
    ld (enemy4AI),a
    ld ix,spritePositionEnemy4
    push iy
    ld iy,bubbleDIV+2
    call enemyShoot
    pop iy
    ret

enemyShootBubble4:
    ld a,(enemy5AI)
    cp 99
    ret z

    ld bc,sfx_shoot
    call ttsfx_start

    ld a,99 ; bubble shoot
    ld (enemy5AI),a
    ld ix,spritePositionEnemy5
    push iy
    ld iy,bubbleDIV+3
    call enemyShoot
    pop iy
    ret

enemyShoot:
    ld a,(spritePositionEnemy1)
    and %11111110
    ld (ix),a
    ld (ix+4),a

    ld a,(spritePositionEnemy1+1)
    and %11111110
    ld (ix+1),a
    ld (ix+5),a
    
    ; dx en dy tussen player en enemy
    ; dy bepalen
    ; dy =abs(enemy y - player y)
    ; dx = abs(enemy x - player x)
    ; y-change = dx-dy
    ld a,(py)    
    ld b,a
    ld a,(spritePositionEnemy1)
    sub b ; a contains dy
    ld c,a

    ld a,(px)    
    ld b,a
    ld a,(spritePositionEnemy1+1)
    sub b ; a contains dx
    ld e,a

    call Div8

    or a
    call z,enemyShoot2
    ld (iy),a
    ld (iy+6),a ; bubbleDiv2

    ret

enemyShoot2:
    ld a,1
    ret 

;
; Divide 8-bit values
; In: Divide E by divider C
; Out: A = result, B = rest
;
Div8:
    xor a
    ld b,8
Div8_Loop:
    rl e
    rla
    sub c
    jr nc,Div8_NoAdd
    add a,c
Div8_NoAdd:
    djnz Div8_Loop
    ld b,a
    ld a,e
    rla
    cpl
    ret

moveEnemyLeft:
    ld a,(iy+4)
    cp true
    jp nz,moveEnemyLeft2
    dec (ix+1); double speed
    dec (ix+5)
moveEnemyLeft2:    
    dec (ix+1)
    dec (ix+5)
    ret

moveEnemyRight:
    ld a,(iy+4)
    cp true
    jp nz,moveEnemyRight2
    inc (ix+1) ; double speed
    inc (ix+5)
moveEnemyRight2:    
    inc (ix+1) 
    inc (ix+5)
    ret

moveEnemyUp:
    ld a,(iy+4)
    cp true
    jp nz,moveEnemyUp2
    dec (ix) ; y pos
    dec (ix+4)
moveEnemyUp2:    
    dec (ix) ; y pos
    dec (ix+4)
    ret

moveEnemyDown:
    ld a,(iy+4)
    cp true
    jp nz,moveEnemyDown2
    inc (ix) ; y pos
    inc (ix+4)
moveEnemyDown2:
    inc (ix) ; y pos
    inc (ix+4)
    ret

; HL = check posistion (x en y)
checkTileEnemy:
    ld a,l
    ld c,h
    ld hl,map
    srl c
    srl c
    srl c
    ld d,0
    ld e,c ; x coordinate (divided by 8)

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


; hl points to enemyXDead
killEnemy:
    ld a,(hl)
    or a
    ret nz ; enemy already dying

    ld a,true
    ld (hl),a

    push bc
    push hl
    ld bc,sfx_enemydead
    call ttsfx_start
    pop hl
    pop bc

    ret

enemyDead:
    inc a
    cp 8
    ld (iy+2),a
    jp z,enemyDeadEnd
    and %00000011
    or a
    jp z,enemyDeadExplosion1
    cp 1
    jp z,enemyDeadExplosion2
    cp 2
    jp z,enemyDeadExplosion3
    cp 3
    jp z,enemyDeadExplosion2

    ret
    
enemyDeadEnd:
    xor a
    ld (iy+1),a ; enemyAI  resetten, echt dood

    ld a,212
    ld (ix),a
    ld (ix+4),a

    ret

enemyDeadExplosion1:
    push hl

    ld a,3
    ld hl,(spriteColorsSource)
    call SetVramWrite
    ld hl,spriteColorsExplosion
    ld bc,((#98) & #00ff) + ((32) << 8)
    otir

    ld a,3
    ld hl,(spriteDataSource)
    call SetVramWrite
    ld  hl,spriteDataExplosion
    ld bc,((#98) & #00ff) + ((64) << 8)
    otir
    pop hl
    ret

enemyDeadExplosion2:
    ld a,3
    ld hl,(spriteColorsSource)
    call SetVramWrite
    ld hl,spriteColorsExplosion+32
    ld bc,((#98) & #00ff) + ((32) << 8)
    otir

    ld a,3
    ld hl,(spriteDataSource)
    call SetVramWrite
    ld  hl,spriteDataExplosion+64
    ld bc,((#98) & #00ff) + ((64) << 8)
    otir
    pop hl
    ret

enemyDeadExplosion3:
    push hl
    ld a,3
    ld hl,(spriteColorsSource)
    call SetVramWrite
    ld hl,spriteColorsExplosion+64
    ld bc,((#98) & #00ff) + ((32) << 8)
    otir

    ld a,3
    ld hl,(spriteDataSource)
    call SetVramWrite
    ld  hl,spriteDataExplosion+128
    ld bc,((#98) & #00ff) + ((64) << 8)
    otir
    pop hl
    ret

enemyMove:
    db 0,32,64,32,255
