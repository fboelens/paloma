; Song: Palomas Resque L1 Haunted Castle
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
	dw .track_016, .track_017, .track_018, .track_019, .track_020, .track_021, .track_022, .track_023	; Step:002 Pattern:002
	dw .track_024, .track_025, .track_018, .track_019, .track_028, .track_021, .track_030, .track_031	; Step:003 Pattern:003
	dw .track_032, .track_033, .track_034, .track_035, .track_036, .track_037, .track_038, .track_039	; Step:004 Pattern:004
	dw .track_040, .track_041, .track_042, .track_043, .track_044, .track_045, .track_046, .track_047	; Step:005 Pattern:005
	dw .track_048, .track_049, .track_050, .track_035, .track_036, .track_037, .track_054, .track_055	; Step:006 Pattern:006
	dw .track_056, .track_057, .track_058, .track_059, .track_060, .track_045, .track_062, .track_063	; Step:007 Pattern:007
	dw 0x0000, .restart				; End of sequence delimiter + restart address.

; [ Custom FM voices ]
.customvoice_start:
	db $73,$71,$16,$04,$a9,$80,$11,$34 		; Custom voice:47

; [ FM Drum macros]
.drummacro_start:
	dw .drum_00
	dw .drum_02
	dw .drum_04
	dw .drum_06

.drum_00:						; Drum 0.                 
	db $04, $00							; volume Base drum
	db $12, $ab, $04						; note Bdrum
	db $1e, $10							; Percussion
	db $02							; STOP - End of Drum macro

.drum_02:						; Drum 1.                 
	db $08, $00							; volume HiHat
	db $16, $ab, $06						; note Snare 
	db $1e, $08							; Percussion
	db $02							; STOP - End of Drum macro

.drum_04:						; Drum 3.                 
	db $06, $00							; volume Snare
	db $1e, $01							; Percussion
	db $02							; STOP - End of Drum macro

.drum_06:						; Drum 5.                 
	db $1e, $12							; Percussion
	db $02							; STOP - End of Drum macro

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic noise1
	dw .instrument_01				; PSG sonic       
	dw .instrument_02				; PSG sonic mod   
	dw .instrument_03				; FM+harpsicord   
	dw .instrument_04				; FM ACCBASS      
	dw .instrument_05				; FM Clarinet     
	dw .instrument_06				; BD POW Solid    
	dw .instrument_07				; SD POW Solid    
	dw .instrument_08				; HH close So HI  
	dw .instrument_09				;                 
	dw .instrument_10				;                 

.instrument_00:					; PSG sonic noise1
	db $0F					; FM Hardware Voice was not set
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

.instrument_01:					; PSG sonic       
	db $0F					; FM Hardware Voice was not set
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
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $0c,$02						; Volume -
	db $02,$10						; Mixer (T)
	db $0c,$02						; Volume -
	db $18,$f7						; Loop (-10)

.instrument_02:					; PSG sonic mod   
	db $0F					; FM Hardware Voice was not set
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $08,$0c						; Volume _
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $08,$0c						; Volume _
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

.instrument_03:					; FM+harpsicord   
	db $b0					; FM Hardware Voice 11
								; --- Macro loop
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
	db $18,$cc						; Loop (-53)

.instrument_04:					; FM ACCBASS      
	db $e0					; FM Hardware Voice 14
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_05:					; FM Clarinet     
	db $50					; FM Hardware Voice 5
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_06:					; BD POW Solid    
	db $0F					; FM Hardware Voice was not set
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
	db $08,$0a						; Volume _
	db $02,$90						; Mixer (TN)
	db $08,$06						; Volume _
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $0c,$0f						; Volume -
	db $18,$fb						; Loop (-6)

.instrument_09:					;                 
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
	db $08,$0e						; Volume _
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
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $18,$ce						; Loop (-51)

.instrument_10:					;                 
	db $00,$04					; FM Software Voice 0
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $18,$df						; Loop (-34)


; [ Song track data ]
.track_000:
	db $0e			;Note D-2
	db $71			;Volume 15
	db $72			;Instrument 0
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $26			;Note D-4
	db $79			;Instrument 7
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0d			;Note C#2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0d			;Note C#2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0d			;Note C#2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $10			;Note E-2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $10			;Note E-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $10			;Note E-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_001:
	db $29			;Note F-4
	db $71			;Volume 15
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $32			;Note D-5
	db $cb			;Wait 12
	db $30			;Note C-5
	db $c1			;Wait 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $73			;Instrument 1
	db $c1			;Wait 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $74			;Instrument 2
					;Wait Repeat 4
	db $2d			;Note A-4
	db $73			;Instrument 1
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $28			;Note E-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_002:
	db $1a			;Note D-3
	db $71			;Volume 15
	db $76			;Instrument 4
	db $c7			;Wait 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $19			;Note C#3
	db $c7			;Wait 8
	db $19			;Note C#3
					;Wait Repeat 8
	db $1c			;Note E-3
					;Wait Repeat 8
	db $1c			;Note E-3
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_003:
	db $32			;Note D-5
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $31			;Note C#5
					;Wait Repeat 8
	db $31			;Note C#5
					;Wait Repeat 8
	db $31			;Note C#5
					;Wait Repeat 8
	db $31			;Note C#5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_004:
	db $35			;Note F-5
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $35			;Note F-5
	db $c3			;Wait 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $39			;Note A-5
	db $c7			;Wait 8
	db $39			;Note A-5
					;Wait Repeat 8
	db $34			;Note E-5
					;Wait Repeat 8
	db $37			;Note G-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_005:
	db $29			;Note F-4
	db $71			;Volume 15
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $32			;Note D-5
	db $cb			;Wait 12
	db $30			;Note C-5
	db $c1			;Wait 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2d			;Note A-4
	db $c1			;Wait 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $28			;Note E-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_006:
	db $1a			;Note D-3
	db $71			;Volume 15
	db $75			;Instrument 3
	db $c7			;Wait 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $19			;Note C#3
					;Wait Repeat 8
	db $19			;Note C#3
					;Wait Repeat 8
	db $1c			;Note E-3
					;Wait Repeat 8
	db $1c			;Note E-3
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_007:
	db $71			;Volume 15
	db $72			;Instrument 0
	db $c1			;Wait 2
	db $60			;Release 96
	db $fd			;Wait 62
	db $bf			;[End-Of-Track]
.track_008:
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $26			;Note D-4
	db $79			;Instrument 7
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0d			;Note C#2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0d			;Note C#2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0d			;Note C#2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $10			;Note E-2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $10			;Note E-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $26			;Note D-4
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_009:
	db $29			;Note F-4
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $32			;Note D-5
	db $cb			;Wait 12
	db $30			;Note C-5
	db $c1			;Wait 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $73			;Instrument 1
	db $c1			;Wait 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $74			;Instrument 2
					;Wait Repeat 4
	db $2d			;Note A-4
	db $73			;Instrument 1
					;Wait Repeat 4
	db $2f			;Note B-4
					;Wait Repeat 4
	db $31			;Note C#5
					;Wait Repeat 4
	db $34			;Note E-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_010:
	db $1a			;Note D-3
	db $76			;Instrument 4
	db $c7			;Wait 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $19			;Note C#3
	db $c3			;Wait 4
	db $19			;Note C#3
					;Wait Repeat 4
	db $19			;Note C#3
					;Wait Repeat 4
	db $19			;Note C#3
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $19			;Note C#3
					;Wait Repeat 4
	db $1c			;Note E-3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_011:
	db $32			;Note D-5
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $31			;Note C#5
					;Wait Repeat 8
	db $31			;Note C#5
					;Wait Repeat 8
	db $31			;Note C#5
					;Wait Repeat 8
	db $31			;Note C#5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_012:
	db $35			;Note F-5
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $35			;Note F-5
	db $c3			;Wait 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $39			;Note A-5
	db $c7			;Wait 8
	db $39			;Note A-5
					;Wait Repeat 8
	db $34			;Note E-5
					;Wait Repeat 8
	db $37			;Note G-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_013:
	db $29			;Note F-4
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $26			;Note D-4
	db $7c			;Instrument 10
					;Wait Repeat 4
	db $32			;Note D-5
	db $7c			;Instrument 10
	db $cb			;Wait 12
	db $30			;Note C-5
	db $7c			;Instrument 10
	db $c1			;Wait 2
	db $2e			;Note A#4
	db $7c			;Instrument 10
					;Wait Repeat 2
	db $2d			;Note A-4
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $7c			;Instrument 10
	db $c1			;Wait 2
	db $2e			;Note A#4
	db $7c			;Instrument 10
					;Wait Repeat 2
	db $2d			;Note A-4
	db $7c			;Instrument 10
					;Wait Repeat 2
	db $2e			;Note A#4
	db $7c			;Instrument 10
					;Wait Repeat 2
	db $2d			;Note A-4
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $7c			;Instrument 10
					;Wait Repeat 4
	db $2d			;Note A-4
	db $7c			;Instrument 10
					;Wait Repeat 4
	db $2f			;Note B-4
	db $7c			;Instrument 10
					;Wait Repeat 4
	db $31			;Note C#5
	db $7c			;Instrument 10
					;Wait Repeat 4
	db $34			;Note E-5
	db $7c			;Instrument 10
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_014:
	db $1a			;Note D-3
	db $75			;Instrument 3
	db $c7			;Wait 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $1a			;Note D-3
					;Wait Repeat 8
	db $19			;Note C#3
					;Wait Repeat 8
	db $19			;Note C#3
					;Wait Repeat 8
	db $1c			;Note E-3
					;Wait Repeat 8
	db $1c			;Note E-3
	db $c3			;Wait 4
	db $10			;Note E-2
	db $96,$10			;CMD Portamento up
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_015:
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_016:
	db $11			;Note F-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $11			;Note F-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $11			;Note F-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $13			;Note G-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $13			;Note G-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $13			;Note G-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_017:
	db $39			;Note A-5
	db $74			;Instrument 2
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $24			;Note C-4
					;Wait Repeat 2
	db $26			;Note D-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_018:
	db $11			;Note F-2
	db $c3			;Wait 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $11			;Note F-2
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $13			;Note G-2
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $13			;Note G-2
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $0c			;Note C-2
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $0c			;Note C-2
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $0c			;Note C-2
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $0c			;Note C-2
					;Wait Repeat 4
	db $18			;Note C-3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_019:
	db $35			;Note F-5
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $30			;Note C-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_020:
	db $30			;Note C-5
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $32			;Note D-5
	db $c3			;Wait 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $37			;Note G-5
	db $c7			;Wait 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $37			;Note G-5
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $43			;Note G-6
	db $c0			;Wait 1
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
	db $bf			;[End-Of-Track]
.track_021:
	db $39			;Note A-5
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $24			;Note C-4
					;Wait Repeat 2
	db $26			;Note D-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_022:
	db $1d			;Note F-3
	db $75			;Instrument 3
	db $9c			;CMD End 
	db $c3			;Wait 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_023:
	db $35			;Note F-5
	db $70			;Volume 14
	db $77			;Instrument 5
	db $c0			;Wait 1
	db $29			;Note F-4
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $35			;Note F-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $35			;Note F-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $35			;Note F-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $37			;Note G-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3a			;Note A#5
	db $70			;Volume 14
					;Wait Repeat 1
	db $37			;Note G-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3e			;Note D-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3a			;Note A#5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3a			;Note A#5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $37			;Note G-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3a			;Note A#5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3a			;Note A#5
	db $70			;Volume 14
					;Wait Repeat 1
	db $37			;Note G-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3e			;Note D-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3a			;Note A#5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $41			;Note F-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $35			;Note F-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $37			;Note G-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $37			;Note G-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $37			;Note G-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $37			;Note G-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $46			;Note A#6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $46			;Note A#6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
	db $bf			;[End-Of-Track]
.track_024:
	db $11			;Note F-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $11			;Note F-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $11			;Note F-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $13			;Note G-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $13			;Note G-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $13			;Note G-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $26			;Note D-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $9d,$04			;CMD Drum $04
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
	db $c1			;Wait 2
	db $26			;Note D-4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_025:
	db $39			;Note A-5
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $24			;Note C-4
					;Wait Repeat 2
	db $26			;Note D-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_028:
	db $30			;Note C-5
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $32			;Note D-5
	db $c3			;Wait 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $37			;Note G-5
	db $c7			;Wait 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $37			;Note G-5
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $37			;Note G-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_030:
	db $1d			;Note F-3
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $18			;Note C-3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_031:
	db $35			;Note F-5
	db $70			;Volume 14
	db $77			;Instrument 5
	db $c0			;Wait 1
	db $29			;Note F-4
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $35			;Note F-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $35			;Note F-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $35			;Note F-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $37			;Note G-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3a			;Note A#5
	db $70			;Volume 14
					;Wait Repeat 1
	db $37			;Note G-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3e			;Note D-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3a			;Note A#5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3a			;Note A#5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $37			;Note G-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3a			;Note A#5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3a			;Note A#5
	db $70			;Volume 14
					;Wait Repeat 1
	db $37			;Note G-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3e			;Note D-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3a			;Note A#5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $41			;Note F-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $35			;Note F-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $37			;Note G-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $37			;Note G-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $37			;Note G-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $37			;Note G-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $46			;Note A#6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $46			;Note A#6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $60			;Release 96
	db $6d			;Volume 11
					;Wait Repeat 1
	db $70			;Volume 14
					;Wait Repeat 1
	db $6d			;Volume 11
	db $bf			;[End-Of-Track]
.track_032:
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $9d,$06			;CMD Drum $06
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $0a			;Note A#1
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0a			;Note A#1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0a			;Note A#1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $11			;Note F-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $11			;Note F-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $9d,$02			;CMD Drum $02
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_033:
	db $26			;Note D-4
	db $74			;Instrument 2
	db $c1			;Wait 2
	db $91,$20			;CMD Portamento tone
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c1			;Wait 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $c1			;Wait 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $28			;Note E-4
	db $c0			;Wait 1
	db $26			;Note D-4
					;Wait Repeat 1
	db $28			;Note E-4
					;Wait Repeat 1
	db $26			;Note D-4
					;Wait Repeat 1
	db $28			;Note E-4
	db $c1			;Wait 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $29			;Note F-4
	db $c0			;Wait 1
	db $28			;Note E-4
					;Wait Repeat 1
	db $29			;Note F-4
					;Wait Repeat 1
	db $28			;Note E-4
					;Wait Repeat 1
	db $29			;Note F-4
	db $c1			;Wait 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $29			;Note F-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_034:
	db $0e			;Note D-2
	db $76			;Instrument 4
	db $c7			;Wait 8
	db $11			;Note F-2
	db $c3			;Wait 4
	db $15			;Note A-2
					;Wait Repeat 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $13			;Note G-2
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c7			;Wait 8
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $10			;Note E-2
					;Wait Repeat 4
	db $11			;Note F-2
					;Wait Repeat 4
	db $11			;Note F-2
					;Wait Repeat 4
	db $13			;Note G-2
					;Wait Repeat 4
	db $15			;Note A-2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_035:
	db $32			;Note D-5
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $2e			;Note A#4
					;Wait Repeat 8
	db $2e			;Note A#4
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $2d			;Note A-4
					;Wait Repeat 8
	db $2d			;Note A-4
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_036:
	db $2d			;Note A-4
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $2d			;Note A-4
					;Wait Repeat 8
	db $2b			;Note G-4
					;Wait Repeat 8
	db $2b			;Note G-4
					;Wait Repeat 8
	db $2b			;Note G-4
					;Wait Repeat 8
	db $2b			;Note G-4
					;Wait Repeat 8
	db $29			;Note F-4
					;Wait Repeat 8
	db $29			;Note F-4
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_037:
	db $35			;Note F-5
	db $7b			;Instrument 9
	db $c7			;Wait 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $34			;Note E-5
					;Wait Repeat 8
	db $34			;Note E-5
					;Wait Repeat 8
	db $34			;Note E-5
					;Wait Repeat 8
	db $34			;Note E-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_038:
	db $32			;Note D-5
	db $75			;Instrument 3
	db $c3			;Wait 4
	db $39			;Note A-5
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $34			;Note E-5
	db $c0			;Wait 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $34			;Note E-5
					;Wait Repeat 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c3			;Wait 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $35			;Note F-5
	db $c0			;Wait 1
	db $34			;Note E-5
					;Wait Repeat 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $34			;Note E-5
					;Wait Repeat 1
	db $35			;Note F-5
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
	db $c3			;Wait 4
	db $35			;Note F-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_039:
	db $60			;Release 96
	db $c9			;Wait 10
	db $26			;Note D-4
	db $71			;Volume 15
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $d1			;Wait 18
	db $24			;Note C-4
	db $c1			;Wait 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_040:
	db $0a			;Note A#1
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0a			;Note A#1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0a			;Note A#1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $13			;Note G-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $51			;Note A-7
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $13			;Note G-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $13			;Note G-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $15			;Note A-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $15			;Note A-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $15			;Note A-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $09			;Note A-1
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $09			;Note A-1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $26			;Note D-4
	db $79			;Instrument 7
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $26			;Note D-4
	db $c0			;Wait 1
	db $26			;Note D-4
					;Wait Repeat 1
	db $26			;Note D-4
	db $c1			;Wait 2
	db $26			;Note D-4
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_041:
	db $2e			;Note A#4
	db $74			;Instrument 2
	db $c1			;Wait 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2b			;Note G-4
	db $c0			;Wait 1
	db $29			;Note F-4
					;Wait Repeat 1
	db $28			;Note E-4
	db $c1			;Wait 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $28			;Note E-4
	db $c3			;Wait 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $28			;Note E-4
	db $c0			;Wait 1
	db $26			;Note D-4
					;Wait Repeat 1
	db $28			;Note E-4
	db $c9			;Wait 10
	db $26			;Note D-4
	db $c3			;Wait 4
	db $25			;Note C#4
	db $9c			;CMD End 
	db $c0			;Wait 1
	db $23			;Note B-3
					;Wait Repeat 1
	db $25			;Note C#4
	db $c1			;Wait 2
	db $26			;Note D-4
	db $6f			;Volume 13
	db $73			;Instrument 1
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $31			;Note C#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_042:
	db $16			;Note A#2
	db $76			;Instrument 4
	db $c3			;Wait 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $11			;Note F-2
					;Wait Repeat 4
	db $13			;Note G-2
					;Wait Repeat 4
	db $13			;Note G-2
					;Wait Repeat 4
	db $1a			;Note D-3
					;Wait Repeat 4
	db $1c			;Note E-3
					;Wait Repeat 4
	db $10			;Note E-2
	db $c0			;Wait 1
	db $15			;Note A-2
	db $91,$07			;CMD Portamento tone
	db $c6			;Wait 7
	db $9c			;CMD End 
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_043:
	db $2e			;Note A#4
	db $7b			;Instrument 9
	db $c3			;Wait 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_044:
	db $29			;Note F-4
	db $7b			;Instrument 9
	db $c3			;Wait 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_045:
	db $32			;Note D-5
	db $7b			;Instrument 9
	db $c3			;Wait 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $31			;Note C#5
					;Wait Repeat 4
	db $31			;Note C#5
					;Wait Repeat 4
	db $31			;Note C#5
					;Wait Repeat 4
	db $31			;Note C#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_046:
	db $3a			;Note A#5
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3a			;Note A#5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c0			;Wait 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c3			;Wait 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $34			;Note E-5
	db $c0			;Wait 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $34			;Note E-5
	db $c9			;Wait 10
	db $32			;Note D-5
	db $c3			;Wait 4
	db $31			;Note C#5
	db $c0			;Wait 1
	db $2f			;Note B-4
					;Wait Repeat 1
	db $31			;Note C#5
	db $cd			;Wait 14
	db $bf			;[End-Of-Track]
.track_047:
	db $c9			;Wait 10
	db $22			;Note A#3
	db $71			;Volume 15
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $24			;Note C-4
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
	db $c3			;Wait 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $21			;Note A-3
	db $d1			;Wait 18
	db $25			;Note C#4
	db $c1			;Wait 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $31			;Note C#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_048:
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0e			;Note D-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0a			;Note A#1
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0a			;Note A#1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0a			;Note A#1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0c			;Note C-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $10			;Note E-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $11			;Note F-2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $11			;Note F-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c0			;Wait 1
	db $26			;Note D-4
	db $79			;Instrument 7
	db $bf			;[End-Of-Track]
.track_049:
	db $32			;Note D-5
	db $73			;Instrument 1
	db $c1			;Wait 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c0			;Wait 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $37			;Note G-5
					;Wait Repeat 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2b			;Note G-4
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_050:
	db $0e			;Note D-2
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $10			;Note E-2
					;Wait Repeat 2
	db $1d			;Note F-3
					;Wait Repeat 2
	db $11			;Note F-2
					;Wait Repeat 2
	db $1d			;Note F-3
					;Wait Repeat 2
	db $15			;Note A-2
					;Wait Repeat 2
	db $21			;Note A-3
					;Wait Repeat 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $13			;Note G-2
					;Wait Repeat 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $0c			;Note C-2
					;Wait Repeat 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
					;Wait Repeat 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $10			;Note E-2
					;Wait Repeat 2
	db $1c			;Note E-3
					;Wait Repeat 2
	db $11			;Note F-2
					;Wait Repeat 2
	db $1d			;Note F-3
					;Wait Repeat 2
	db $11			;Note F-2
					;Wait Repeat 2
	db $1d			;Note F-3
					;Wait Repeat 2
	db $13			;Note G-2
					;Wait Repeat 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $15			;Note A-2
					;Wait Repeat 2
	db $21			;Note A-3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_054:
	db $a2,$02			;CMD Track detune
	db $c1			;Wait 2
	db $32			;Note D-5
	db $6f			;Volume 13
	db $75			;Instrument 3
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c0			;Wait 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $37			;Note G-5
					;Wait Repeat 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_055:
	db $32			;Note D-5
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $29			;Note F-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c0			;Wait 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $37			;Note G-5
					;Wait Repeat 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $2e			;Note A#4
					;Wait Repeat 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2b			;Note G-4
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_056:
	db $0a			;Note A#1
	db $72			;Instrument 0
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0a			;Note A#1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $0a			;Note A#1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $13			;Note G-2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $13			;Note G-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $13			;Note G-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $15			;Note A-2
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $15			;Note A-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $26			;Note D-4
	db $79			;Instrument 7
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $15			;Note A-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $09			;Note A-1
	db $72			;Instrument 0
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $09			;Note A-1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c0			;Wait 1
	db $5f			;Note B-8
	db $c0			;Wait 1
	db $26			;Note D-4
	db $79			;Instrument 7
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
					;Wait Repeat 2
	db $09			;Note A-1
	db $78			;Instrument 6
					;Wait Repeat 2
	db $5f			;Note B-8
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_057:
	db $2e			;Note A#4
	db $c1			;Wait 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c2			;Wait 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $2e			;Note A#4
	db $c1			;Wait 2
	db $2d			;Note A-4
	db $c0			;Wait 1
	db $2b			;Note G-4
					;Wait Repeat 1
	db $2d			;Note A-4
	db $c9			;Wait 10
	db $26			;Note D-4
	db $c3			;Wait 4
	db $25			;Note C#4
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_058:
	db $16			;Note A#2
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $11			;Note F-2
					;Wait Repeat 2
	db $1d			;Note F-3
					;Wait Repeat 2
	db $13			;Note G-2
					;Wait Repeat 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $13			;Note G-2
					;Wait Repeat 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $10			;Note E-2
					;Wait Repeat 2
	db $1c			;Note E-3
					;Wait Repeat 2
	db $15			;Note A-2
					;Wait Repeat 2
	db $21			;Note A-3
	db $c5			;Wait 6
	db $13			;Note G-2
	db $c2			;Wait 3
	db $11			;Note F-2
					;Wait Repeat 3
	db $10			;Note E-2
					;Wait Repeat 3
	db $0e			;Note D-2
					;Wait Repeat 3
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $15			;Note A-2
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_059:
	db $2e			;Note A#4
	db $7b			;Instrument 9
	db $c3			;Wait 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $2d			;Note A-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_060:
	db $29			;Note F-4
	db $7b			;Instrument 9
	db $c3			;Wait 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $28			;Note E-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_062:
	db $c1			;Wait 2
	db $2e			;Note A#4
	db $6f			;Volume 13
	db $75			;Instrument 3
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c2			;Wait 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $2e			;Note A#4
	db $c1			;Wait 2
	db $2d			;Note A-4
	db $c0			;Wait 1
	db $2b			;Note G-4
					;Wait Repeat 1
	db $2d			;Note A-4
	db $c9			;Wait 10
	db $26			;Note D-4
	db $c3			;Wait 4
	db $25			;Note C#4
	db $cb			;Wait 12
	db $a2,$00			;CMD Track detune
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_063:
	db $2e			;Note A#4
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
	db $c1			;Wait 2
	db $37			;Note G-5
	db $71			;Volume 15
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c2			;Wait 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $2e			;Note A#4
	db $c1			;Wait 2
	db $2d			;Note A-4
	db $c0			;Wait 1
	db $2b			;Note G-4
					;Wait Repeat 1
	db $2d			;Note A-4
	db $c9			;Wait 10
	db $26			;Note D-4
	db $c3			;Wait 4
	db $25			;Note C#4
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]

