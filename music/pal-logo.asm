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
	db $61,$31,$94,$07,$e4,$c1,$1b,$eb 		; Custom voice:70
	db $e1,$b2,$03,$4b,$74,$43,$03,$01 		; Custom voice:178

; [ FM Drum macros]
.drummacro_start:

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic noise1
	dw .instrument_01				; FM Violin       

.instrument_00:					; PSG sonic noise1
	db $00,$04					; FM Software Voice 0
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
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

.instrument_01:					; FM Violin       
	db $00,$08					; FM Software Voice 1
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
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)


; [ Song track data ]
.track_000:
	db $71			;Volume 15
	db $72			;Instrument 0
	db $ef			;Wait 48
	db $bf			;[End-Of-Track]
.track_001:
	db $71			;Volume 15
	db $72			;Instrument 0
	db $a4,$0a			;CMD Speed
	db $cf			;Wait 16
	db $a4,$04			;CMD Speed
	db $c0			;Wait 1
	db $a4,$23			;CMD Speed
	db $c8			;Wait 9
	db $a4,$10			;CMD Speed
	db $d5			;Wait 22
	db $bf			;[End-Of-Track]
.track_002:
	db $a2,$04			;CMD Track detune
	db $c1			;Wait 2
	db $12			;Note F#2
	db $63			;Volume 1
	db $73			;Instrument 1
	db $93,$01			;CMD Portamento down
	db $c0			;Wait 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $71			;Volume 15
	db $c1			;Wait 2
	db $9c			;CMD End 
	db $c0			;Wait 1
	db $29			;Note F-4
	db $73			;Instrument 1
	db $91,$04			;CMD Portamento tone
	db $c6			;Wait 7
	db $71			;Volume 15
	db $c0			;Wait 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $63			;Volume 1
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c6			;Wait 7
	db $bf			;[End-Of-Track]
.track_003:
	db $1e			;Note F#3
	db $63			;Volume 1
	db $73			;Instrument 1
	db $93,$01			;CMD Portamento down
	db $c0			;Wait 1
	db $64			;Volume 2
	db $a2,$03			;CMD Track detune
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $71			;Volume 15
	db $c1			;Wait 2
	db $9c			;CMD End 
	db $c0			;Wait 1
	db $35			;Note F-5
	db $73			;Instrument 1
	db $91,$08			;CMD Portamento tone
	db $c6			;Wait 7
	db $71			;Volume 15
	db $c0			;Wait 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $63			;Volume 1
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c8			;Wait 9
	db $bf			;[End-Of-Track]
.track_004:
	db $20			;Note G#3
	db $63			;Volume 1
	db $73			;Instrument 1
	db $93,$01			;CMD Portamento down
	db $c0			;Wait 1
	db $64			;Volume 2
	db $a2,$04			;CMD Track detune
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $71			;Volume 15
	db $c1			;Wait 2
	db $9c			;CMD End 
	db $c0			;Wait 1
	db $37			;Note G-5
	db $73			;Instrument 1
	db $91,$08			;CMD Portamento tone
	db $c4			;Wait 5
	db $96,$02			;CMD Portamento up
	db $c1			;Wait 2
	db $71			;Volume 15
	db $c0			;Wait 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $63			;Volume 1
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c8			;Wait 9
	db $bf			;[End-Of-Track]
.track_005:
	db $25			;Note C#4
	db $63			;Volume 1
	db $73			;Instrument 1
	db $93,$01			;CMD Portamento down
	db $c0			;Wait 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $71			;Volume 15
	db $c1			;Wait 2
	db $9c			;CMD End 
	db $c0			;Wait 1
	db $3c			;Note C-6
	db $73			;Instrument 1
	db $91,$08			;CMD Portamento tone
	db $c6			;Wait 7
	db $71			;Volume 15
	db $c0			;Wait 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $63			;Volume 1
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c8			;Wait 9
	db $bf			;[End-Of-Track]
.track_006:
	db $36			;Note F#5
	db $63			;Volume 1
	db $73			;Instrument 1
	db $96,$01			;CMD Portamento up
	db $c0			;Wait 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $71			;Volume 15
	db $c1			;Wait 2
	db $9c			;CMD End 
	db $c0			;Wait 1
	db $1d			;Note F-3
	db $73			;Instrument 1
	db $91,$08			;CMD Portamento tone
	db $c6			;Wait 7
	db $71			;Volume 15
	db $c0			;Wait 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $63			;Volume 1
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c8			;Wait 9
	db $bf			;[End-Of-Track]
.track_007:
	db $06			;Note F#1
	db $63			;Volume 1
	db $73			;Instrument 1
	db $93,$01			;CMD Portamento down
	db $c0			;Wait 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $71			;Volume 15
	db $c1			;Wait 2
	db $9c			;CMD End 
	db $c0			;Wait 1
	db $29			;Note F-4
	db $73			;Instrument 1
	db $91,$08			;CMD Portamento tone
	db $c6			;Wait 7
	db $71			;Volume 15
	db $c0			;Wait 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $6f			;Volume 13
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $6d			;Volume 11
					;Wait Repeat 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6a			;Volume 8
					;Wait Repeat 1
	db $69			;Volume 7
					;Wait Repeat 1
	db $68			;Volume 6
					;Wait Repeat 1
	db $67			;Volume 5
					;Wait Repeat 1
	db $66			;Volume 4
					;Wait Repeat 1
	db $65			;Volume 3
					;Wait Repeat 1
	db $64			;Volume 2
					;Wait Repeat 1
	db $63			;Volume 1
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c8			;Wait 9
	db $bf			;[End-Of-Track]

