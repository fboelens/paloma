; Song: Palomas rescue - ending         
; By:   F.Boelens Feb2024               
; Period table: A440 Modern

; [ Song start data ]
	db $04					; Initial song speed.
	db $80					; Channel setup.
	dw .customvoice_start-8			; Start of the custom voices data.
	dw .drummacro_start			; Start of the drum macro data.
	dw .instrument_start			; Start of the instrument data.

; [ Song order pointer list ]
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_006, .track_007	; Step:000 Pattern:000
	dw .track_008, .track_009, .track_010, .track_011, .track_012, .track_013, .track_014, .track_015	; Step:001 Pattern:001
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_006, .track_007	; Step:002 Pattern:000
	dw .track_008, .track_017, .track_018, .track_019, .track_020, .track_021, .track_022, .track_015	; Step:003 Pattern:002
	dw .track_024, .track_010, .track_026, .track_027, .track_028, .track_029, .track_030, .track_015	; Step:004 Pattern:003
	dw .track_024, .track_010, .track_026, .track_035, .track_028, .track_037, .track_030, .track_015	; Step:005 Pattern:004
	dw .track_024, .track_041, .track_042, .track_043, .track_020, .track_045, .track_046, .track_015	; Step:006 Pattern:005
	dw .track_024, .track_049, .track_050, .track_043, .track_020, .track_053, .track_054, .track_015	; Step:007 Pattern:006
	dw .track_024, .track_041, .track_042, .track_043, .track_020, .track_045, .track_046, .track_015	; Step:008 Pattern:005
	dw .track_024, .track_049, .track_050, .track_043, .track_020, .track_053, .track_054, .track_015	; Step:009 Pattern:006
	dw .track_024, .track_041, .track_042, .track_043, .track_020, .track_045, .track_046, .track_015	; Step:010 Pattern:005
	dw .track_056, .track_020, .track_058, .track_059, .track_060, .track_061, .track_062, .track_015	; Step:011 Pattern:007
	dw .track_064, .track_065, .track_066, .track_067, .track_068, .track_066, .track_070, .track_071	; Step:012 Pattern:008
	dw .track_072, .track_073, .track_074, .track_075, .track_076, .track_077, .track_078, .track_079	; Step:013 Pattern:009
	dw 0x0000, 0x0000				; End of sequence delimiter + end of song.

; [ Custom FM voices ]
.customvoice_start:
	db $43,$61,$41,$00,$f9,$f6,$fc,$fc 		; Custom voice:148

; [ FM Drum macros]
.drummacro_start:
	dw .drum_00
	dw .drum_02
	dw .drum_04

.drum_00:						; Drum 0.                 
	db $1e, $10							; Percussion
	db $02							; STOP - End of Drum macro

.drum_02:						; Drum 1.                 
	db $1e, $08							; Percussion
	db $02							; STOP - End of Drum macro

.drum_04:						; Drum 3.                 
	db $06, $00							; volume Snare
	db $0e, $00							; volume Tom
	db $16, $ab, $06						; note Snare 
	db $1a, $ab, $08						; note Cymbal 
	db $1e, $03							; Percussion
	db $02							; STOP - End of Drum macro

; [ Instruments]
.instrument_start:
	dw .instrument_00				; FM trumpet      
	dw .instrument_01				; BD POW Solid    
	dw .instrument_02				; HH close So HI  
	dw .instrument_03				; FM Violin       
	dw .instrument_04				; FM Heavy bass   
	dw .instrument_05				;                 

.instrument_00:					; FM trumpet      
	db $70					; FM Hardware Voice 7
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
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

.instrument_01:					; BD POW Solid    
	db $f0					; FM Hardware Voice 15
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
								; --- Macro loop
	db $02,$80						; Mixer (N)
	db $08,$00						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_02:					; HH close So HI  
	db $0F					; FM Hardware Voice was not set
	db $02,$90						; Mixer (TN)
	db $0E,$00						; Noise _
	db $08,$0c						; Volume _
	db $02,$90						; Mixer (TN)
	db $08,$06						; Volume _
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $0c,$0f						; Volume -
	db $18,$fb						; Loop (-6)

.instrument_03:					; FM Violin       
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

.instrument_04:					; FM Heavy bass   
	db $f0					; FM Hardware Voice 15
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
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
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
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $18,$c1						; Loop (-64)

.instrument_05:					;                 
	db $00,$04					; FM Software Voice 0
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
	db $18,$fb						; Loop (-6)


; [ Song track data ]
.track_000:
	db $48			;Note C-7
	db $71			;Volume 15
	db $74			;Instrument 2
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $c3			;Wait 4
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $48			;Note C-7
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $c3			;Wait 4
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $48			;Note C-7
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_001:
	db $28			;Note E-4
	db $71			;Volume 15
	db $72			;Instrument 0
	db $df			;Wait 32
	db $29			;Note F-4
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_002:
	db $2b			;Note G-4
	db $71			;Volume 15
	db $72			;Instrument 0
	db $df			;Wait 32
	db $2c			;Note G#4
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_003:
	db $0c			;Note C-2
	db $71			;Volume 15
	db $76			;Instrument 4
	db $cf			;Wait 16
	db $0c			;Note C-2
					;Wait Repeat 16
	db $0c			;Note C-2
					;Wait Repeat 16
	db $0c			;Note C-2
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_004:
	db $30			;Note C-5
	db $71			;Volume 15
	db $72			;Instrument 0
	db $df			;Wait 32
	db $30			;Note C-5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_005:
	db $34			;Note E-5
	db $71			;Volume 15
	db $72			;Instrument 0
	db $df			;Wait 32
	db $35			;Note F-5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_006:
	db $37			;Note G-5
	db $71			;Volume 15
	db $72			;Instrument 0
	db $df			;Wait 32
	db $38			;Note G#5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_007:
	db $18			;Note C-3
	db $71			;Volume 15
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $18			;Note C-3
	db $c3			;Wait 4
	db $18			;Note C-3
	db $c7			;Wait 8
	db $18			;Note C-3
					;Wait Repeat 8
	db $18			;Note C-3
	db $c0			;Wait 1
	db $18			;Note C-3
					;Wait Repeat 1
	db $18			;Note C-3
					;Wait Repeat 1
	db $18			;Note C-3
					;Wait Repeat 1
	db $18			;Note C-3
	db $c7			;Wait 8
	db $18			;Note C-3
	db $c3			;Wait 4
	db $18			;Note C-3
	db $c7			;Wait 8
	db $18			;Note C-3
					;Wait Repeat 8
	db $18			;Note C-3
	db $c0			;Wait 1
	db $18			;Note C-3
					;Wait Repeat 1
	db $18			;Note C-3
					;Wait Repeat 1
	db $18			;Note C-3
	db $bf			;[End-Of-Track]
.track_008:
	db $48			;Note C-7
	db $74			;Instrument 2
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $c3			;Wait 4
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $48			;Note C-7
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $c3			;Wait 4
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $48			;Note C-7
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_009:
	db $28			;Note E-4
	db $72			;Instrument 0
	db $df			;Wait 32
	db $1f			;Note G-3
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_010:
	db $2b			;Note G-4
	db $72			;Instrument 0
	db $df			;Wait 32
	db $24			;Note C-4
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_011:
	db $0c			;Note C-2
	db $76			;Instrument 4
	db $cf			;Wait 16
	db $0c			;Note C-2
					;Wait Repeat 16
	db $0c			;Note C-2
					;Wait Repeat 16
	db $0c			;Note C-2
	db $c7			;Wait 8
	db $18			;Note C-3
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_012:
	db $30			;Note C-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $2b			;Note G-4
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_013:
	db $34			;Note E-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $30			;Note C-5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_014:
	db $37			;Note G-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $34			;Note E-5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_015:
	db $18			;Note C-3
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $18			;Note C-3
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $18			;Note C-3
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $18			;Note C-3
	db $77			;Instrument 5
					;Wait Repeat 8
	db $18			;Note C-3
	db $77			;Instrument 5
	db $c0			;Wait 1
	db $18			;Note C-3
	db $77			;Instrument 5
					;Wait Repeat 1
	db $18			;Note C-3
	db $77			;Instrument 5
					;Wait Repeat 1
	db $18			;Note C-3
	db $77			;Instrument 5
					;Wait Repeat 1
	db $18			;Note C-3
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $18			;Note C-3
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $18			;Note C-3
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $18			;Note C-3
	db $77			;Instrument 5
					;Wait Repeat 8
	db $18			;Note C-3
	db $77			;Instrument 5
	db $c0			;Wait 1
	db $18			;Note C-3
	db $77			;Instrument 5
					;Wait Repeat 1
	db $18			;Note C-3
	db $77			;Instrument 5
					;Wait Repeat 1
	db $18			;Note C-3
	db $77			;Instrument 5
	db $bf			;[End-Of-Track]
.track_017:
	db $29			;Note F-4
	db $72			;Instrument 0
	db $df			;Wait 32
	db $2e			;Note A#4
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_018:
	db $2e			;Note A#4
	db $72			;Instrument 0
	db $df			;Wait 32
	db $30			;Note C-5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_019:
	db $0c			;Note C-2
	db $76			;Instrument 4
	db $cf			;Wait 16
	db $0c			;Note C-2
					;Wait Repeat 16
	db $0c			;Note C-2
					;Wait Repeat 16
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $0c			;Note C-2
					;Wait Repeat 4
	db $18			;Note C-3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_020:
	db $35			;Note F-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $35			;Note F-5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_021:
	db $3a			;Note A#5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $3a			;Note A#5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_022:
	db $30			;Note C-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $3c			;Note C-6
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_024:
	db $48			;Note C-7
	db $74			;Instrument 2
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $c3			;Wait 4
	db $26			;Note D-4
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $48			;Note C-7
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $c3			;Wait 4
	db $26			;Note D-4
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $48			;Note C-7
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_026:
	db $30			;Note C-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $28			;Note E-4
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_027:
	db $0c			;Note C-2
	db $76			;Instrument 4
	db $c7			;Wait 8
	db $18			;Note C-3
					;Wait Repeat 8
	db $0c			;Note C-2
					;Wait Repeat 8
	db $18			;Note C-3
	db $c3			;Wait 4
	db $13			;Note G-2
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c7			;Wait 8
	db $18			;Note C-3
					;Wait Repeat 8
	db $0c			;Note C-2
					;Wait Repeat 8
	db $18			;Note C-3
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_028:
	db $40			;Note E-6
	db $72			;Instrument 0
	db $df			;Wait 32
	db $30			;Note C-5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_029:
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $6f			;Volume 13
	db $72			;Instrument 0
	db $a2,$02			;CMD Track detune
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3c			;Note C-6
	db $d3			;Wait 20
	db $40			;Note E-6
	db $c3			;Wait 4
	db $41			;Note F-6
					;Wait Repeat 4
	db $43			;Note G-6
					;Wait Repeat 4
	db $48			;Note C-7
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_030:
	db $3c			;Note C-6
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3c			;Note C-6
	db $d3			;Wait 20
	db $40			;Note E-6
	db $c3			;Wait 4
	db $41			;Note F-6
					;Wait Repeat 4
	db $43			;Note G-6
					;Wait Repeat 4
	db $48			;Note C-7
	db $d3			;Wait 20
	db $bf			;[End-Of-Track]
.track_035:
	db $0c			;Note C-2
	db $76			;Instrument 4
	db $c7			;Wait 8
	db $18			;Note C-3
					;Wait Repeat 8
	db $0c			;Note C-2
					;Wait Repeat 8
	db $18			;Note C-3
	db $c3			;Wait 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c7			;Wait 8
	db $18			;Note C-3
					;Wait Repeat 8
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0e			;Note D-2
					;Wait Repeat 4
	db $1c			;Note E-3
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_037:
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3c			;Note C-6
	db $d3			;Wait 20
	db $40			;Note E-6
	db $c3			;Wait 4
	db $41			;Note F-6
					;Wait Repeat 4
	db $43			;Note G-6
					;Wait Repeat 4
	db $48			;Note C-7
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_041:
	db $2d			;Note A-4
	db $72			;Instrument 0
	db $df			;Wait 32
	db $2e			;Note A#4
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_042:
	db $30			;Note C-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $31			;Note C#5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_043:
	db $11			;Note F-2
	db $76			;Instrument 4
	db $cf			;Wait 16
	db $11			;Note F-2
					;Wait Repeat 16
	db $11			;Note F-2
					;Wait Repeat 16
	db $11			;Note F-2
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_045:
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $3c			;Note C-6
	db $d3			;Wait 20
	db $3a			;Note A#5
	db $c3			;Wait 4
	db $41			;Note F-6
					;Wait Repeat 4
	db $46			;Note A#6
					;Wait Repeat 4
	db $48			;Note C-7
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_046:
	db $3c			;Note C-6
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $3c			;Note C-6
	db $d3			;Wait 20
	db $3a			;Note A#5
	db $c3			;Wait 4
	db $41			;Note F-6
					;Wait Repeat 4
	db $46			;Note A#6
					;Wait Repeat 4
	db $48			;Note C-7
	db $d3			;Wait 20
	db $bf			;[End-Of-Track]
.track_049:
	db $2d			;Note A-4
	db $72			;Instrument 0
	db $df			;Wait 32
	db $29			;Note F-4
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_050:
	db $30			;Note C-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $2d			;Note A-4
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_053:
	db $39			;Note A-5
	db $72			;Instrument 0
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $3c			;Note C-6
	db $d3			;Wait 20
	db $39			;Note A-5
	db $c3			;Wait 4
	db $41			;Note F-6
					;Wait Repeat 4
	db $45			;Note A-6
					;Wait Repeat 4
	db $48			;Note C-7
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_054:
	db $3c			;Note C-6
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $3c			;Note C-6
	db $d3			;Wait 20
	db $39			;Note A-5
	db $c3			;Wait 4
	db $41			;Note F-6
					;Wait Repeat 4
	db $45			;Note A-6
					;Wait Repeat 4
	db $48			;Note C-7
	db $d3			;Wait 20
	db $bf			;[End-Of-Track]
.track_056:
	db $48			;Note C-7
	db $74			;Instrument 2
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $c3			;Wait 4
	db $26			;Note D-4
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $48			;Note C-7
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $26			;Note D-4
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $48			;Note C-7
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $48			;Note C-7
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $48			;Note C-7
	db $c3			;Wait 4
	db $48			;Note C-7
	db $c3			;Wait 4
	db $26			;Note D-4
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $48			;Note C-7
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $26			;Note D-4
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 4
	db $26			;Note D-4
	db $9d,$02			;CMD Drum $02
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_058:
	db $30			;Note C-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $39			;Note A-5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_059:
	db $11			;Note F-2
	db $76			;Instrument 4
	db $c7			;Wait 8
	db $1d			;Note F-3
					;Wait Repeat 8
	db $11			;Note F-2
					;Wait Repeat 8
	db $1d			;Note F-3
					;Wait Repeat 8
	db $11			;Note F-2
					;Wait Repeat 8
	db $1d			;Note F-3
					;Wait Repeat 8
	db $11			;Note F-2
	db $c3			;Wait 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1d			;Note F-3
					;Wait Repeat 4
	db $1d			;Note F-3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_060:
	db $35			;Note F-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $41			;Note F-6
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_061:
	db $39			;Note A-5
	db $72			;Instrument 0
	db $df			;Wait 32
	db $39			;Note A-5
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_062:
	db $3c			;Note C-6
	db $72			;Instrument 0
	db $df			;Wait 32
	db $3c			;Note C-6
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_064:
	db $3c			;Note C-6
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $39			;Note A-5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $34			;Note E-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2d			;Note A-4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $28			;Note E-4
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $22			;Note A#3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_065:
	db $37			;Note G-5
	db $72			;Instrument 0
	db $f8			;Wait 57
	db $24			;Note C-4
	db $c0			;Wait 1
	db $26			;Note D-4
					;Wait Repeat 1
	db $28			;Note E-4
					;Wait Repeat 1
	db $29			;Note F-4
					;Wait Repeat 1
	db $2b			;Note G-4
					;Wait Repeat 1
	db $2d			;Note A-4
					;Wait Repeat 1
	db $2e			;Note A#4
	db $bf			;[End-Of-Track]
.track_066:
	db $3c			;Note C-6
	db $72			;Instrument 0
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_067:
	db $18			;Note C-3
	db $76			;Instrument 4
	db $c7			;Wait 8
	db $18			;Note C-3
					;Wait Repeat 8
	db $18			;Note C-3
					;Wait Repeat 8
	db $18			;Note C-3
					;Wait Repeat 8
	db $0c			;Note C-2
					;Wait Repeat 8
	db $0c			;Note C-2
					;Wait Repeat 8
	db $0c			;Note C-2
					;Wait Repeat 8
	db $0c			;Note C-2
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_068:
	db $40			;Note E-6
	db $72			;Instrument 0
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_070:
	db $43			;Note G-6
	db $72			;Instrument 0
	db $a2,$02			;CMD Track detune
	db $c7			;Wait 8
	db $41			;Note F-6
					;Wait Repeat 8
	db $40			;Note E-6
					;Wait Repeat 8
	db $3e			;Note D-6
					;Wait Repeat 8
	db $3c			;Note C-6
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $34			;Note E-5
					;Wait Repeat 8
	db $30			;Note C-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_071:
	db $43			;Note G-6
	db $71			;Volume 15
	db $72			;Instrument 0
	db $c7			;Wait 8
	db $41			;Note F-6
					;Wait Repeat 8
	db $40			;Note E-6
					;Wait Repeat 8
	db $3e			;Note D-6
					;Wait Repeat 8
	db $3c			;Note C-6
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $34			;Note E-5
					;Wait Repeat 8
	db $30			;Note C-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_072:
	db $1f			;Note G-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $04
	db $c2			;Wait 3
	db $a4,$20			;CMD Speed
	db $c4			;Wait 5
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_073:
	db $24			;Note C-4
	db $72			;Instrument 0
	db $c7			;Wait 8
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_074:
	db $30			;Note C-5
	db $72			;Instrument 0
	db $c7			;Wait 8
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_075:
	db $18			;Note C-3
	db $76			;Instrument 4
	db $c7			;Wait 8
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_076:
	db $34			;Note E-5
	db $75			;Instrument 3
	db $c7			;Wait 8
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_077:
	db $37			;Note G-5
	db $75			;Instrument 3
	db $c7			;Wait 8
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_078:
	db $30			;Note C-5
	db $72			;Instrument 0
	db $a2,$02			;CMD Track detune
	db $c7			;Wait 8
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_079:
	db $24			;Note C-4
	db $71			;Volume 15
	db $72			;Instrument 0
	db $c7			;Wait 8
	db $61			;Sustain 97
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]

