; Song: Palomas Resque L3               
; By:   F.Boelens Okt 2023              
; Period table: A440 Modern

; [ Song start data ]
	db $09					; Initial song speed.
	db $00					; Channel setup.
	dw .customvoice_start-8			; Start of the custom voices data.
	dw .drummacro_start			; Start of the drum macro data.
	dw .instrument_start			; Start of the instrument data.

; [ Song order pointer list ]
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_005, .track_005	; Step:000 Pattern:000
	dw .track_000, .track_009, .track_010, .track_011, .track_012, .track_013, .track_013, .track_013	; Step:001 Pattern:001
	dw .track_016, .track_001, .track_018, .track_019, .track_020, .track_013, .track_013, .track_013	; Step:002 Pattern:002
	dw .track_024, .track_009, .track_010, .track_011, .track_028, .track_013, .track_013, .track_013	; Step:003 Pattern:003
	dw .track_024, .track_001, .track_018, .track_019, .track_036, .track_037, .track_038, .track_039	; Step:004 Pattern:004
	dw .track_024, .track_009, .track_010, .track_011, .track_044, .track_045, .track_046, .track_047	; Step:005 Pattern:005
	dw .track_024, .track_001, .track_018, .track_019, .track_036, .track_037, .track_038, .track_039	; Step:006 Pattern:004
	dw .track_024, .track_009, .track_010, .track_011, .track_044, .track_053, .track_054, .track_055	; Step:007 Pattern:006
	dw .track_056, .track_057, .track_018, .track_019, .track_036, .track_061, .track_062, .track_063	; Step:008 Pattern:007
	dw .track_024, .track_009, .track_010, .track_067, .track_044, .track_069, .track_070, .track_071	; Step:009 Pattern:008
	dw .track_056, .track_057, .track_018, .track_019, .track_036, .track_061, .track_062, .track_063	; Step:010 Pattern:007
	dw .track_024, .track_009, .track_010, .track_067, .track_044, .track_069, .track_070, .track_071	; Step:011 Pattern:008
	dw .track_024, .track_073, .track_074, .track_075, .track_076, .track_077, .track_078, .track_079	; Step:012 Pattern:009
	dw .track_024, .track_073, .track_074, .track_075, .track_076, .track_077, .track_078, .track_079	; Step:013 Pattern:009
	dw .track_024, .track_073, .track_074, .track_075, .track_076, .track_085, .track_086, .track_079	; Step:014 Pattern:010
	dw .track_024, .track_073, .track_074, .track_075, .track_092, .track_085, .track_086, .track_013	; Step:015 Pattern:011
	dw .track_024, .track_073, .track_074, .track_075, .track_076, .track_085, .track_086, .track_079	; Step:016 Pattern:010
	dw .track_024, .track_073, .track_074, .track_075, .track_092, .track_109, .track_110, .track_013	; Step:017 Pattern:013
	dw .track_024, .track_001, .track_018, .track_019, .track_036, .track_037, .track_038, .track_039	; Step:018 Pattern:004
	dw .track_024, .track_009, .track_010, .track_011, .track_044, .track_053, .track_054, .track_055	; Step:019 Pattern:006
	dw .track_056, .track_057, .track_018, .track_019, .track_036, .track_061, .track_062, .track_063	; Step:020 Pattern:007
	dw .track_024, .track_009, .track_010, .track_067, .track_044, .track_069, .track_070, .track_071	; Step:021 Pattern:008
	dw .track_024, .track_073, .track_074, .track_075, .track_076, .track_085, .track_086, .track_079	; Step:022 Pattern:010
	dw .track_024, .track_073, .track_074, .track_075, .track_092, .track_085, .track_086, .track_013	; Step:023 Pattern:011
	dw .track_024, .track_073, .track_074, .track_075, .track_076, .track_085, .track_086, .track_079	; Step:024 Pattern:010
	dw .track_024, .track_073, .track_074, .track_075, .track_092, .track_085, .track_086, .track_013	; Step:025 Pattern:011
	dw .track_096, .track_097, .track_098, .track_098, .track_100, .track_101, .track_102, .track_103	; Step:026 Pattern:012
	dw 0x0000, 0x0000				; End of sequence delimiter + end of song.

; [ Custom FM voices ]
.customvoice_start:
	db $01,$01,$11,$06,$c0,$b4,$01,$f6 		; Custom voice:164
	db $00,$00,$00,$00,$00,$00,$00,$00 		; Custom voice:191

; [ FM Drum macros]
.drummacro_start:

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic noise1
	dw .instrument_01				; PSG sonic noise2
	dw .instrument_02				; FM+harpsicord   
	dw .instrument_03				; FM Guitar       
	dw .instrument_04				; FM ACCBASS      
	dw .instrument_05				; FM Horn         
	dw .instrument_06				; BD POW Solid    
	dw .instrument_07				; SD POW Solid    
	dw .instrument_08				; HH close So HI  
	dw .instrument_09				;                 
	dw .instrument_10				;                 
	dw .instrument_11				;                 

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

.instrument_01:					; PSG sonic noise2
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
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $0c,$01						; Volume -
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $18,$f8						; Loop (-9)

.instrument_02:					; FM+harpsicord   
	db $00,$04					; FM Software Voice 0
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
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

.instrument_03:					; FM Guitar       
	db $f0					; FM Hardware Voice 15
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

.instrument_05:					; FM Horn         
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
	db $04,$fe,$ff					; Tone sub
	db $0c,$01						; Volume -
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
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $18,$da						; Loop (-39)

.instrument_06:					; BD POW Solid    
	db $f0					; FM Hardware Voice 15
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
								; --- Macro loop
	db $02,$80						; Mixer (N)
	db $08,$00						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_07:					; SD POW Solid    
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

.instrument_08:					; HH close So HI  
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

.instrument_09:					;                 
	db $10					; FM Hardware Voice 1
								; --- Macro loop
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
	db $18,$bd						; Loop (-68)

.instrument_10:					;                 
	db $70					; FM Hardware Voice 7
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $08,$0b						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $08,$0a						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $08,$09						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $04,$fe,$ff					; Tone sub
	db $0c,$01						; Volume -
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
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$02,$00					; Tone add
	db $00							; Volume same
	db $18,$da						; Loop (-39)

.instrument_11:					;                 
	db $b0					; FM Hardware Voice 11
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)


; [ Song track data ]
.track_000:
	db $5f			;Note B-8
	db $71			;Volume 15
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_001:
	db $2a			;Note F#4
	db $6c			;Volume 10
	db $73			;Instrument 1
	db $c1			;Wait 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $31			;Note C#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_002:
	db $36			;Note F#5
	db $71			;Volume 15
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $36			;Note F#5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $36			;Note F#5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $36			;Note F#5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $38			;Note G#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_003:
	db $71			;Volume 15
	db $c1			;Wait 2
	db $38			;Note G#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_004:
	db $1c			;Note E-3
	db $71			;Volume 15
	db $76			;Instrument 4
	db $c0			;Wait 1
	db $1e			;Note F#3
	db $91,$05			;CMD Portamento tone
	db $dc			;Wait 29
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $1c			;Note E-3
	db $c3			;Wait 4
	db $10			;Note E-2
	db $c1			;Wait 2
	db $60			;Release 96
					;Wait Repeat 2
	db $10			;Note E-2
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_005:
	db $71			;Volume 15
	db $72			;Instrument 0
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_009:
	db $27			;Note D#4
	db $72			;Instrument 0
	db $c1			;Wait 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $27			;Note D#4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $27			;Note D#4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $27			;Note D#4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2f			;Note B-4
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2f			;Note B-4
					;Wait Repeat 2
	db $34			;Note E-5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_010:
	db $33			;Note D#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $32			;Note D-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $39			;Note A-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $32			;Note D-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $39			;Note A-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $34			;Note E-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3b			;Note B-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $34			;Note E-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3b			;Note B-5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_011:
	db $c1			;Wait 2
	db $36			;Note F#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $3f			;Note D#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3f			;Note D#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3f			;Note D#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3f			;Note D#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $37			;Note G-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3e			;Note D-6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $37			;Note G-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3c			;Note C-6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $39			;Note A-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $40			;Note E-6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $39			;Note A-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $40			;Note E-6
	db $74			;Instrument 2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_012:
	db $1b			;Note D#3
	db $76			;Instrument 4
	db $dd			;Wait 30
	db $20			;Note G#3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $cf			;Wait 16
	db $1c			;Note E-3
	db $c7			;Wait 8
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $60			;Release 96
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_013:
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_016:
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $71			;Volume 15
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_018:
	db $36			;Note F#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3a			;Note A#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3a			;Note A#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3a			;Note A#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $34			;Note E-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $34			;Note E-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $34			;Note E-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $34			;Note E-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_019:
	db $c1			;Wait 2
	db $38			;Note G#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_020:
	db $1c			;Note E-3
	db $76			;Instrument 4
	db $c0			;Wait 1
	db $1e			;Note F#3
	db $91,$05			;CMD Portamento tone
	db $d2			;Wait 19
	db $1e			;Note F#3
	db $9c			;CMD End 
	db $c2			;Wait 3
	db $22			;Note A#3
	db $c0			;Wait 1
	db $25			;Note C#4
	db $91,$0f			;CMD Portamento tone
	db $c3			;Wait 4
	db $23			;Note B-3
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $23			;Note B-3
	db $c3			;Wait 4
	db $22			;Note A#3
	db $c1			;Wait 2
	db $20			;Note G#3
	db $d1			;Wait 18
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $20			;Note G#3
					;Wait Repeat 2
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_024:
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $26			;Note D-4
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $6f			;Volume 13
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_028:
	db $1b			;Note D#3
	db $76			;Instrument 4
	db $c3			;Wait 4
	db $1b			;Note D#3
					;Wait Repeat 4
	db $1b			;Note D#3
					;Wait Repeat 4
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $1b			;Note D#3
	db $c3			;Wait 4
	db $1b			;Note D#3
					;Wait Repeat 4
	db $1b			;Note D#3
					;Wait Repeat 4
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $20			;Note G#3
					;Wait Repeat 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $12			;Note F#2
	db $c1			;Wait 2
	db $1c			;Note E-3
					;Wait Repeat 2
	db $20			;Note G#3
					;Wait Repeat 2
	db $14			;Note G#2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_036:
	db $12			;Note F#2
	db $76			;Instrument 4
	db $c3			;Wait 4
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $12			;Note F#2
	db $c3			;Wait 4
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $12			;Note F#2
	db $c3			;Wait 4
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $12			;Note F#2
	db $c3			;Wait 4
	db $23			;Note B-3
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $10			;Note E-2
	db $c3			;Wait 4
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $1c			;Note E-3
					;Wait Repeat 2
	db $10			;Note E-2
	db $c3			;Wait 4
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $1c			;Note E-3
					;Wait Repeat 2
	db $10			;Note E-2
	db $c3			;Wait 4
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $1c			;Note E-3
					;Wait Repeat 2
	db $10			;Note E-2
	db $c3			;Wait 4
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_037:
	db $36			;Note F#5
	db $77			;Instrument 5
	db $c0			;Wait 1
	db $3a			;Note A#5
	db $91,$09			;CMD Portamento tone
	db $cc			;Wait 13
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c7			;Wait 8
	db $3d			;Note C#6
					;Wait Repeat 8
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $d1			;Wait 18
	db $3d			;Note C#6
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_038:
	db $a2,$02			;CMD Track detune
	db $c1			;Wait 2
	db $36			;Note F#5
	db $6e			;Volume 12
	db $77			;Instrument 5
	db $c0			;Wait 1
	db $3a			;Note A#5
	db $91,$09			;CMD Portamento tone
	db $cc			;Wait 13
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c7			;Wait 8
	db $3d			;Note C#6
					;Wait Repeat 8
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c8			;Wait 9
	db $3a			;Note A#5
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3d			;Note C#6
	db $77			;Instrument 5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_039:
	db $ee			;Wait 47
	db $3a			;Note A#5
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $3b			;Note B-5
	db $91,$05			;CMD Portamento tone
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c3			;Wait 4
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_044:
	db $0f			;Note D#2
	db $76			;Instrument 4
	db $c3			;Wait 4
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $1b			;Note D#3
					;Wait Repeat 2
	db $0f			;Note D#2
	db $c3			;Wait 4
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $0f			;Note D#2
	db $c3			;Wait 4
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $1b			;Note D#3
					;Wait Repeat 2
	db $0f			;Note D#2
	db $c3			;Wait 4
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $20			;Note G#3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $10			;Note E-2
	db $c3			;Wait 4
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $1c			;Note E-3
					;Wait Repeat 2
	db $12			;Note F#2
					;Wait Repeat 2
	db $1c			;Note E-3
					;Wait Repeat 2
	db $20			;Note G#3
					;Wait Repeat 2
	db $14			;Note G#2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_045:
	db $3b			;Note B-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $d1			;Wait 18
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $3e			;Note D-6
	db $c7			;Wait 8
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $42			;Note F#6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $40			;Note E-6
	db $c7			;Wait 8
	db $40			;Note E-6
	db $c1			;Wait 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $3d			;Note C#6
					;Wait Repeat 2
	db $3b			;Note B-5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_046:
	db $c1			;Wait 2
	db $3b			;Note B-5
	db $6e			;Volume 12
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c9			;Wait 10
	db $3b			;Note B-5
	db $7b			;Instrument 9
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
	db $77			;Instrument 5
					;Wait Repeat 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $3e			;Note D-6
	db $c7			;Wait 8
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $42			;Note F#6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $40			;Note E-6
	db $c7			;Wait 8
	db $40			;Note E-6
	db $c1			;Wait 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $3d			;Note C#6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_047:
	db $ce			;Wait 15
	db $3a			;Note A#5
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $3b			;Note B-5
	db $91,$04			;CMD Portamento tone
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c5			;Wait 6
	db $61			;Sustain 97
	db $c7			;Wait 8
	db $32			;Note D-5
	db $c1			;Wait 2
	db $36			;Note F#5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $60			;Release 96
	db $c7			;Wait 8
	db $34			;Note E-5
	db $c1			;Wait 2
	db $36			;Note F#5
					;Wait Repeat 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_053:
	db $3b			;Note B-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $d1			;Wait 18
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $3e			;Note D-6
	db $c7			;Wait 8
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $42			;Note F#6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $40			;Note E-6
	db $c3			;Wait 4
	db $40			;Note E-6
					;Wait Repeat 4
	db $40			;Note E-6
	db $c1			;Wait 2
	db $42			;Note F#6
					;Wait Repeat 2
	db $44			;Note G#6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_054:
	db $c1			;Wait 2
	db $3b			;Note B-5
	db $6e			;Volume 12
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c8			;Wait 9
	db $3a			;Note A#5
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
	db $77			;Instrument 5
					;Wait Repeat 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $3e			;Note D-6
	db $c7			;Wait 8
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $42			;Note F#6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $40			;Note E-6
	db $c7			;Wait 8
	db $40			;Note E-6
	db $c1			;Wait 2
	db $42			;Note F#6
					;Wait Repeat 2
	db $44			;Note G#6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_055:
	db $ce			;Wait 15
	db $3a			;Note A#5
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $38			;Note G#5
	db $c5			;Wait 6
	db $61			;Sustain 97
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_056:
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_057:
	db $2a			;Note F#4
	db $6c			;Volume 10
	db $73			;Instrument 1
	db $c1			;Wait 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
	db $c1			;Wait 2
	db $31			;Note C#5
	db $74			;Instrument 2
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $31			;Note C#5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $2a			;Note F#4
					;Wait Repeat 2
	db $2c			;Note G#4
					;Wait Repeat 2
	db $31			;Note C#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_061:
	db $42			;Note F#6
	db $77			;Instrument 5
	db $d3			;Wait 20
	db $42			;Note F#6
	db $c3			;Wait 4
	db $46			;Note A#6
	db $c7			;Wait 8
	db $44			;Note G#6
	db $c3			;Wait 4
	db $42			;Note F#6
	db $c1			;Wait 2
	db $40			;Note E-6
	db $d1			;Wait 18
	db $44			;Note G#6
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_062:
	db $c1			;Wait 2
	db $42			;Note F#6
	db $77			;Instrument 5
	db $d3			;Wait 20
	db $42			;Note F#6
	db $c3			;Wait 4
	db $46			;Note A#6
	db $c7			;Wait 8
	db $44			;Note G#6
	db $c3			;Wait 4
	db $42			;Note F#6
	db $c1			;Wait 2
	db $40			;Note E-6
	db $d1			;Wait 18
	db $44			;Note G#6
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_063:
	db $36			;Note F#5
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $36			;Note F#5
					;Wait Repeat 4
	db $36			;Note F#5
	db $c1			;Wait 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $36			;Note F#5
	db $c3			;Wait 4
	db $36			;Note F#5
					;Wait Repeat 4
	db $36			;Note F#5
	db $c1			;Wait 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3d			;Note C#6
					;Wait Repeat 2
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $3b			;Note B-5
					;Wait Repeat 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3d			;Note C#6
					;Wait Repeat 2
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $3b			;Note B-5
					;Wait Repeat 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $38			;Note G#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_067:
	db $c1			;Wait 2
	db $36			;Note F#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $3f			;Note D#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3f			;Note D#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3f			;Note D#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3f			;Note D#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $37			;Note G-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3e			;Note D-6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $37			;Note G-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3e			;Note D-6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $39			;Note A-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $40			;Note E-6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $39			;Note A-5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $40			;Note E-6
	db $74			;Instrument 2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_069:
	db $42			;Note F#6
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3f			;Note D#6
	db $c1			;Wait 2
	db $3a			;Note A#5
	db $cd			;Wait 14
	db $33			;Note D#5
	db $c3			;Wait 4
	db $36			;Note F#5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $39			;Note A-5
	db $c7			;Wait 8
	db $39			;Note A-5
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $3b			;Note B-5
					;Wait Repeat 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $38			;Note G#5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_070:
	db $c1			;Wait 2
	db $42			;Note F#6
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3f			;Note D#6
	db $c1			;Wait 2
	db $3a			;Note A#5
	db $cd			;Wait 14
	db $33			;Note D#5
	db $c3			;Wait 4
	db $36			;Note F#5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $39			;Note A-5
	db $c7			;Wait 8
	db $39			;Note A-5
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $3b			;Note B-5
					;Wait Repeat 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $38			;Note G#5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_071:
	db $3a			;Note A#5
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $36			;Note F#5
	db $c1			;Wait 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $36			;Note F#5
					;Wait Repeat 2
	db $3a			;Note A#5
	db $c3			;Wait 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $36			;Note F#5
	db $c1			;Wait 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $36			;Note F#5
					;Wait Repeat 2
	db $39			;Note A-5
	db $c3			;Wait 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $36			;Note F#5
					;Wait Repeat 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3d			;Note C#6
					;Wait Repeat 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $42			;Note F#6
					;Wait Repeat 2
	db $44			;Note G#6
					;Wait Repeat 2
	db $45			;Note A-6
					;Wait Repeat 2
	db $44			;Note G#6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_073:
	db $31			;Note C#5
	db $6a			;Volume 8
	db $72			;Instrument 0
	db $c0			;Wait 1
	db $25			;Note C#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $33			;Note D#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $27			;Note D#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $36			;Note F#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2a			;Note F#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $38			;Note G#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2c			;Note G#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $31			;Note C#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $25			;Note C#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $33			;Note D#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $27			;Note D#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $36			;Note F#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2a			;Note F#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $38			;Note G#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2c			;Note G#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $31			;Note C#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $25			;Note C#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $33			;Note D#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $27			;Note D#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $36			;Note F#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2a			;Note F#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $38			;Note G#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2c			;Note G#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $31			;Note C#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $25			;Note C#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $33			;Note D#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $27			;Note D#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $36			;Note F#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2a			;Note F#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $38			;Note G#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2c			;Note G#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $31			;Note C#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $25			;Note C#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $33			;Note D#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $27			;Note D#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $38			;Note G#5
					;Wait Repeat 1
	db $2c			;Note G#4
					;Wait Repeat 1
	db $3d			;Note C#6
					;Wait Repeat 1
	db $31			;Note C#5
	db $c0			;Wait 1
	db $31			;Note C#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $25			;Note C#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $33			;Note D#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $27			;Note D#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $38			;Note G#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2c			;Note G#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $3d			;Note C#6
					;Wait Repeat 1
	db $31			;Note C#5
	db $c0			;Wait 1
	db $31			;Note C#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $25			;Note C#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $33			;Note D#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $27			;Note D#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $36			;Note F#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2a			;Note F#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $38			;Note G#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2c			;Note G#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $31			;Note C#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $25			;Note C#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $33			;Note D#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $27			;Note D#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $36			;Note F#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2a			;Note F#4
	db $75			;Instrument 3
					;Wait Repeat 1
	db $38			;Note G#5
	db $72			;Instrument 0
					;Wait Repeat 1
	db $2c			;Note G#4
	db $75			;Instrument 3
	db $bf			;[End-Of-Track]
.track_074:
	db $31			;Note C#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $31			;Note C#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $31			;Note C#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $31			;Note C#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $31			;Note C#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $31			;Note C#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $31			;Note C#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $31			;Note C#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $36			;Note F#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_075:
	db $c1			;Wait 2
	db $33			;Note D#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $3d			;Note C#6
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $33			;Note D#5
	db $74			;Instrument 2
					;Wait Repeat 4
	db $38			;Note G#5
	db $74			;Instrument 2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_076:
	db $0d			;Note C#2
	db $76			;Instrument 4
	db $c3			;Wait 4
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
					;Wait Repeat 2
	db $0d			;Note C#2
	db $c3			;Wait 4
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
					;Wait Repeat 2
	db $0d			;Note C#2
	db $c3			;Wait 4
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
					;Wait Repeat 2
	db $0d			;Note C#2
	db $c3			;Wait 4
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
					;Wait Repeat 2
	db $0d			;Note C#2
	db $c3			;Wait 4
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
					;Wait Repeat 2
	db $0d			;Note C#2
	db $c3			;Wait 4
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
					;Wait Repeat 2
	db $0d			;Note C#2
	db $c3			;Wait 4
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
					;Wait Repeat 2
	db $0d			;Note C#2
	db $c3			;Wait 4
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_077:
	db $0d			;Note C#2
	db $75			;Instrument 3
	db $dd			;Wait 30
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_078:
	db $19			;Note C#3
	db $75			;Instrument 3
	db $dd			;Wait 30
	db $0d			;Note C#2
	db $c1			;Wait 2
	db $0d			;Note C#2
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_079:
	db $0d			;Note C#2
	db $7d			;Instrument 11
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_085:
	db $3d			;Note C#6
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $3d			;Note C#6
	db $c1			;Wait 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $3d			;Note C#6
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3d			;Note C#6
					;Wait Repeat 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $3d			;Note C#6
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $3d			;Note C#6
	db $c1			;Wait 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $3d			;Note C#6
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $38			;Note G#5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_086:
	db $38			;Note G#5
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $38			;Note G#5
	db $c3			;Wait 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $31			;Note C#5
	db $c1			;Wait 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $38			;Note G#5
	db $c3			;Wait 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $38			;Note G#5
	db $c3			;Wait 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $31			;Note C#5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_092:
	db $12			;Note F#2
	db $76			;Instrument 4
	db $c3			;Wait 4
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $12			;Note F#2
	db $c3			;Wait 4
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $12			;Note F#2
	db $c3			;Wait 4
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $12			;Note F#2
	db $c3			;Wait 4
	db $1e			;Note F#3
	db $c1			;Wait 2
	db $1e			;Note F#3
					;Wait Repeat 2
	db $14			;Note G#2
	db $c3			;Wait 4
	db $20			;Note G#3
	db $c1			;Wait 2
	db $20			;Note G#3
					;Wait Repeat 2
	db $14			;Note G#2
	db $c3			;Wait 4
	db $20			;Note G#3
	db $c1			;Wait 2
	db $20			;Note G#3
					;Wait Repeat 2
	db $14			;Note G#2
	db $c3			;Wait 4
	db $20			;Note G#3
	db $c1			;Wait 2
	db $20			;Note G#3
					;Wait Repeat 2
	db $14			;Note G#2
	db $c3			;Wait 4
	db $20			;Note G#3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_096:
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $5f			;Note B-8
	db $6f			;Volume 13
					;Wait Repeat 2
	db $26			;Note D-4
	db $71			;Volume 15
	db $79			;Instrument 7
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_097:
	db $25			;Note C#4
	db $75			;Instrument 3
	db $93,$05			;CMD Portamento down
	db $dd			;Wait 30
	db $97,$8c			;CMD Vibrato + Volume slide
	db $d9			;Wait 26
	db $60			;Release 96
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $a4,$a0			;CMD Speed
	db $c3			;Wait 4
	db $a4,$09			;CMD Speed
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_098:
	db $60			;Release 96
	db $f7			;Wait 56
	db $60			;Release 96
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_100:
	db $0d			;Note C#2
	db $75			;Instrument 3
	db $dd			;Wait 30
	db $0d			;Note C#2
	db $c1			;Wait 2
	db $0d			;Note C#2
	db $d7			;Wait 24
	db $60			;Release 96
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_101:
	db $19			;Note C#3
	db $75			;Instrument 3
	db $dd			;Wait 30
	db $19			;Note C#3
	db $c1			;Wait 2
	db $19			;Note C#3
	db $d7			;Wait 24
	db $60			;Release 96
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_102:
	db $31			;Note C#5
	db $77			;Instrument 5
	db $96,$01			;CMD Portamento up
	db $dd			;Wait 30
	db $60			;Release 96
	db $c0			;Wait 1
	db $9c			;CMD End 
	db $d8			;Wait 25
	db $60			;Release 96
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_103:
	db $0d			;Note C#2
	db $7d			;Instrument 11
	db $f7			;Wait 56
	db $60			;Release 96
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_109:
	db $3d			;Note C#6
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $3d			;Note C#6
	db $c1			;Wait 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $3d			;Note C#6
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3d			;Note C#6
					;Wait Repeat 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $3d			;Note C#6
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $3d			;Note C#6
	db $c1			;Wait 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $40			;Note E-6
					;Wait Repeat 2
	db $3f			;Note D#6
					;Wait Repeat 2
	db $3d			;Note C#6
	db $c3			;Wait 4
	db $3d			;Note C#6
					;Wait Repeat 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3d			;Note C#6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_110:
	db $38			;Note G#5
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $38			;Note G#5
	db $c3			;Wait 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $31			;Note C#5
	db $c1			;Wait 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $38			;Note G#5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $38			;Note G#5
	db $c3			;Wait 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $38			;Note G#5
	db $c1			;Wait 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $38			;Note G#5
	db $c3			;Wait 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $31			;Note C#5
	db $c1			;Wait 2
	db $33			;Note D#5
					;Wait Repeat 2
	db $36			;Note F#5
					;Wait Repeat 2
	db $38			;Note G#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]

