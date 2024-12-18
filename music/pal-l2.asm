; Song: Palomas Resque L2 Ghosts in here
; By:   F.Boelens Okt 2023              
; Period table: A440 Modern

; [ Song start data ]
	db $09					; Initial song speed.
	db $00					; Channel setup.
	dw .customvoice_start-8			; Start of the custom voices data.
	dw .drummacro_start			; Start of the drum macro data.
	dw .instrument_start			; Start of the instrument data.

; [ Song order pointer list ]
.restart:
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_006, .track_007	; Step:000 Pattern:000
	dw .track_008, .track_009, .track_010, .track_011, .track_012, .track_013, .track_014, .track_015	; Step:001 Pattern:001
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_006, .track_007	; Step:002 Pattern:000
	dw .track_008, .track_009, .track_010, .track_011, .track_012, .track_013, .track_014, .track_015	; Step:003 Pattern:001
	dw .track_016, .track_017, .track_018, .track_019, .track_020, .track_021, .track_022, .track_023	; Step:004 Pattern:002
	dw .track_024, .track_025, .track_026, .track_027, .track_028, .track_029, .track_030, .track_031	; Step:005 Pattern:003
	dw .track_072, .track_073, .track_074, .track_075, .track_076, .track_027, .track_078, .track_079	; Step:006 Pattern:009
	dw .track_024, .track_081, .track_026, .track_083, .track_084, .track_085, .track_030, .track_087	; Step:007 Pattern:010
	dw .track_032, .track_033, .track_034, .track_035, .track_036, .track_037, .track_038, .track_039	; Step:008 Pattern:004
	dw .track_040, .track_033, .track_042, .track_043, .track_044, .track_045, .track_046, .track_047	; Step:009 Pattern:005
	dw .track_048, .track_049, .track_050, .track_051, .track_052, .track_053, .track_054, .track_055	; Step:010 Pattern:006
	dw .track_056, .track_033, .track_058, .track_059, .track_060, .track_061, .track_062, .track_063	; Step:011 Pattern:007
	dw .track_088, .track_033, .track_034, .track_035, .track_036, .track_037, .track_094, .track_095	; Step:012 Pattern:011
	dw .track_064, .track_033, .track_066, .track_067, .track_068, .track_069, .track_070, .track_063	; Step:013 Pattern:008
	dw .track_064, .track_033, .track_066, .track_067, .track_068, .track_069, .track_070, .track_063	; Step:014 Pattern:008
	dw 0x0000, .restart				; End of sequence delimiter + restart address.

; [ Custom FM voices ]
.customvoice_start:
	db $61,$74,$4d,$56,$fd,$f6,$02,$07 		; Custom voice:177
	db $00,$20,$00,$03,$f3,$ff,$f2,$04 		; Custom voice:178

; [ FM Drum macros]
.drummacro_start:
	dw .drum_00
	dw .drum_02
	dw .drum_04

.drum_00:						; Drum 0.                 
	db $12, $ab, $02						; note Bdrum
	db $1e, $10							; Percussion
	db $02							; STOP - End of Drum macro

.drum_02:						; Drum 1.                 
	db $16, $ab, $06						; note Snare 
	db $1e, $08							; Percussion
	db $02							; STOP - End of Drum macro

.drum_04:						; Drum 3.                 
	db $06, $30							; volume Snare
	db $16, $e4, $0a						; note Snare 
	db $1e, $01							; Percussion
	db $02							; STOP - End of Drum macro

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic noise1
	dw .instrument_01				; FM+harpsicord   
	dw .instrument_02				; FM ACCBASS      
	dw .instrument_03				; BD POW Solid    
	dw .instrument_04				; SD POW Solid    
	dw .instrument_05				; HH close So HI  
	dw .instrument_06				;                 
	dw .instrument_07				;                 
	dw .instrument_08				;                 

.instrument_00:					; PSG sonic noise1
	db $30					; FM Hardware Voice 3
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
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

.instrument_01:					; FM+harpsicord   
	db $00,$08					; FM Software Voice 1
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
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
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $18,$e9						; Loop (-24)

.instrument_02:					; FM ACCBASS      
	db $e0					; FM Hardware Voice 14
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_03:					; BD POW Solid    
	db $f0					; FM Hardware Voice 15
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
								; --- Macro loop
	db $02,$80						; Mixer (N)
	db $08,$00						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_04:					; SD POW Solid    
	db $0F					; FM Hardware Voice was not set
	db $02,$10						; Mixer (T)
	db $04,$05,$00					; Tone add
	db $08,$0f						; Volume _
	db $02,$80						; Mixer (N)
	db $0E,$00						; Noise _
	db $08,$0d						; Volume _
	db $02,$80						; Mixer (N)
	db $08,$0c						; Volume _
	db $02,$80						; Mixer (N)
	db $00							; Volume same
	db $02,$80						; Mixer (N)
	db $08,$0b						; Volume _
	db $02,$80						; Mixer (N)
	db $00							; Volume same
	db $02,$80						; Mixer (N)
	db $00							; Volume same
	db $02,$80						; Mixer (N)
	db $08,$0a						; Volume _
	db $02,$80						; Mixer (N)
	db $00							; Volume same
	db $02,$80						; Mixer (N)
	db $08,$09						; Volume _
	db $02,$80						; Mixer (N)
	db $08,$08						; Volume _
	db $02,$80						; Mixer (N)
	db $08,$07						; Volume _
	db $02,$80						; Mixer (N)
	db $08,$05						; Volume _
	db $02,$80						; Mixer (N)
	db $08,$04						; Volume _
								; --- Macro loop
	db $02,$80						; Mixer (N)
	db $0E,$00						; Noise _
	db $08,$02						; Volume _
	db $18,$f9						; Loop (-8)

.instrument_05:					; HH close So HI  
	db $0F					; FM Hardware Voice was not set
	db $02,$90						; Mixer (TN)
	db $0E,$00						; Noise _
	db $08,$0c						; Volume _
	db $02,$90						; Mixer (TN)
	db $08,$06						; Volume _
								; --- Macro loop
	db $02,$90						; Mixer (TN)
	db $0E,$00						; Noise _
	db $0c,$0f						; Volume -
	db $18,$f9						; Loop (-8)

.instrument_06:					;                 
	db $00,$04					; FM Software Voice 0
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
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

.instrument_07:					;                 
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
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $0c,$01						; Volume -
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
	db $18,$da						; Loop (-39)

.instrument_08:					;                 
	db $90					; FM Hardware Voice 9
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
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $18,$e0						; Loop (-33)


; [ Song track data ]
.track_000:
	db $18			;Note C-3
	db $71			;Volume 15
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $18			;Note C-3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $11			;Note F-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $11			;Note F-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_001:
	db $27			;Note D#4
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $27			;Note D#4
	db $c1			;Wait 2
	db $27			;Note D#4
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $24			;Note C-4
	db $c5			;Wait 6
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $cf			;Wait 16
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_002:
	db $18			;Note C-3
	db $71			;Volume 15
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $18			;Note C-3
					;Wait Repeat 12
	db $1d			;Note F-3
					;Wait Repeat 12
	db $1d			;Note F-3
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_003:
	db $71			;Volume 15
	db $c3			;Wait 4
	db $30			;Note C-5
	db $79			;Instrument 7
					;Wait Repeat 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $29			;Note F-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c7			;Wait 8
	db $29			;Note F-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_004:
	db $71			;Volume 15
	db $c3			;Wait 4
	db $27			;Note D#4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $27			;Note D#4
	db $c7			;Wait 8
	db $27			;Note D#4
	db $c3			;Wait 4
	db $27			;Note D#4
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_005:
	db $71			;Volume 15
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_006:
	db $71			;Volume 15
	db $db			;Wait 28
	db $33			;Note D#5
	db $79			;Instrument 7
	db $c3			;Wait 4
	db $33			;Note D#5
	db $c7			;Wait 8
	db $33			;Note D#5
	db $c3			;Wait 4
	db $33			;Note D#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_007:
	db $33			;Note D#5
	db $71			;Volume 15
	db $7a			;Instrument 8
	db $a2,$01			;CMD Track detune
	db $c3			;Wait 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $33			;Note D#5
	db $c1			;Wait 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $30			;Note C-5
	db $c5			;Wait 6
	db $37			;Note G-5
	db $c3			;Wait 4
	db $38			;Note G#5
	db $cf			;Wait 16
	db $38			;Note G#5
	db $c3			;Wait 4
	db $35			;Note F-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_008:
	db $13			;Note G-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c2			;Wait 3
	db $11			;Note F-2
	db $c0			;Wait 1
	db $14			;Note G#2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $14			;Note G#2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_009:
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $27			;Note D#4
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $24			;Note C-4
	db $c3			;Wait 4
	db $23			;Note B-3
					;Wait Repeat 4
	db $23			;Note B-3
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $27			;Note D#4
	db $c1			;Wait 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $2f			;Note B-4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $27			;Note D#4
					;Wait Repeat 2
	db $26			;Note D-4
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_010:
	db $1f			;Note G-3
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $1f			;Note G-3
	db $ca			;Wait 11
	db $1d			;Note F-3
	db $c0			;Wait 1
	db $20			;Note G#3
	db $91,$04			;CMD Portamento tone
	db $c7			;Wait 8
	db $20			;Note G#3
	db $9c			;CMD End 
	db $c3			;Wait 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_011:
	db $c3			;Wait 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
	db $c7			;Wait 8
	db $32			;Note D-5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c7			;Wait 8
	db $29			;Note F-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_012:
	db $c3			;Wait 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $c7			;Wait 8
	db $2f			;Note B-4
	db $c3			;Wait 4
	db $2f			;Note B-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_013:
	db $c3			;Wait 4
	db $2f			;Note B-4
					;Wait Repeat 4
	db $2f			;Note B-4
	db $c7			;Wait 8
	db $2f			;Note B-4
	db $c3			;Wait 4
	db $2f			;Note B-4
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $32			;Note D-5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_014:
	db $db			;Wait 28
	db $33			;Note D#5
	db $c3			;Wait 4
	db $33			;Note D#5
	db $c7			;Wait 8
	db $35			;Note F-5
	db $c3			;Wait 4
	db $35			;Note F-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_015:
	db $37			;Note G-5
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $30			;Note C-5
	db $c3			;Wait 4
	db $2f			;Note B-4
					;Wait Repeat 4
	db $2f			;Note B-4
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $33			;Note D#5
	db $c1			;Wait 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $2f			;Note B-4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $27			;Note D#4
					;Wait Repeat 2
	db $26			;Note D-4
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_016:
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0c			;Note C-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $11			;Note F-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $11			;Note F-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_017:
	db $24			;Note C-4
	db $78			;Instrument 6
	db $d9			;Wait 26
	db $30			;Note C-5
	db $c1			;Wait 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $33			;Note D#5
	db $c3			;Wait 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $33			;Note D#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_018:
	db $18			;Note C-3
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $18			;Note C-3
					;Wait Repeat 12
	db $11			;Note F-2
					;Wait Repeat 12
	db $11			;Note F-2
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_019:
	db $c3			;Wait 4
	db $30			;Note C-5
	db $79			;Instrument 7
					;Wait Repeat 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c5			;Wait 6
	db $60			;Release 96
	db $c1			;Wait 2
	db $29			;Note F-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c7			;Wait 8
	db $29			;Note F-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_020:
	db $c3			;Wait 4
	db $27			;Note D#4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $27			;Note D#4
	db $c7			;Wait 8
	db $27			;Note D#4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c5			;Wait 6
	db $60			;Release 96
	db $c1			;Wait 2
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_021:
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c5			;Wait 6
	db $60			;Release 96
	db $c1			;Wait 2
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_022:
	db $d9			;Wait 26
	db $60			;Release 96
	db $c1			;Wait 2
	db $33			;Note D#5
	db $79			;Instrument 7
	db $c3			;Wait 4
	db $33			;Note D#5
	db $c7			;Wait 8
	db $33			;Note D#5
	db $c3			;Wait 4
	db $33			;Note D#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_023:
	db $24			;Note C-4
	db $d9			;Wait 26
	db $30			;Note C-5
	db $73			;Instrument 1
	db $c1			;Wait 2
	db $33			;Note D#5
	db $73			;Instrument 1
					;Wait Repeat 2
	db $30			;Note C-5
	db $73			;Instrument 1
					;Wait Repeat 2
	db $33			;Note D#5
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $32			;Note D-5
	db $73			;Instrument 1
					;Wait Repeat 4
	db $30			;Note C-5
	db $73			;Instrument 1
					;Wait Repeat 4
	db $33			;Note D#5
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_024:
	db $13			;Note G-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0c			;Note C-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_025:
	db $32			;Note D-5
	db $78			;Instrument 6
	db $d9			;Wait 26
	db $30			;Note C-5
	db $c1			;Wait 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $33			;Note D#5
	db $c3			;Wait 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $2e			;Note A#4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_026:
	db $1f			;Note G-3
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $1f			;Note G-3
	db $c3			;Wait 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $18			;Note C-3
	db $cb			;Wait 12
	db $18			;Note C-3
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_027:
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_028:
	db $c3			;Wait 4
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $26			;Note D-4
	db $c7			;Wait 8
	db $26			;Note D-4
	db $c3			;Wait 4
	db $26			;Note D-4
	db $c7			;Wait 8
	db $27			;Note D#4
	db $c3			;Wait 4
	db $27			;Note D#4
	db $c7			;Wait 8
	db $27			;Note D#4
	db $c3			;Wait 4
	db $27			;Note D#4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_029:
	db $c3			;Wait 4
	db $29			;Note F-4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $29			;Note F-4
	db $c7			;Wait 8
	db $29			;Note F-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_030:
	db $c3			;Wait 4
	db $2f			;Note B-4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $2f			;Note B-4
	db $c7			;Wait 8
	db $2f			;Note B-4
	db $c3			;Wait 4
	db $2f			;Note B-4
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_031:
	db $32			;Note D-5
	db $73			;Instrument 1
	db $d9			;Wait 26
	db $30			;Note C-5
	db $73			;Instrument 1
	db $c1			;Wait 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $33			;Note D#5
	db $c3			;Wait 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $2e			;Note A#4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_032:
	db $13			;Note G-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $16			;Note A#2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $18			;Note C-3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_033:
	db $0c			;Note C-2
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $77			;Instrument 5
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $76			;Instrument 4
					;Wait Repeat 2
	db $5f			;Note B-8
	db $77			;Instrument 5
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $0c			;Note C-2
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $77			;Instrument 5
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $76			;Instrument 4
					;Wait Repeat 2
	db $5f			;Note B-8
	db $77			;Instrument 5
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $bf			;[End-Of-Track]
.track_034:
	db $13			;Note G-2
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $13			;Note G-2
					;Wait Repeat 12
	db $16			;Note A#2
					;Wait Repeat 12
	db $18			;Note C-3
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_035:
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $2b			;Note G-4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $2e			;Note A#4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $2e			;Note A#4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $30			;Note C-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $30			;Note C-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $30			;Note C-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_036:
	db $c1			;Wait 2
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $29			;Note F-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $35			;Note F-5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_037:
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2e			;Note A#4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $2e			;Note A#4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_038:
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $79			;Instrument 7
	db $cb			;Wait 12
	db $2b			;Note G-4
					;Wait Repeat 12
	db $2e			;Note A#4
	db $cf			;Wait 16
	db $24			;Note C-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_039:
	db $c3			;Wait 4
	db $32			;Note D-5
	db $79			;Instrument 7
	db $cb			;Wait 12
	db $32			;Note D-5
					;Wait Repeat 12
	db $29			;Note F-4
	db $cf			;Wait 16
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_040:
	db $14			;Note G#2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $14			;Note G#2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $10			;Note E-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $17			;Note B-2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0d			;Note C#2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_042:
	db $14			;Note G#2
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $14			;Note G#2
					;Wait Repeat 12
	db $1c			;Note E-3
	db $c7			;Wait 8
	db $17			;Note B-2
	db $c3			;Wait 4
	db $19			;Note C#3
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_043:
	db $2c			;Note G#4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $2c			;Note G#4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $28			;Note E-4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $2f			;Note B-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $25			;Note C#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $31			;Note C#5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_044:
	db $c1			;Wait 2
	db $27			;Note D#4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $27			;Note D#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $27			;Note D#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $27			;Note D#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $27			;Note D#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $27			;Note D#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2f			;Note B-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2f			;Note B-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $28			;Note E-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $28			;Note E-4
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_045:
	db $c3			;Wait 4
	db $2f			;Note B-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2f			;Note B-4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $2f			;Note B-4
	db $78			;Instrument 6
					;Wait Repeat 8
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $28			;Note E-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_046:
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $79			;Instrument 7
	db $cb			;Wait 12
	db $2c			;Note G#4
					;Wait Repeat 12
	db $34			;Note E-5
	db $c7			;Wait 8
	db $31			;Note C#5
					;Wait Repeat 8
	db $31			;Note C#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_047:
	db $c3			;Wait 4
	db $33			;Note D#5
	db $79			;Instrument 7
	db $cb			;Wait 12
	db $33			;Note D#5
					;Wait Repeat 12
	db $2f			;Note B-4
	db $c7			;Wait 8
	db $2c			;Note G#4
					;Wait Repeat 8
	db $38			;Note G#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_048:
	db $17			;Note B-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $17			;Note B-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $17			;Note B-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $17			;Note B-2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $17			;Note B-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_049:
	db $0c			;Note C-2
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $77			;Instrument 5
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $76			;Instrument 4
					;Wait Repeat 2
	db $5f			;Note B-8
	db $77			;Instrument 5
					;Wait Repeat 2
	db $26			;Note D-4
	db $76			;Instrument 4
					;Wait Repeat 2
	db $5f			;Note B-8
	db $77			;Instrument 5
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $0c			;Note C-2
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $77			;Instrument 5
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $76			;Instrument 4
					;Wait Repeat 2
	db $5f			;Note B-8
	db $77			;Instrument 5
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $bf			;[End-Of-Track]
.track_050:
	db $17			;Note B-2
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $17			;Note B-2
	db $c3			;Wait 4
	db $1f			;Note G-3
	db $cb			;Wait 12
	db $17			;Note B-2
	db $c3			;Wait 4
	db $17			;Note B-2
					;Wait Repeat 4
	db $17			;Note B-2
					;Wait Repeat 4
	db $1f			;Note G-3
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_051:
	db $2f			;Note B-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $2f			;Note B-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2f			;Note B-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2b			;Note G-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2b			;Note G-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2b			;Note G-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2f			;Note B-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2f			;Note B-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2f			;Note B-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2b			;Note G-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2b			;Note G-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_052:
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2e			;Note A#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2e			;Note A#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2e			;Note A#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2e			;Note A#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2e			;Note A#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2e			;Note A#4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_053:
	db $36			;Note F#5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $36			;Note F#5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $36			;Note F#5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $36			;Note F#5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $36			;Note F#5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $36			;Note F#5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_054:
	db $c1			;Wait 2
	db $47			;Note B-6
	db $6f			;Volume 13
	db $79			;Instrument 7
	db $a2,$01			;CMD Track detune
	db $c0			;Wait 1
	db $46			;Note A#6
					;Wait Repeat 1
	db $45			;Note A-6
					;Wait Repeat 1
	db $44			;Note G#6
					;Wait Repeat 1
	db $43			;Note G-6
					;Wait Repeat 1
	db $42			;Note F#6
					;Wait Repeat 1
	db $41			;Note F-6
					;Wait Repeat 1
	db $40			;Note E-6
					;Wait Repeat 1
	db $3f			;Note D#6
					;Wait Repeat 1
	db $3e			;Note D-6
					;Wait Repeat 1
	db $3d			;Note C#6
					;Wait Repeat 1
	db $3c			;Note C-6
					;Wait Repeat 1
	db $3b			;Note B-5
					;Wait Repeat 1
	db $3a			;Note A#5
					;Wait Repeat 1
	db $39			;Note A-5
					;Wait Repeat 1
	db $38			;Note G#5
					;Wait Repeat 1
	db $37			;Note G-5
					;Wait Repeat 1
	db $36			;Note F#5
					;Wait Repeat 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $34			;Note E-5
					;Wait Repeat 1
	db $33			;Note D#5
					;Wait Repeat 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $31			;Note C#5
					;Wait Repeat 1
	db $30			;Note C-5
					;Wait Repeat 1
	db $47			;Note B-6
					;Wait Repeat 1
	db $46			;Note A#6
					;Wait Repeat 1
	db $45			;Note A-6
					;Wait Repeat 1
	db $44			;Note G#6
					;Wait Repeat 1
	db $43			;Note G-6
					;Wait Repeat 1
	db $42			;Note F#6
					;Wait Repeat 1
	db $41			;Note F-6
					;Wait Repeat 1
	db $40			;Note E-6
					;Wait Repeat 1
	db $3f			;Note D#6
					;Wait Repeat 1
	db $3e			;Note D-6
					;Wait Repeat 1
	db $3d			;Note C#6
					;Wait Repeat 1
	db $3c			;Note C-6
					;Wait Repeat 1
	db $3b			;Note B-5
					;Wait Repeat 1
	db $3a			;Note A#5
					;Wait Repeat 1
	db $39			;Note A-5
					;Wait Repeat 1
	db $38			;Note G#5
					;Wait Repeat 1
	db $37			;Note G-5
					;Wait Repeat 1
	db $36			;Note F#5
					;Wait Repeat 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $34			;Note E-5
					;Wait Repeat 1
	db $33			;Note D#5
					;Wait Repeat 1
	db $32			;Note D-5
	db $bf			;[End-Of-Track]
.track_055:
	db $47			;Note B-6
	db $79			;Instrument 7
	db $c0			;Wait 1
	db $46			;Note A#6
					;Wait Repeat 1
	db $45			;Note A-6
					;Wait Repeat 1
	db $44			;Note G#6
					;Wait Repeat 1
	db $43			;Note G-6
					;Wait Repeat 1
	db $42			;Note F#6
					;Wait Repeat 1
	db $41			;Note F-6
					;Wait Repeat 1
	db $40			;Note E-6
					;Wait Repeat 1
	db $3f			;Note D#6
					;Wait Repeat 1
	db $3e			;Note D-6
					;Wait Repeat 1
	db $3d			;Note C#6
					;Wait Repeat 1
	db $3c			;Note C-6
					;Wait Repeat 1
	db $3b			;Note B-5
					;Wait Repeat 1
	db $3a			;Note A#5
					;Wait Repeat 1
	db $39			;Note A-5
					;Wait Repeat 1
	db $38			;Note G#5
					;Wait Repeat 1
	db $37			;Note G-5
					;Wait Repeat 1
	db $36			;Note F#5
					;Wait Repeat 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $34			;Note E-5
					;Wait Repeat 1
	db $33			;Note D#5
					;Wait Repeat 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $31			;Note C#5
					;Wait Repeat 1
	db $30			;Note C-5
					;Wait Repeat 1
	db $47			;Note B-6
					;Wait Repeat 1
	db $46			;Note A#6
					;Wait Repeat 1
	db $45			;Note A-6
					;Wait Repeat 1
	db $44			;Note G#6
					;Wait Repeat 1
	db $43			;Note G-6
					;Wait Repeat 1
	db $42			;Note F#6
					;Wait Repeat 1
	db $41			;Note F-6
					;Wait Repeat 1
	db $40			;Note E-6
					;Wait Repeat 1
	db $3f			;Note D#6
					;Wait Repeat 1
	db $3e			;Note D-6
					;Wait Repeat 1
	db $3d			;Note C#6
					;Wait Repeat 1
	db $3c			;Note C-6
					;Wait Repeat 1
	db $3b			;Note B-5
					;Wait Repeat 1
	db $3a			;Note A#5
					;Wait Repeat 1
	db $39			;Note A-5
					;Wait Repeat 1
	db $38			;Note G#5
					;Wait Repeat 1
	db $37			;Note G-5
					;Wait Repeat 1
	db $36			;Note F#5
					;Wait Repeat 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $34			;Note E-5
					;Wait Repeat 1
	db $33			;Note D#5
					;Wait Repeat 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $31			;Note C#5
					;Wait Repeat 1
	db $30			;Note C-5
	db $bf			;[End-Of-Track]
.track_056:
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0e			;Note D-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $13			;Note G-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_058:
	db $1a			;Note D-3
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $1a			;Note D-3
	db $c7			;Wait 8
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1f			;Note G-3
	db $cb			;Wait 12
	db $1f			;Note G-3
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_059:
	db $c3			;Wait 4
	db $32			;Note D-5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $34			;Note E-5
	db $6a			;Volume 8
	db $c0			;Wait 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
	db $c0			;Wait 1
	db $34			;Note E-5
	db $71			;Volume 15
	db $78			;Instrument 6
	db $95,$50			;CMD Vibrato
					;Wait Repeat 1
	db $95,$80			;CMD Vibrato
					;Wait Repeat 1
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_060:
	db $c3			;Wait 4
	db $29			;Note F-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $29			;Note F-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $29			;Note F-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $29			;Note F-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $6a			;Volume 8
	db $c0			;Wait 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
	db $c0			;Wait 1
	db $2b			;Note G-4
	db $71			;Volume 15
	db $78			;Instrument 6
	db $95,$50			;CMD Vibrato
					;Wait Repeat 1
	db $95,$80			;CMD Vibrato
					;Wait Repeat 1
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_061:
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2d			;Note A-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2f			;Note B-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $2f			;Note B-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2f			;Note B-4
	db $6a			;Volume 8
	db $c0			;Wait 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
	db $c0			;Wait 1
	db $2f			;Note B-4
	db $71			;Volume 15
	db $78			;Instrument 6
	db $95,$50			;CMD Vibrato
					;Wait Repeat 1
	db $95,$80			;CMD Vibrato
					;Wait Repeat 1
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_062:
	db $60			;Release 96
	db $db			;Wait 28
	db $26			;Note D-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $26			;Note D-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $26			;Note D-4
	db $6a			;Volume 8
	db $c0			;Wait 1
	db $6b			;Volume 9
					;Wait Repeat 1
	db $6c			;Volume 10
					;Wait Repeat 1
	db $6d			;Volume 11
	db $c0			;Wait 1
	db $26			;Note D-4
	db $71			;Volume 15
	db $78			;Instrument 6
	db $95,$50			;CMD Vibrato
					;Wait Repeat 1
	db $95,$80			;CMD Vibrato
					;Wait Repeat 1
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_063:
	db $60			;Release 96
	db $ef			;Wait 48
	db $bf			;[End-Of-Track]
.track_064:
	db $12			;Note F#2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $12			;Note F#2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0d			;Note C#2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0d			;Note C#2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_066:
	db $1e			;Note F#3
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $1e			;Note F#3
					;Wait Repeat 12
	db $19			;Note C#3
					;Wait Repeat 12
	db $19			;Note C#3
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_067:
	db $c3			;Wait 4
	db $2a			;Note F#4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2a			;Note F#4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2a			;Note F#4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $2a			;Note F#4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_068:
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $78			;Instrument 6
					;Wait Repeat 4
	db $2d			;Note A-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_069:
	db $c3			;Wait 4
	db $31			;Note C#5
	db $78			;Instrument 6
					;Wait Repeat 4
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_070:
	db $ef			;Wait 48
	db $bf			;[End-Of-Track]
.track_072:
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0c			;Note C-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0f			;Note D#2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $11			;Note F-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $11			;Note F-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_073:
	db $30			;Note C-5
	db $78			;Instrument 6
	db $d9			;Wait 26
	db $30			;Note C-5
	db $c1			;Wait 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $33			;Note D#5
	db $c3			;Wait 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $33			;Note D#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_074:
	db $18			;Note C-3
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0e			;Note D-2
					;Wait Repeat 4
	db $0f			;Note D#2
					;Wait Repeat 4
	db $11			;Note F-2
	db $cb			;Wait 12
	db $11			;Note F-2
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_075:
	db $c3			;Wait 4
	db $30			;Note C-5
	db $79			;Instrument 7
					;Wait Repeat 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $29			;Note F-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c7			;Wait 8
	db $29			;Note F-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_076:
	db $c3			;Wait 4
	db $27			;Note D#4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $27			;Note D#4
	db $c7			;Wait 8
	db $27			;Note D#4
	db $c3			;Wait 4
	db $27			;Note D#4
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $c7			;Wait 8
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_078:
	db $db			;Wait 28
	db $33			;Note D#5
	db $c3			;Wait 4
	db $33			;Note D#5
	db $c7			;Wait 8
	db $33			;Note D#5
	db $c3			;Wait 4
	db $33			;Note D#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_079:
	db $30			;Note C-5
	db $d9			;Wait 26
	db $30			;Note C-5
	db $73			;Instrument 1
	db $c1			;Wait 2
	db $33			;Note D#5
	db $73			;Instrument 1
					;Wait Repeat 2
	db $30			;Note C-5
	db $73			;Instrument 1
					;Wait Repeat 2
	db $33			;Note D#5
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $32			;Note D-5
	db $73			;Instrument 1
					;Wait Repeat 4
	db $30			;Note C-5
	db $73			;Instrument 1
					;Wait Repeat 4
	db $33			;Note D#5
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_081:
	db $32			;Note D-5
	db $78			;Instrument 6
	db $d9			;Wait 26
	db $30			;Note C-5
	db $c1			;Wait 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $33			;Note D#5
	db $c3			;Wait 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_083:
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $60			;Release 96
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_084:
	db $c3			;Wait 4
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $26			;Note D-4
	db $c7			;Wait 8
	db $26			;Note D-4
	db $c3			;Wait 4
	db $26			;Note D-4
	db $c7			;Wait 8
	db $27			;Note D#4
	db $c3			;Wait 4
	db $27			;Note D#4
	db $c7			;Wait 8
	db $27			;Note D#4
	db $c3			;Wait 4
	db $27			;Note D#4
	db $c1			;Wait 2
	db $60			;Release 96
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_085:
	db $c3			;Wait 4
	db $29			;Note F-4
	db $79			;Instrument 7
					;Wait Repeat 4
	db $29			;Note F-4
	db $c7			;Wait 8
	db $29			;Note F-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c7			;Wait 8
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c1			;Wait 2
	db $60			;Release 96
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_087:
	db $32			;Note D-5
	db $73			;Instrument 1
	db $d9			;Wait 26
	db $30			;Note C-5
	db $73			;Instrument 1
	db $c1			;Wait 2
	db $33			;Note D#5
	db $73			;Instrument 1
					;Wait Repeat 2
	db $30			;Note C-5
	db $73			;Instrument 1
					;Wait Repeat 2
	db $33			;Note D#5
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $32			;Note D-5
	db $73			;Instrument 1
					;Wait Repeat 4
	db $30			;Note C-5
	db $73			;Instrument 1
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_088:
	db $13			;Note G-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $16			;Note A#2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $0c			;Note C-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_094:
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $79			;Instrument 7
	db $cb			;Wait 12
	db $2b			;Note G-4
					;Wait Repeat 12
	db $35			;Note F-5
	db $c7			;Wait 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $30			;Note C-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_095:
	db $c3			;Wait 4
	db $32			;Note D-5
	db $79			;Instrument 7
	db $cb			;Wait 12
	db $32			;Note D-5
					;Wait Repeat 12
	db $2e			;Note A#4
	db $c7			;Wait 8
	db $43			;Note G-6
	db $71			;Volume 15
	db $c0			;Wait 1
	db $42			;Note F#6
	db $6f			;Volume 13
					;Wait Repeat 1
	db $41			;Note F-6
	db $71			;Volume 15
					;Wait Repeat 1
	db $40			;Note E-6
	db $6f			;Volume 13
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6f			;Volume 13
					;Wait Repeat 1
	db $3d			;Note C#6
	db $71			;Volume 15
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6f			;Volume 13
					;Wait Repeat 1
	db $3b			;Note B-5
	db $71			;Volume 15
					;Wait Repeat 1
	db $3a			;Note A#5
	db $6f			;Volume 13
					;Wait Repeat 1
	db $38			;Note G#5
	db $71			;Volume 15
					;Wait Repeat 1
	db $37			;Note G-5
	db $6f			;Volume 13
	db $bf			;[End-Of-Track]

