; Song: Palomas Resque - Game over      
; By:   F.Boelens Okt.2023              
; Period table: A440 Modern

; [ Song start data ]
	db $0a					; Initial song speed.
	db $00					; Channel setup.
	dw .customvoice_start-8			; Start of the custom voices data.
	dw .drummacro_start			; Start of the drum macro data.
	dw .instrument_start			; Start of the instrument data.

; [ Song order pointer list ]
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_006, .track_007	; Step:000 Pattern:000
	dw .track_008, .track_009, .track_010, .track_011, .track_012, .track_013, .track_014, .track_015	; Step:001 Pattern:001
	dw .track_008, .track_017, .track_018, .track_019, .track_020, .track_021, .track_022, .track_023	; Step:002 Pattern:002
	dw .track_024, .track_025, .track_026, .track_027, .track_028, .track_029, .track_030, .track_031	; Step:003 Pattern:003
	dw 0x0000, 0x0000				; End of sequence delimiter + end of song.

; [ Custom FM voices ]
.customvoice_start:
	db $00,$21,$01,$07,$da,$f6,$5f,$ff 		; Custom voice:159
	db $00,$00,$00,$00,$00,$00,$00,$00 		; Custom voice:191

; [ FM Drum macros]
.drummacro_start:
	dw .drum_00
	dw .drum_02

.drum_00:						; Drum 0.                 
	db $1e, $10							; Percussion
	db $02							; STOP - End of Drum macro

.drum_02:						; Drum 1.                 
	db $1e, $08							; Percussion
	db $02							; STOP - End of Drum macro

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic noise1
	dw .instrument_01				; PSG sonic noise2
	dw .instrument_02				; PSG sonic mod   
	dw .instrument_03				; FM percussion   
	dw .instrument_04				; FM ACCBASS      
	dw .instrument_05				; BD POW Solid    
	dw .instrument_06				;                 

.instrument_00:					; PSG sonic noise1
	db $30					; FM Hardware Voice 3
	db $02,$90						; Mixer (TN)
	db $0E,$04						; Noise _
	db $08,$0e						; Volume _
	db $02,$90						; Mixer (TN)
	db $08,$0e						; Volume _
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
	db $18,$f8						; Loop (-9)

.instrument_01:					; PSG sonic noise2
	db $00,$08					; FM Software Voice 1
	db $02,$90						; Mixer (TN)
	db $0E,$04						; Noise _
	db $08,$0e						; Volume _
	db $02,$90						; Mixer (TN)
	db $08,$0e						; Volume _
	db $02,$90						; Mixer (TN)
	db $00							; Volume same
	db $02,$90						; Mixer (TN)
	db $00							; Volume same
	db $02,$90						; Mixer (TN)
	db $00							; Volume same
	db $02,$90						; Mixer (TN)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $0c,$01						; Volume -
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $18,$f8						; Loop (-9)

.instrument_02:					; PSG sonic mod   
	db $0F					; FM Hardware Voice was not set
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $18,$d9						; Loop (-40)

.instrument_03:					; FM percussion   
	db $00,$04					; FM Software Voice 0
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_04:					; FM ACCBASS      
	db $e0					; FM Hardware Voice 14
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_05:					; BD POW Solid    
	db $f0					; FM Hardware Voice 15
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
								; --- Macro loop
	db $02,$80						; Mixer (N)
	db $08,$00						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_06:					;                 
	db $10					; FM Hardware Voice 1
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
	db $0c,$01						; Volume -
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $18,$d4						; Loop (-45)


; [ Song track data ]
.track_000:
	db $0c			;Note C-2
	db $71			;Volume 15
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_001:
	db $26			;Note D-4
	db $6f			;Volume 13
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $28			;Note E-4
	db $c1			;Wait 2
	db $29			;Note F-4
	db $c5			;Wait 6
	db $91,$20			;CMD Portamento tone
	db $c7			;Wait 8
	db $26			;Note D-4
	db $c3			;Wait 4
	db $28			;Note E-4
	db $c7			;Wait 8
	db $26			;Note D-4
	db $c3			;Wait 4
	db $28			;Note E-4
	db $c1			;Wait 2
	db $29			;Note F-4
	db $c4			;Wait 5
	db $60			;Release 96
	db $c0			;Wait 1
	db $26			;Note D-4
	db $c1			;Wait 2
	db $2d			;Note A-4
	db $c5			;Wait 6
	db $29			;Note F-4
	db $c5			;Wait 6
	db $60			;Release 96
	db $93,$0f			;CMD Portamento down
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_002:
	db $26			;Note D-4
	db $71			;Volume 15
	db $78			;Instrument 6
	db $cf			;Wait 16
	db $26			;Note D-4
					;Wait Repeat 16
	db $23			;Note B-3
					;Wait Repeat 16
	db $22			;Note A#3
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_003:
	db $29			;Note F-4
	db $71			;Volume 15
	db $78			;Instrument 6
	db $cf			;Wait 16
	db $29			;Note F-4
					;Wait Repeat 16
	db $26			;Note D-4
					;Wait Repeat 16
	db $26			;Note D-4
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_004:
	db $2d			;Note A-4
	db $71			;Volume 15
	db $78			;Instrument 6
	db $cf			;Wait 16
	db $2d			;Note A-4
					;Wait Repeat 16
	db $29			;Note F-4
					;Wait Repeat 16
	db $29			;Note F-4
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_005:
	db $28			;Note E-4
	db $71			;Volume 15
	db $78			;Instrument 6
	db $cd			;Wait 14
	db $1a			;Note D-3
	db $75			;Instrument 3
	db $c0			;Wait 1
	db $1a			;Note D-3
	db $75			;Instrument 3
					;Wait Repeat 1
	db $24			;Note C-4
	db $78			;Instrument 6
	db $cf			;Wait 16
	db $2b			;Note G-4
					;Wait Repeat 16
	db $2b			;Note G-4
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_006:
	db $1a			;Note D-3
	db $71			;Volume 15
	db $76			;Instrument 4
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c7			;Wait 8
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
	db $c7			;Wait 8
	db $18			;Note C-3
	db $c3			;Wait 4
	db $17			;Note B-2
					;Wait Repeat 4
	db $17			;Note B-2
	db $c7			;Wait 8
	db $17			;Note B-2
	db $c3			;Wait 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $16			;Note A#2
	db $c7			;Wait 8
	db $16			;Note A#2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_007:
	db $26			;Note D-4
	db $71			;Volume 15
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $26			;Note D-4
	db $c1			;Wait 2
	db $26			;Note D-4
	db $c0			;Wait 1
	db $26			;Note D-4
					;Wait Repeat 1
	db $26			;Note D-4
	db $c3			;Wait 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $26			;Note D-4
	db $c1			;Wait 2
	db $26			;Note D-4
	db $c0			;Wait 1
	db $26			;Note D-4
					;Wait Repeat 1
	db $26			;Note D-4
	db $c3			;Wait 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $26			;Note D-4
	db $c1			;Wait 2
	db $26			;Note D-4
	db $c0			;Wait 1
	db $26			;Note D-4
	db $c4			;Wait 5
	db $26			;Note D-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_008:
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_009:
	db $28			;Note E-4
	db $74			;Instrument 2
	db $9c			;CMD End 
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c1			;Wait 2
	db $2b			;Note G-4
	db $c9			;Wait 10
	db $60			;Release 96
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $60			;Release 96
					;Wait Repeat 4
	db $2c			;Note G#4
	db $c7			;Wait 8
	db $2d			;Note A-4
					;Wait Repeat 8
	db $30			;Note C-5
	db $c5			;Wait 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $33			;Note D#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_010:
	db $2d			;Note A-4
	db $78			;Instrument 6
	db $cf			;Wait 16
	db $29			;Note F-4
					;Wait Repeat 16
	db $28			;Note E-4
	db $c7			;Wait 8
	db $21			;Note A-3
					;Wait Repeat 8
	db $2a			;Note F#4
					;Wait Repeat 8
	db $2f			;Note B-4
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_011:
	db $25			;Note C#4
	db $78			;Instrument 6
	db $cf			;Wait 16
	db $2d			;Note A-4
					;Wait Repeat 16
	db $20			;Note G#3
	db $c7			;Wait 8
	db $24			;Note C-4
					;Wait Repeat 8
	db $2d			;Note A-4
					;Wait Repeat 8
	db $27			;Note D#4
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_012:
	db $28			;Note E-4
	db $78			;Instrument 6
	db $cf			;Wait 16
	db $24			;Note C-4
					;Wait Repeat 16
	db $2f			;Note B-4
	db $c7			;Wait 8
	db $28			;Note E-4
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $2a			;Note F#4
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_013:
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $cf			;Wait 16
	db $26			;Note D-4
					;Wait Repeat 16
	db $26			;Note D-4
	db $c7			;Wait 8
	db $2d			;Note A-4
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $2d			;Note A-4
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_014:
	db $15			;Note A-2
	db $76			;Instrument 4
	db $c3			;Wait 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $17			;Note B-2
					;Wait Repeat 4
	db $17			;Note B-2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_015:
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c0			;Wait 1
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c0			;Wait 1
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c0			;Wait 1
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c4			;Wait 5
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_017:
	db $34			;Note E-5
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $28			;Note E-4
	db $c3			;Wait 4
	db $28			;Note E-4
	db $73			;Instrument 1
					;Wait Repeat 4
	db $28			;Note E-4
	db $72			;Instrument 0
					;Wait Repeat 4
	db $2a			;Note F#4
					;Wait Repeat 4
	db $2a			;Note F#4
	db $c3			;Wait 4
	db $28			;Note E-4
	db $73			;Instrument 1
					;Wait Repeat 4
	db $24			;Note C-4
	db $72			;Instrument 0
					;Wait Repeat 4
	db $23			;Note B-3
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_018:
	db $28			;Note E-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2d			;Note A-4
					;Wait Repeat 8
	db $2d			;Note A-4
					;Wait Repeat 8
	db $2d			;Note A-4
					;Wait Repeat 8
	db $28			;Note E-4
	db $cf			;Wait 16
	db $28			;Note E-4
	db $c7			;Wait 8
	db $28			;Note E-4
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_019:
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $31			;Note C#5
					;Wait Repeat 8
	db $2a			;Note F#4
					;Wait Repeat 8
	db $28			;Note E-4
					;Wait Repeat 8
	db $2a			;Note F#4
	db $cf			;Wait 16
	db $2a			;Note F#4
	db $c7			;Wait 8
	db $2a			;Note F#4
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_020:
	db $2f			;Note B-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $34			;Note E-5
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $2f			;Note B-4
	db $cf			;Wait 16
	db $2e			;Note A#4
	db $c7			;Wait 8
	db $28			;Note E-4
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_021:
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $60			;Release 96
					;Wait Repeat 8
	db $60			;Release 96
					;Wait Repeat 8
	db $2d			;Note A-4
	db $cf			;Wait 16
	db $32			;Note D-5
	db $c7			;Wait 8
	db $31			;Note C#5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_022:
	db $1c			;Note E-3
	db $c3			;Wait 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $12			;Note F#2
					;Wait Repeat 4
	db $12			;Note F#2
					;Wait Repeat 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $19			;Note C#3
					;Wait Repeat 4
	db $19			;Note C#3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_023:
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c0			;Wait 1
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 4
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_024:
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $a4,$40			;CMD Speed
	db $c6			;Wait 7
	db $bf			;[End-Of-Track]
.track_025:
	db $d8			;Wait 25
	db $bf			;[End-Of-Track]
.track_026:
	db $23			;Note B-3
	db $cf			;Wait 16
	db $23			;Note B-3
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c6			;Wait 7
	db $bf			;[End-Of-Track]
.track_027:
	db $2a			;Note F#4
	db $cf			;Wait 16
	db $2a			;Note F#4
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c6			;Wait 7
	db $bf			;[End-Of-Track]
.track_028:
	db $26			;Note D-4
	db $cf			;Wait 16
	db $26			;Note D-4
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c6			;Wait 7
	db $bf			;[End-Of-Track]
.track_029:
	db $2f			;Note B-4
	db $cf			;Wait 16
	db $2f			;Note B-4
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c6			;Wait 7
	db $bf			;[End-Of-Track]
.track_030:
	db $17			;Note B-2
	db $cf			;Wait 16
	db $17			;Note B-2
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c6			;Wait 7
	db $bf			;[End-Of-Track]
.track_031:
	db $26			;Note D-4
	db $75			;Instrument 3
	db $cd			;Wait 14
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c0			;Wait 1
	db $26			;Note D-4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $26			;Note D-4
	db $75			;Instrument 3
	db $c8			;Wait 9
	db $bf			;[End-Of-Track]

