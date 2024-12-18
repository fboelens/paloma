betweenWorlds:
    call disableSprites
    call resetScreen
    ld hl,betweenImage
    call DoCopy
    ld b,10
    call wait
    call enascr
    ld de,blackPalette
    ld hl,colorSetBetween
    call colorFader

    di
	ld hl,isrMusic
	call setInterrupt

    ld hl,song_between
    call replay_loadsong
    ei

    ld b,50
    call wait
    ld hl,txt_between1
    call writeText

    ld b,50
    call wait

    ld hl,txt_between2
    call writeText

betweenWorlds2:
    call checkTrigger
    halt
    jp nz,betweenWorlds2
    ld hl,blackPalette
    ld de,colorSetBetween
    call colorFader

    call enableSprites

    call replay_pause
    call resetInterrupt
    ret
