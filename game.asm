gameStart:
    ; zet vaste waarden
    ld a,0
    ld (isrCounter),a
    ld (playerIsDead),a
    ld (upBlocked),a
    ld (downBlocked),a
    ld (leftBlocked),a
    ld (rightBlocked),a
    ld (isrTimer),a
    ld (playerIsDead),a
    ld (playerJumpBoolean),a
    ld (cldy),a
    ld (levelCompleted),a
    ld (playerInvincible),a
    ld (playerReverse),a
    ld (boxmove),a
    ld (boxmoveCounter),a
    ld (spikeCounter),a
    ld (playerMoveCounter),a
    ld (playerSpaceTriggered),a
    ld (playerIceLeft),a
    ld (playerIceRight),a

    ld hl,bossMoveTable
    ld (bossMovePointer),hl
    ld hl,playerJumpTable
    ld (playerJumpPosition),hl

    ld hl,enemyJumpTable
    ld (enemyJumpPosition),hl

    ld hl,enemyMove
    ld (enemyMovePointer),hl
    ld hl,animationSpace
    ld (animationPos),hl
    ld hl,spikeSpace
    ld (spikePos),hl

    ld hl,spriteColors+32
    ld (spriteColorsSource),hl
    ld hl,spriteData+64
    ld (spriteDataSource),hl
    ld hl,playerMove
    ld (playerMovePointer),hl
    ld a,0
    ld (playerFall),a

    ld a,right
    ld (playerDirection),a

    call disscr
    call clearSprites
    call resetScreen

    ld hl,(colorSetPointer)
    call SetPalette

    ld a,0
    ld b,255
    ld de,animationSpace
    call fillRam

    ld a,0
    ld de,spikeSpace
    ld b,64
    call fillRam

    ld a,(playerLives)
    cp 0
    jp z,gameOver

    ; stage init
    call writeLevelTitle    

    ld hl,txt_worldOrg
    call writeText

    ld hl,txt_livesOrg
    call writeText

    ld hl,txt_highOrg
    call writeText
    call writeHighScore

    ld d,136
    ld e,80
    ld a,(playerWorld)
    add a,48
    call writeLetter
    ld d,168
    ld e,80
    ld a,(playerStage)
    add a,48
    call writeLetter

    ld a,148
    ld (ledx),a
    ld a,88
    ld (ledy),a
    call writeLifes2

    ld bc,(defaultTime)
    ld (playerTime),bc

    call enascr

    ld b,100
    call wait

    call disscr

    call resetScreen

    ld hl,StatusbarOrg
    call DoCopy

    call writeTime
    call writeScore
    call writeLifes

    call generateMap
    call setupMapObjects


    ld a,(keysLeft)
    ld (keysInMap),a
    call writeKeysInMap
    call writeKeysFound

    ld a,0
    ld bc,0
    call setPlayerSprites
    call updateHelpSprites



    di
    ld hl,isr    
    call setInterrupt

    ld  hl,song_world1
	call    replay_loadsong
    ei

    call enemyMovement
    call enascr

main:
    ld b,7              ; F5
    call readKey
    bit 1,a
	call z,setPlayerIsDead

    ld b,6              ; F1
    call readKey
    bit 5,a
	call z,doPause

	IFDEF	CHEATMODE
    ld b,7              ; F4
    call readKey
    bit 0,a
	call z,setLevelComplete
    ENDIF

    ; check collisions with player
    ld ix,spritePositionEnemy1
    call EnemyCollisionCheck 
    ld hl,enemy1Dead    
    jp c,playerCollision

    ld ix,spritePositionEnemy2
    call EnemyCollisionCheck
    ld hl,enemy2Dead    
    jp c,playerCollision

    ld ix,spritePositionEnemy3
    call EnemyCollisionCheck
    ld hl,enemy3Dead    
    jp c,playerCollision

    ld ix,spritePositionEnemy4
    call EnemyCollisionCheck
    ld hl,enemy4Dead
    jp c,playerCollision

    ld ix,spritePositionEnemy5
    call EnemyCollisionCheck
    ld hl,enemy5Dead
    jp c,playerCollision
    
    ld ix,spritePositionEnemy6
    call EnemyCollisionCheck
    ld hl,enemy6Dead
    jp c,playerCollision

    ld a,(playerIsDead)
    cp true
    jp z,playerDead

    ld a,(levelCompleted)
    cp true
    jp z,doLevelCompleted

    ; animate the tiles once in a while
    ld a,(mainCounter)
    inc a
    ld (mainCounter),a
    and %00001111
    cp 8
    call z,animateTiles

    call animateSpikes
    call updateBox

    ld a,(cageFall)
    cp true
    call z,doCageFall

	halt    
	jp main

doPass:
    ld a,(joyStickValueY)
    cp down
    ret nz
    ld a,0
    ld (joyStickValueY),a


    ld	bc,sfx_pause
    call	ttsfx_start
    
    call disableSprites
    call resetInterrupt2

	ld hl,isrMusic
	call setInterrupt

    ld iy,txt_passOrg
    call setTextBar

    ld hl,txt_passOrg
    call writeText
    ld hl,txt_pass
    call writeText
    ld b,10
    call wait

doPass2:    
    halt
    call checkTrigger    
    jp nz,doPass2

    jp doPause3

doPause:
    ld	bc,sfx_pause
    call	ttsfx_start

    call disableSprites
    
    call resetInterrupt2

	ld hl,isrMusic
	call setInterrupt

    ld iy,txt_pause
    call setTextBar

    ld hl,txt_pause
    call writeText

    ld b,10
    call wait


doPause2:    
    ld b,6              ; F1
    call readKey
    bit 5,a
    halt
    jp nz,doPause2
doPause3:
    ld b,10
    call wait

    call enableSprites

    call removeTextBar

    ld hl,isr
    call setInterrupt
    
    call replay_resume

    ret

isrMusic:
    call music
    ret

isr:
    call updateAllSprites        
    call movePlatform

    call music
    

    ld a,(isrCounter)
    cp 11
    call z,resetIsrCounter
    inc a
    ld (isrCounter),a

    ld a,(isrCounter)
    bit 0,a
    call z,playerMovement

    ld a,(isrCounter)
    bit 0,a
    call nz,enemyMovement

    call timer

    ret

music:
    in	a,(0x99)
	call	replay_play			; calculate next output
    call	ttsfx_play                
	call	replay_route		; first outout data        
    ret

movePlatform:
    ld a,(isrCounter)
    bit 0,a
    ret z

    ld a,(level_switch)
    cp false
    ret z

    call movePlatform1
    call movePlatform2
    ret

movePlatform1:
    ld a,(platform1X)
    cp 0
    ret z

    ld a,(platform1Wait)
    cp 0
    jp z,movePlatform1b
    dec a
    ld (platform1Wait),a
    ret
movePlatform1b:
    ld a,(platform1Move)
    cp left
    jp z,movePlatformLeft
    jp movePlatformRight

movePlatform2:
    ld a,(platform2Y)
    cp 0
    ret z

    ld a,(platform2Wait)
    cp 0
    jp z,movePlatform2b
    dec a
    ld (platform2Wait),a
    ret
movePlatform2b:
    ld a,(platform2Move)
    cp up
    jp z,movePlatformUp
    jp movePlatformDown


movePlatformLeft:
    ld hl,(platform1Y)
    dec h
    ld d,0
    ld e,0
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    jp z,movePlatformToRight

    ld a,(platform1X)
    dec a
    ld (platform1X),a
    ld (pf1dx),a
    add a,16
    ld (p1rdx),a
    ld (p1rsx),a

    ld a,(playerOnPlatform)
    cp true
    jp nz,movePlatformLeft2

    ;call checkJoyStick
    ld a,(joyStickValueX)
    cp right
    jp z,movePlatformLeft2
    
    ; check linksboven
    ld hl,(spritePositionPlayer)
    ld d,0
    ld e,7
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    jp z,movePlatformLeft2

    ; check linksonder
    ld hl,(spritePositionPlayer)
    ld d,0
    ld e,15
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    jp z,movePlatformLeft2

    ld a,(spritePositionPlayer+1)
    dec a
    ld (spritePositionPlayer+1),a
    ld (spritePositionPlayer+5),a

movePlatformLeft2:
    ld hl,platform1
    call DoCopy

    ld hl,platform1Recover
    call DoCopy

    ret

movePlatformRight:
    ld hl,(platform1Y)
    ld d,16
    ld e,0
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    jp z,movePlatformToLeft
    
    ld a,(platform1X)
    inc a
    ld (platform1X),a
    ld (pf1dx),a
    dec a
    ld (p1rdx),a ; recovery
    ld (p1rsx),a ; recovery


    ld a,(playerOnPlatform)
    cp true
    jp nz,movePlatformRight2

    ld a,(joyStickValueX)
    cp left
    jp z,movePlatformRight2

    ; check rechtboven
    ld hl,(spritePositionPlayer)
    ld d,16
    ld e,7
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    jp z,movePlatformRight2

    ; check rechtsonder
    ld hl,(spritePositionPlayer)
    ld d,16
    ld e,15
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    jp z,movePlatformRight2

    ld a,(spritePositionPlayer+1)
    inc a
    ld (spritePositionPlayer+1),a
    ld (spritePositionPlayer+5),a

movePlatformRight2:
    ld hl,platform1
    call DoCopy

    ld hl,platform1Recover
    call DoCopy

    ret

movePlatformUp:
    ld hl,(platform2Y)
    ld d,0
    ld e,0
    add hl,de
    call checkTile
    cp tile_blockPlatform
    jp z,movePlatformToDown

    ld a,(platform2Y)
    dec a
    ld (platform2Y),a
    ld (pf2dy),a
    add a,8
    ld (p2rdy),a
    ld (p2rsy),a

    ld a,(playerOnPlatform2)
    cp true
    jp nz,movePlatformUp2

    ld a,(spritePositionPlayer)
    dec a
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a

    ; dodelijk?
    ; check linksboven voor springen
    ld hl,(spritePositionPlayer)
    ld d,12
    ld e,4
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    call z,setPlayerIsDead
    ld hl,(spritePositionPlayer)
    ld d,4
    ld e,4
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    call z,setPlayerIsDead

movePlatformUp2:
    ld hl,platform2
    call DoCopy

    ld hl,platform2Recover
    call DoCopy


    ret


movePlatformDown:
    ld hl,(platform2Y)
    ld d,1
    ld e,9
    add hl,de
    call checkTile
    cp tile_blockPlatform
    jp z,movePlatformToUp

    ld hl,(platform2Y)
    ld d,1
    ld e,9
    add hl,de
    call checkTile
    call checkPlayerSurroundingsBlocker
    jp z,movePlatformToUp

    ld a,(platform2Y)
    ld (p2rdy),a
    ld (p2rsy),a
    inc a
    ld (platform2Y),a
    ld (pf2dy),a

    ld a,(playerOnPlatform2)
    cp true
    jp nz,movePlatformDown2

    ld a,(spritePositionPlayer)
    inc a
    ld (spritePositionPlayer),a
    ld (spritePositionPlayer+4),a

movePlatformDown2:
    ld hl,platform2
    call DoCopy

    ld hl,platform2Recover
    call DoCopy

    ret

movePlatformToLeft:
    ld a,left
    ld (platform1Move),a
    ld a,5
    ld (platform1Wait),a
    ret

movePlatformToRight:
    ld a,right
    ld (platform1Move),a
    ld a,5
    ld (platform1Wait),a
    ret

movePlatformToUp:
    ld a,up
    ld (platform2Move),a
    ld a,5
    ld (platform2Wait),a
    ret

movePlatformToDown:
    ld a,down
    ld (platform2Move),a
    ld a,5
    ld (platform2Wait),a
    ret



resetIsrCounter:
    ld hl,isrInvincible
    inc (hl)
    ld hl,isrReverse
    inc (hl)

    ld a,(playerInvincible)
    cp true
    call z,doPlayerInvisible

    ld a,(playerReverse)
    cp true
    call z,doPlayerReverse

    ld a,255
    ret

timer:
    ld a,(isrTimer)
    inc a
    ld (isrTimer),a
    cp 50
    ret nz

    ld a,(playerIsDead)
    cp true
    ret z

    or a
    ld de,1
    ld hl,(playerTime)
    sbc hl,de
    ld (playerTime),hl
    jp s,setPlayerIsDead
    call writeTime

    ld a,0
    ld (isrTimer),a

    ret

updateBox:
    ld a,(spritePositionBox)
    cp 218
    ret z

    call checkBoxUnderGround

    ld a,(boxmoveCounter)
    cp 0
    ret z
    dec a
    ld (boxmoveCounter),a

    ld a,(boxmove)
    cp left
    jp z,updateBoxLeft
    cp right
    jp z,updateBoxRight
    cp down
    jp z,updateBoxDown

    ret

updateBoxLeft:
    ld a,(spritePositionBox+1) ; xpos
    dec a
    dec a
    ld (spritePositionBox+1),a
    ld (spritePositionBox+5),a

    ld ix,spritePositionPlayer
    call BoxCollisionCheck 
    jp c,playerUp
    
    call boxEnemyCollision
    ret
updateBoxRight:
    ld a,(spritePositionBox+1) ; xpos
    inc a
    inc a
    ld (spritePositionBox+1),a
    ld (spritePositionBox+5),a

    ld ix,spritePositionPlayer
    call BoxCollisionCheck 
    jp c,playerUp

    call boxEnemyCollision
    ret
updateBoxDown:
    ld a,(spritePositionBox) ; xpos
    inc a
    inc a
    ld (spritePositionBox),a
    ld (spritePositionBox+4),a

    call boxEnemyCollision
    ret

boxEnemyCollision:
    ld ix,spritePositionEnemy1
    call BoxCollisionCheck 
    ld hl,enemy1Dead    
    call c,killEnemy

    ld ix,spritePositionEnemy2
    call BoxCollisionCheck 
    ld hl,enemy2Dead    
    call c,killEnemy

    ld ix,spritePositionEnemy3
    call BoxCollisionCheck 
    ld hl,enemy3Dead    
    call c,killEnemy

    ld ix,spritePositionEnemy4
    call BoxCollisionCheck 
    ld hl,enemy4Dead    
    call c,killEnemy

    ld ix,spritePositionEnemy5
    call BoxCollisionCheck 
    ld hl,enemy5Dead    
    call c,killEnemy

    ld ix,spritePositionEnemy6
    call BoxCollisionCheck 
    ld hl,enemy6Dead    
    call c,killEnemy
    ret


resetScreen:    
    ld a,0
    ld (mapdx),a
    ld (mapdy),a
    ld a,0
    ld (cldy),a

    ld b,212
    ld a,0
resetScreen2:
    push bc
    ld hl,clearLine
    call DoCopy
    ld a,(cldy)
    inc a
    ld (cldy),a
    pop bc
    djnz resetScreen2
    ret

wait:
    halt
    djnz wait
    ret

clearSprites:
    ld hl,spritePositionPlayer
    ld b,64
    ld a,216
clearSprites2
    ld (hl),a
    inc hl
    inc hl
    inc hl
    inc hl
    djnz clearSprites2

	ld	hl,spritePositionPlayer
	ld	de,$7600
	ld	bc,255 ; 3 player sprites + 3*2 enemie sprites
	ld	a,3
    call	CopyRamVram
    ret



updateAllSprites:
    ld a,(isrCounter)
    bit 0,a
    jp z,updateAllSprites2
updateAllSprites3:
    ld a,3
    ld  hl,$7600
    call SetVramWrite
    ld hl,spritePositionPlayer
    ld b,32  ;(2 (player) + 12 (enemies) + 2 (box) + 2 (help) )  *  4
    ld c,$98
    otir

    ld a,3
    ld  hl,$7400
    call SetVramWrite
    ld hl,spriteColors
	ld b,128
    ld c,$98
    otir

    ld a,3
    ld hl,$7800
    call SetVramWrite
    ld  hl,spriteData
	ld	b,0 
    ld c,$98
    otir

    ret
updateAllSprites2:
    ld a,3
    ld  hl,$7600+32
    call SetVramWrite
    ld hl,spritePositionPlayer+32
    ld b,48
    ld c,$98
    otir

    ld a,3
    ld  hl,$7400+128
    call SetVramWrite
    ld hl,spriteColors+128
	ld b,96
    ld c,$98
    otir

    ld a,3
    ld hl,$7800+256
    call SetVramWrite
    ld  hl,spriteData+256
	ld	b,192
    ld c,$98
    otir

    ret


updateBoxSprites:
    push hl
    ld	de,$79C0
	ld	bc,64
	ld	a,3
    call	CopyRamVram

    pop hl
    ld de,64
    add hl,de
	ld	de,$74E0
	ld	bc,32
	ld	a,3
    call	CopyRamVram

    ret

updateHelpSprites:
    ld hl,spriteDataHelp
    ld	de,$7A00
	ld	bc,64*2
	ld	a,3
    call	CopyRamVram

    ld hl,spriteColorsHelp
	ld	de,$7500
	ld	bc,32*2
	ld	a,3
    call	CopyRamVram
    ret


setPlayerSprites:
    ; copy sprite data and colors
    di
    ld hl,spriteColorsPlayer
    ld d,0
    ld e,a
    add hl,de
    push de
    push bc
    ld bc,32
    ld de,spriteColors
    ldir

    pop bc
    pop de

    ld hl,spriteDataPlayer
    add hl,bc    
    add hl,bc        
    add hl,de    
    add hl,de    
    ld bc,64
    ld de,spriteData
    ldir
    ei
    ret

; bc points to enemy x
setEnemySprites:
    ; copy sprite data and colors
    ld hl,(spriteColorsEnemyPointer)
    add hl,bc
    ld d,0
    ld e,a
    add hl,de
    push de
    push bc
    ld bc,32
    ld de,(spriteColorsSource) ; calculate correct target depending on enemy nr
    ldir

    pop bc
    pop de

    ld hl,(spriteDataEnemyPointer)
    add hl,bc    
    add hl,bc        
    add hl,de    
    add hl,de    
    ld bc,64
    ld de,(spriteDataSource) ; calculate correct target depending on enemy nr
    ldir

    ret


setSwitchOff:
    ld a,(level_switch_time)
    cp 0
    jp z,setSwitchOff2
    dec a
    ld (level_switch_time),a
    ret
    
setSwitchOff2:
    ld a,(playerDirection)
    cp left
    ret nz

    ld a,tile_switch_off
    ld (hl),a
    call replaceTileSwitchOff

    ld a,false
    ld (level_switch),a

    ld bc,sfx_switchoff
    call ttsfx_start

    ld a,50
    ld (level_switch_time),a
    ret

setSwitchOn:
    ld a,(level_switch_time)
    cp 0
    jp z,setSwitchOn2
    dec a
    ld (level_switch_time),a
    ret
    
setSwitchOn2:
    ld a,(playerDirection)
    cp right
    ret nz
    
    ld a,tile_switch_on
    ld (hl),a
    call replaceTileSwitchOn

    ld a,true
    ld (level_switch),a

    ld bc,sfx_switchon
    call ttsfx_start

    ld a,50
    ld (level_switch_time),a

    ret

setInitSwitchOff:
    ld a,false
    ld (level_switch),a
    ret

writeLetters:
    sub 32
    ld c,a

    srl a
    srl a
    and %00011000
    add a,193
    ld (lesy),a

    ld a,c    
    and %00011111    
    sla a
    sla a
    sla a
    ld (lesx),a

    ld hl,letters
    call DoCopy

    ld a,(ledx)
    add 8
    ld (ledx),a

    ret

writeTime:
    ld hl,(playerTime)
    ld de,playerTimeAsc
    call Num2Dec
    
    ld a,184
    ld (ledx),a
    ld a,177
    ld (ledy),a

    ld de,playerTimeAsc+2

    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    ret

writeScore:
    ld hl,(playerScore)
    ld de,playerScoreAsc
    call Num2Dec
    
    ld a,184
    ld (ledx),a
    ld a,169
    ld (ledy),a

    ld de,playerScoreAsc

    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    ret

writeHighScore:
    ld hl,(playerHighScore)
    ld de,playerHighScoreAsc
    call Num2Dec
    
    ld a,156
    ld (ledx),a
    ld a,128
    ld (ledy),a

    ld de,playerHighScoreAsc

    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    ret

writeLifes:
    ld a,80
    ld (ledx),a
    ld a,177
    ld (ledy),a
writeLifes2:
    ld a,(playerLives)
    ld h,0
    ld l,a
    ld de,playerLivesAsc
    call Num2Dec
    

    ld de,playerLivesAsc+3

    ld a,(de)
    call writeLetters
    inc de
    ld a,(de)
    call writeLetters
    ret

writeKeysFound:
    ld d,80
    ld e,169
    ld a,(keysLeft)    
    ld b,a
    ld a,(keysInMap)
    sub b
    add a,48
    call writeLetter
    ret

writeKeysInMap:
    ld d,96
    ld e,169
    ld a,(keysInMap)
    add a,48
    call writeLetter
    ret

writeLevelTitle:
    ld hl,(textWorldPointer)
    ld b,0
writeLevelTitle2:
    inc b
    ld a,(hl)
    inc hl
    cp 255
    jp nz,writeLevelTitle2
    dec b

    ld a,b
    sla a
    sla a
    ld c,a
    ld a,128
    sub c
    ld (ledx),a
    ld a,56
    ld (ledy),a


    ld hl,(textWorldPointer)
writeLevelTitle3:
    ld a,(hl)
    push hl
    push bc
    call writeLetters
    pop bc
    pop hl
    inc hl
    djnz writeLevelTitle3

    ret
gameOver:
    ld hl,txt_gameover
    call writeText

    ld hl,txt_continue
    call writeText
    call enascr

    call memload_intro

    ld hl,isrMusic
    call setInterrupt

	ld  hl,song_gameover
	call    replay_loadsong

    ld b,255
gameOverLoop:
    halt

    ld a,($fbec)		; F5
	bit 1,a
	jp z,gameOverContinue

    call checkTrigger
	jp nz,gameOverLoop

    ld de,colorSetTitleScreen
    ld hl,blackPalette
    call colorFader
   
    ld a,8
    call replay_fade_out
    call replay_pause

    call setHighScore
    
    call resetInterrupt

    call disscr
    jp restart

gameOverContinue
    ld de,colorSetTitleScreen
    ld hl,blackPalette
    call colorFader
    
    ld a,8
    call replay_fade_out
    call replay_pause

    ld a,(defaultLives)
    ld (playerLives),a

    ld a,0
    ld (playerStage),a

    ld a,(playerWorld)
    call setWorld

    call setHighScore

    call resetInterrupt
    jp gameStart

setHighScore:
    ld hl,(playerScore)
    ld de,(playerHighScore)
    or a ; clear carry flag
    sbc hl, de
    call nc,updateHighScore

    ld hl,0
    ld (playerScore),hl

    ret

updateHighScore:
    ld hl,(playerScore)
    ld (playerHighScore),hl
    ret

; a = extra score
addScore:
    ld e,a
    ld d,0
    ld hl,(playerScore)
    add hl,de
    ld (playerScore),hl
    call writeScore
    ret

setTextBar:
    ld a,(iy)
    sub 8
    ld (textBarX),a
    ld (stdx),a

    ld a,(iy+1)
    sub 8
    ld (textBarY),a
    ld (stdy),a
    
    call backupTextBar


    ld hl,textbar
    ld b,18
    ld c,4

setTextBarLoop:
    push bc

    ld a,(hl)
    ld c,a
	and %11100000		; bereken sy
    srl a
    srl a
    add a,128
	ld (stsy),a

	ld a,c
	and %00011111		; bereken sx
	sla a
	sla a
	sla a
	ld (stsx),a

    push hl

    ld hl,statusTiles
    call DoCopy

    ld a,(stdx)
    add a,8
    ld (stdx),a

    pop hl
    inc hl
    pop bc
    djnz setTextBarLoop

    dec c
    ld a,c
    cp 0
    ret z

    ld a,(stdy)
    add a,8
    ld (stdy),a

    ld a,(textBarX)
    ld (stdx),a

    ld b,18
    jp setTextBarLoop
    
backupTextBar:
    ld a,(textBarX)
    ld (busx),a

    ld a,(textBarY)
    ld (busy),a

    ld a,18*8
    ld (bunx),a
    ld a,40
    ld (buny),a
    
    ld hl,backupScreen
    call DoCopy

removeTextBar:
    ld a,(textBarX)
    ld (rpdx),a

    ld a,(textBarY)
    ld (rpdy),a

    ld a,18*8
    ld (rpnx),a
    ld a,40
    ld (rpny),a
    
    ld hl,repairScreen
    call DoCopy
    ret


doCageFall:
    ld b,50
    call wait

    ld a,false
    ld (cageFall),a

    ld ix,spritePositionEnemy6
    ld iy,enemy6Direction

    ld	bc,sfx_cagefall
    call	ttsfx_start

    ld b,32
doCageFall2:
    push bc

    ld hl,cage
    call DoCopy

    ld hl,cageClean
    call DoCopy

    call moveEnemyDown
    call moveEnemyDown

    ld a,(cady)
    inc a
    inc a
    ld (cady),a

    ld a,(cacdy)
    inc a
    inc a
    ld (cacdy),a
    ld (cacsy),a

    pop bc
    halt

    djnz doCageFall2
    

    ld a,0
    ld (enemy6AI),a ; enemyAI princes stilstaan

    ld	bc,sfx_enemydead
    call	ttsfx_start

    ld hl,enemy1Dead
    call killEnemy

    ld b,50
    call wait

    call resetInterrupt2

	ld hl,isrMusic
	call setInterrupt

    ld iy,txt_endBoss1
    call setTextBar

    ld hl,txt_endBoss1
    call writeText
    ld hl,txt_endBoss2
    call writeText


    ld a,true
    ld (playerIsDead),a

    ld b,30
    call wait

doCageFall3:
    halt
    call checkTrigger
    jp nz,doCageFall3

    ld a,8
    call replay_fade_out
    ld b,30
    call wait
    call replay_pause
    call resetInterrupt

toEnding:
    call clearSprites
    jp ending
