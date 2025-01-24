introdemo:
	call whipeLettersSpecialb
    
    di

	ld hl,isrMusic
	call setInterrupt

	ld  hl,song_intro
	call    replay_loadsong
	ei

    call whipeScreen

    ld a,false
    ld (exitDemo),a

    ld hl,txt_intro1
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    call whipeLettersSpecialb
    ld hl,colors_intro1
    call SetPalette

    call whipeLettersSpecial


    ld hl,txt_intro2
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    ld a,3 ; source
    ld (wpsy+1),a
    call whipeLettersSpecial

    ld hl,txt_intro3
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    call whipeLettersSpecial

    ld hl,txt_intro4
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    call whipeLettersSpecial

    ld hl,txt_intro5
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo


    ld de,colors_intro1
    ld hl,blackPalette
    call colorFader

    call whipeScreen

    ld hl,txt_intro6
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    call whipeLettersSpecialb

    call whipeScreen3

    ld hl,intro_princess
    call DoCopy

    ld hl,txt_intro7
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    ld de,colors_intro3
    ld hl,blackPalette
    call colorFader

    call whipeScreen3

    ld hl,intro_king_princess
    call DoCopy

    ld hl,txt_intro8
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    call whipeLettersSpecialb
    call whipeScreen3

    ld hl,intro_morgath
    call DoCopy

    ld hl,txt_intro9
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    call whipeLettersSpecialb
    call whipeScreen3

    ld hl,intro_cage
    call DoCopy

    ld hl,txt_intro10
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    ld de,colors_intro3
    ld hl,blackPalette
    call colorFader

    call disscr
    ld hl,intro_gfx2
    call DoCopy
    ld b,5
    call waitDemo
    call enascr    
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    ld hl,colors_intro2
    ld de,blackPalette
    call colorFader

    ld hl,txt_intro11
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    ld a,2 ; source
    ld (wpsy+1),a
    ld a,8
    ld (wpdy),a
    ld a,192
    ld (wpdy+4),a
    call whipeLettersSpecial

    ld hl,txt_intro12
    call writeDemo
    ld a,(exitDemo)
    cp true
    jp z,exitIntroDemo

    ld de,colors_intro2
    ld hl,blackPalette
    call colorFader

    call whipeScreen2

    ld hl,intro_hero
    call DoCopy

    ld hl,txt_intro13
    call writeDemo

    call whipeLettersSpecialb

    jp exitIntroDemo

    
exitIntroDemo:
    ld a,8
    call replay_fade_out
    call replay_pause

    call disscr
    call resetInterrupt
    ret

enddemo:
    call whipeLettersSpecialb

    di
	ld hl,isrMusic
	call setInterrupt

	ld  hl,song_extro
	call    replay_loadsong
	ei


    call whipeScreen

    ld hl,txt_extro1
    call writeDemo

    call whipeLettersSpecialb

    ld hl,txt_extro2
    call writeDemo

    call whipeLettersSpecialb

    ld hl,txt_extro3
    call writeDemo

    ld de,colors_intro2
    ld hl,blackPalette
    call colorFader

    jp exitIntroDemo


writeDemo:
    ld a,(hl)
    add a,a
    add a,a
    ld c,a
    ld a,128
    sub c
    ld (leddx),a
    ld (leddx2),a
    inc hl    
    ld a,(hl)
    ld (leddy),a
    ld (leddy2),a
    inc hl
writeDemoLoop:
    ld a,(hl)
    cp 255
    ret z
    cp 13
    call z,writeDemoNext
    cp 10
    call z,writeDemoNext2

    cp 254
    jp z,writeDemoLoop3

    sub 32    
    ld c,a

    srl a
    srl a
    and %00011000
    add a,66
    ld (ledsy),a

    ld a,c
    and %00011111
    add a,a
    add a,a
    add a,a
    ld (ledsx),a
    
    push hl
    ld hl,lettersDemo
    push bc
    call DoCopy
    pop bc
    pop hl

    ld a,(leddx)
    add a,8
    ld (leddx),a

writeDemoLoop3:
    ld b,3
    ld a,(hl)
    cp 254
    call z,writeDemoWaitLong
writeDemoLoop2:
    push bc
    halt
    call checkTrigger
    pop bc
    jp z,waitDemo2
    djnz writeDemoLoop2

    inc hl
    jp writeDemoLoop

writeDemoNext:
    ld a,(leddy)
    add a,8
    ld (leddy),a

    inc hl
    ld a,(hl)
    add a,a
    add a,a
    ld c,a
    ld a,128
    sub c
    ld (leddx),a
    inc hl
    ld a,(hl)
    ret

writeDemoNext2:
    ld a,(leddy)
    add a,16
    ld (leddy),a
    inc hl
    ld a,(hl)
    ret

writeDemoWaitLong:
    ld b,100
    ret

waitDemo:
    push bc
    halt
    call checkTrigger
    pop bc
    jp z,waitDemo2
    djnz waitDemo
    inc hl
    ld a,(hl)

    ret

waitDemo2:
    ld a,true
    ld (exitDemo),a

    ret

whipeLettersSpecial:
    ld b,16
    ld a,16
    ld c,a    
    ld (wpsx),a
    ld (wpdx),a
whipeLettersSpecial2:
    push bc
    ld hl,wipeLine
    call DoCopy

    ld a,(wpsx)
    add a,16
    ld (wpsx),a
    ld (wpdx),a
    pop bc
    djnz whipeLettersSpecial2
    dec c
    dec c
    ld a,c
    or a
    ret z
    ld (wpsx),a
    ld (wpdx),a
    ld c,a
    ld b,16
    halt    
    jp whipeLettersSpecial2

whipeLettersSpecialb:
    ld b,26
    ld a,8
    ld c,a    
    ld (cldy),a
whipeLettersSpecialb2:
    push bc
    ld hl,clearLine
    call DoCopy

    ld a,(cldy)
    add a,8
    ld (cldy),a
    pop bc
    djnz whipeLettersSpecialb2
    dec c
    ld a,c
    or a
    ret z
    ld (cldy),a
    ld c,a
    ld b,26
    halt    
    jp whipeLettersSpecialb2


whipeScreen:
    call disscr
    call resetScreen
    ld hl,colors_intro1
    call SetPalette
    call enascr    
    ret

whipeScreen2:
    call disscr
    call resetScreen
    ld hl,colors_intro4
    call SetPalette
    call enascr    
    ret

whipeScreen3:
    call disscr
    call resetScreen
    ld hl,colors_intro3
    call SetPalette
    call enascr    
    ret

intro_gfx1:
    db 0,0
	db 0,3
	db 0,0
	db 0,0
	db 0,0
	db 200,0
	db 0,0,$d0

intro_gfx2:
    db 0,0
	db 0,2
	db 0,0
	db 8,0
	db 0,0
	db 192,0
	db 0,0,$d0

intro_princess:
    db 100,0
	db 26,1
	db 118,0
	db 20,0
	db 18,0
	db 40,0
	db 0,0,$d0

intro_king_princess:
    db 0,0
	db 0,1
	db 95,0
	db 20,0
	db 66,0
	db 64,0
	db 0,0,$d0

intro_morgath:
    db 66,0
	db 0,1
	db 100,0
	db 10,0
	db 35,0
	db 64,0
	db 0,0,$d0

intro_cage:
    db 142,0
	db 0,1
	db 97,0
	db 10,0
	db 62,0
	db 64,0
	db 0,0,$d0

intro_hero:
    db 118,0
	db 0,1
	db 100,0
	db 10,0
	db 22,0
	db 64,0
	db 0,0,$d0

            //  12345678901234567890123456789012
txt_intro1: db 16,80
            db "Once upon a time",13,20
            db "in a time far beyond",13,19
            db "the reach of memory",13,29
            db "there existed a mystical land",13,32
            db "blanketed by ancient pine trees",13,20
            db "whose whispers spoke",13,17
            db "of ages past...",254,255
txt_intro2: db 30,120,254
            db "This enchanting realm was home",13,25
            db "to a kind-hearted people,",13,25
            db "whose lives intertwined",13,23
            db "harmoniously with the",13,17
            db "rhythms of nature",254,255
txt_intro3: db 24,120
            db "Over this land reigned a",13,26
            db "benevolent king and queen,",13,28
            db "whose wisdom and compassion",13,30
            db "sheltered their subjects like",13,24
            db "the grandest of pines...",254,255
txt_intro4: db 31,120
            db "It was during the most splendid",13,31
            db "of springtimes when the flowers",13,30
            db "painted the meadows in vibrant",13,27
            db "hues and the air was filled",13,29
            db "with the sweet songs of birds",13,31
            db "that the royal couple's deepest",13,22
            db "longing was fulfilled.",254,255
txt_intro5: db 30,80
            db "The queen gave birth to a pre-",13,32
            db "cious baby girl, whom they named",13,6,10
            db "PALOMA",13,30,10
            db "a name as gentle as the cooing",13,32
            db "of doves. Yet amidst this joyous",13,32
            db "occasion, a shadow fell upon the",13,30
            db "kingdom, for the beloved queen,",13,29
            db "as radiant as the morning sun,",13,29
            db "breathed her last, leaving the",13,29
            db "world in her final act of love.",254,255
txt_intro6: db 30,80
            db "The kingdom, veiled in sorrow,",13,25
            db "mourned the loss of their",13,32
            db "gracious queen. The king's heart",13,30
            db "was heavy, yet he found solace",13,32
            db "in the eyes of his daughter, who",13,29
            db "mirrored her mother's beauty.",254,255

txt_intro7: db 31,80
            db "As the seasons turned, Princess",13,30
            db "Paloma grew in grace and love-",13,29
            db "liness, her laughter echoing",13,29
            db "through the corridors of the",13,29
            db "castle. She bloomed like the",13,28
            db "rarest flower in an eternal",13,31
            db "spring, capturing the hearts of",13,18
            db "all who beheld her.",254,255
txt_intro8: db 29,100
            db "In a realm guarded by ancient",13,31
            db "pines, Princess Paloma shone as",13,31
            db "the perfect heir to the throne,",13,31
            db "uninterested in marriage propo-",13,30
            db "sals. especially from Morgath,",13,32
            db "a mage of repulsive demeanor and",13,12
            db "dark intent.",254,255
txt_intro9: db 29,80            
            db "Morgath, bitter and obsessed,",13,31
            db "haunted her every step with his",13,30
            db "unwanted advances. As Paloma's",13,32
            db "18th, birthday approached, a day",13,28
            db "marked for her to ascend the",13,31
            db "throne from her elderly father,",13,32
            db "a sinister plan unfolded. On the",13,32
            db "morning of the grand celebration",13,32
            db "Paloma vanished, abducted by the",13,15
            db "crazed Morgath.",254,255
txt_intro10: db 32,80            
            db "He left behind a chilling letter",13,25
            db "if he could not marry the",13,31
            db "princess, then no one would. He",13,21
            db "imprisoned her in his",13,13
            db "dark dungeon.",13,32,254,10
            db "The kingdom reeled in shock, and",13,26
            db "the king, overwhelmed with",13,19
            db "despair, collapsed. ",254,255
txt_intro11: db 32,80            
            db "Who could rescue Princess Paloma",13,29
            db "from the clutches of Morgath?",13,28
            db "Whispers of bravery began to",13,32
            db "stir, as heroes from afar, moved",13,32
            db "by the princess's plight stepped",13,24
            db "forward to challenge the",13,29
            db "darkness and save the beloved",13,28
            db "heir of the pine-laden land.",254,255
txt_intro12: db 26,80            
            db "In the shadow of Morgath's",13,28
            db "sinister cellar, a challenge",13,26
            db "awaits the brave: who will",13,29
            db "navigate the maze of his dark",13,30
            db " dungeon and defeat the wicked",13,31
            db "mage to rescue Princess Paloma?",254,255
txt_intro13: db 29,80
            db "Do you dare to embark on this",13,13
            db "heroic quest?",13,31,254,10
            db "The fate of the kingdom and the",13,22
            db "beloved princess rests",13,16
            db "in your hands...",254,254,255


txt_extro1: db 29,80
            db "With a mighty crash, the cage",13,31
            db "that imprisoned Princess Paloma",13,30
            db "plummeted, sealing the fate of",13,27
            db "Morgath beneath its weight.",13,30,254,10
            db "The evil magician perished un-",13,32
            db "der his own trap, while Princess",13,24
            db "Paloma emerged unharmed,",13,28
            db "her bravery shining through.",254,255

txt_extro2: db 28,40
            db "The kingdom erupted in cele-",13,30
            db "bration of her liberation, and",13,30
            db "the king planned a grand feast",13,29
            db "to honor her and her rescuer.",13,29
            db "In the midst of joy and cele-",13,30
            db "bration, a special bond formed",13,31
            db "between Paloma and the hero who",13,31
            db "had been crucial in her rescue.",13,26,254,10
            db "Who knows, maybe something",13,25
            db "beautiful will blossom...",254,255

txt_extro3: db 22,100
            db "Thank you for playing!",254,255


spriteDataHand:
	DB $00,$06,$06,$0C,$07,$6F,$6F,$5F
	DB $5F,$0E,$0E,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$F8,$F8,$C0,$C0
	DB $80,$00,$00,$00,$00,$00,$00,$00
	DB $00,$00,$09,$13,$78,$90,$90,$A0
	DB $A0,$D1,$00,$00,$00,$00,$00,$00
	DB $00,$00,$00,$F8,$04,$04,$38,$20
	DB $40,$80,$00,$00,$00,$00,$00,$00
spriteColorsHand:
	DB $00,$06,$0D,$0D,$0D,$0D,$0D,$0D
	DB $0D,$0D,$06,$00,$00,$00,$00,$00
	DB $00,$00,$46,$46,$46,$46,$46,$46
	DB $46,$46,$00,$00,$00,$00,$00,$00
