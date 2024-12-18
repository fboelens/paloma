; Song: v0.13.6                         
; By:                                   
; Period table: A440 Modern

; [ Song start data ]
	db $07					; Initial song speed.
	db $00					; Channel setup.
	dw .customvoice_start-8			; Start of the custom voices data.
	dw .drummacro_start			; Start of the drum macro data.
	dw .instrument_start			; Start of the instrument data.

; [ Song order pointer list ]
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_006, .track_007	; Step:000 Pattern:000
	dw 0x0000, 0x0000				; End of sequence delimiter + end of song.

; [ Custom FM voices ]
.customvoice_start:
	db $61,$61,$1f,$07,$c5,$96,$f5,$f6 		; Custom voice:173

; [ FM Drum macros]
.drummacro_start:

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic mod   
	dw .instrument_01				; FM trumpet      
	dw .instrument_02				; FM BELL         
	dw .instrument_03				; FM PLUCKED PSG B

.instrument_00:					; PSG sonic mod   
	db $0F					; FM Hardware Voice was not set
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $0c,$01						; Volume -
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $00							; Volume same
	db $18,$da						; Loop (-39)

.instrument_01:					; FM trumpet      
	db $70					; FM Hardware Voice 7
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $08,$0f						; Volume _
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $00							; Volume same
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $0c,$01						; Volume -
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $00							; Volume same
	db $18,$d7						; Loop (-42)

.instrument_02:					; FM BELL         
	db $c0					; FM Hardware Voice 12
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $0c,$01						; Volume -
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $18,$ec						; Loop (-21)

.instrument_03:					; FM PLUCKED PSG B
	db $00,$04					; FM Software Voice 0
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $18,$ec						; Loop (-21)


; [ Song track data ]
.track_000:
	db $2a			;Note F#4
	db $71			;Volume 15
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $2a			;Note F#4
	db $c1			;Wait 2
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $c1			;Wait 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $c1			;Wait 2
	db $2f			;Note B-4
	db $c3			;Wait 4
	db $2f			;Note B-4
	db $c1			;Wait 2
	db $31			;Note C#5
	db $c3			;Wait 4
	db $31			;Note C#5
	db $c1			;Wait 2
	db $2f			;Note B-4
	db $c3			;Wait 4
	db $2f			;Note B-4
	db $c1			;Wait 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $c1			;Wait 2
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $c1			;Wait 2
	db $2a			;Note F#4
	db $c3			;Wait 4
	db $36			;Note F#5
					;Wait Repeat 4
	db $2a			;Note F#4
	db $c5			;Wait 6
	db $60			;Release 96
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_001:
	db $12			;Note F#2
	db $71			;Volume 15
	db $72			;Instrument 0
	db $cb			;Wait 12
	db $0d			;Note C#2
					;Wait Repeat 12
	db $12			;Note F#2
					;Wait Repeat 12
	db $0d			;Note C#2
					;Wait Repeat 12
	db $12			;Note F#2
	db $c1			;Wait 2
	db $0d			;Note C#2
					;Wait Repeat 2
	db $0f			;Note D#2
					;Wait Repeat 2
	db $11			;Note F-2
					;Wait Repeat 2
	db $12			;Note F#2
	db $c3			;Wait 4
	db $12			;Note F#2
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_002:
	db $1e			;Note F#3
	db $71			;Volume 15
	db $73			;Instrument 1
	db $cb			;Wait 12
	db $25			;Note C#4
					;Wait Repeat 12
	db $1e			;Note F#3
					;Wait Repeat 12
	db $25			;Note C#4
					;Wait Repeat 12
	db $2a			;Note F#4
	db $cd			;Wait 14
	db $60			;Release 96
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_003:
	db $71			;Volume 15
	db $c5			;Wait 6
	db $2a			;Note F#4
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c7			;Wait 8
	db $2a			;Note F#4
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c7			;Wait 8
	db $2a			;Note F#4
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c7			;Wait 8
	db $2a			;Note F#4
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $2a			;Note F#4
	db $c3			;Wait 4
	db $61			;Sustain 97
					;Wait Repeat 4
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_004:
	db $71			;Volume 15
	db $c5			;Wait 6
	db $31			;Note C#5
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c7			;Wait 8
	db $31			;Note C#5
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c7			;Wait 8
	db $31			;Note C#5
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c7			;Wait 8
	db $31			;Note C#5
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $31			;Note C#5
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c3			;Wait 4
	db $1e			;Note F#3
	db $a2,$02			;CMD Track detune
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_005:
	db $4e			;Note F#7
	db $71			;Volume 15
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $4e			;Note F#7
	db $c1			;Wait 2
	db $50			;Note G#7
	db $c3			;Wait 4
	db $50			;Note G#7
	db $c1			;Wait 2
	db $51			;Note A-7
	db $c3			;Wait 4
	db $51			;Note A-7
	db $c1			;Wait 2
	db $53			;Note B-7
	db $c3			;Wait 4
	db $53			;Note B-7
	db $c1			;Wait 2
	db $55			;Note C#8
	db $c3			;Wait 4
	db $55			;Note C#8
	db $c1			;Wait 2
	db $53			;Note B-7
	db $c3			;Wait 4
	db $53			;Note B-7
	db $c1			;Wait 2
	db $51			;Note A-7
	db $c3			;Wait 4
	db $51			;Note A-7
	db $c1			;Wait 2
	db $50			;Note G#7
	db $c3			;Wait 4
	db $50			;Note G#7
	db $c1			;Wait 2
	db $4e			;Note F#7
	db $c3			;Wait 4
	db $4e			;Note F#7
	db $a4,$04			;CMD Speed
	db $c0			;Wait 1
	db $50			;Note G#7
					;Wait Repeat 1
	db $52			;Note A#7
					;Wait Repeat 1
	db $55			;Note C#8
	db $c0			;Wait 1
	db $5a			;Note F#8
	db $a4,$0a			;CMD Speed
	db $c3			;Wait 4
	db $4e			;Note F#7
	db $a4,$20			;CMD Speed
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_006:
	db $36			;Note F#5
	db $71			;Volume 15
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $36			;Note F#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c3			;Wait 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $39			;Note A-5
	db $c3			;Wait 4
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $3b			;Note B-5
	db $c1			;Wait 2
	db $3d			;Note C#6
	db $c3			;Wait 4
	db $3d			;Note C#6
	db $c1			;Wait 2
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $3b			;Note B-5
	db $c1			;Wait 2
	db $39			;Note A-5
	db $c3			;Wait 4
	db $39			;Note A-5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c3			;Wait 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $36			;Note F#5
	db $c3			;Wait 4
	db $36			;Note F#5
	db $c0			;Wait 1
	db $38			;Note G#5
					;Wait Repeat 1
	db $3a			;Note A#5
					;Wait Repeat 1
	db $3d			;Note C#6
					;Wait Repeat 1
	db $42			;Note F#6
	db $c3			;Wait 4
	db $36			;Note F#5
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_007:
	db $1e			;Note F#3
	db $71			;Volume 15
	db $75			;Instrument 3
	db $cb			;Wait 12
	db $19			;Note C#3
					;Wait Repeat 12
	db $1e			;Note F#3
					;Wait Repeat 12
	db $19			;Note C#3
					;Wait Repeat 12
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $25			;Note C#4
					;Wait Repeat 2
	db $27			;Note D#4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2a			;Note F#4
	db $c3			;Wait 4
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]

