; Song: Palomas Rescue King of the jungl
; By:   F.Boelens Feb.2024              
; Period table: A440 Modern

; [ Song start data ]
	db $07					; Initial song speed.
	db $00					; Channel setup.
	dw .customvoice_start-8			; Start of the custom voices data.
	dw .drummacro_start			; Start of the drum macro data.
	dw .instrument_start			; Start of the instrument data.

; [ Song order pointer list ]
.restart:
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_006, .track_007	; Step:000 Pattern:000
	dw .track_008, .track_009, .track_010, .track_011, .track_012, .track_013, .track_014, .track_015	; Step:001 Pattern:001
	dw .track_016, .track_017, .track_018, .track_019, .track_020, .track_021, .track_022, .track_023	; Step:002 Pattern:002
	dw .track_024, .track_025, .track_026, .track_027, .track_028, .track_029, .track_030, .track_031	; Step:003 Pattern:003
	dw .track_032, .track_033, .track_034, .track_035, .track_036, .track_037, .track_038, .track_039	; Step:004 Pattern:004
	dw .track_040, .track_041, .track_042, .track_043, .track_044, .track_045, .track_046, .track_047	; Step:005 Pattern:005
	dw .track_048, .track_049, .track_050, .track_051, .track_052, .track_053, .track_014, .track_055	; Step:006 Pattern:006
	dw .track_016, .track_057, .track_058, .track_059, .track_060, .track_061, .track_022, .track_023	; Step:007 Pattern:007
	dw .track_024, .track_065, .track_066, .track_067, .track_068, .track_069, .track_070, .track_031	; Step:008 Pattern:008
	dw .track_032, .track_073, .track_074, .track_075, .track_076, .track_077, .track_078, .track_039	; Step:009 Pattern:009
	dw .track_080, .track_081, .track_082, .track_083, .track_084, .track_085, .track_086, .track_087	; Step:010 Pattern:010
	dw .track_048, .track_089, .track_090, .track_091, .track_092, .track_093, .track_094, .track_095	; Step:011 Pattern:011
	dw .track_016, .track_097, .track_098, .track_099, .track_100, .track_101, .track_102, .track_103	; Step:012 Pattern:012
	dw .track_024, .track_105, .track_106, .track_107, .track_108, .track_109, .track_110, .track_111	; Step:013 Pattern:013
	dw .track_032, .track_113, .track_114, .track_115, .track_116, .track_117, .track_118, .track_119	; Step:014 Pattern:014
	dw .track_120, .track_121, .track_122, .track_123, .track_124, .track_125, .track_126, .track_127	; Step:015 Pattern:015
	dw 0x0000, .restart				; End of sequence delimiter + restart address.

; [ Custom FM voices ]
.customvoice_start:
	db $61,$31,$94,$07,$e4,$c1,$1b,$eb 		; Custom voice:70
	db $61,$61,$1f,$07,$c5,$96,$f5,$f6 		; Custom voice:173
	db $81,$11,$85,$5a,$64,$62,$12,$00 		; Custom voice:177

; [ FM Drum macros]
.drummacro_start:
	dw .drum_00
	dw .drum_02
	dw .drum_04

.drum_00:						; Drum 0.                 
	db $1e, $10							; Percussion
	db $02							; STOP - End of Drum macro

.drum_02:						; Drum 1.                 
	db $08, $00							; volume HiHat
	db $16, $ab, $04						; note Snare 
	db $1e, $08							; Percussion
	db $02							; STOP - End of Drum macro

.drum_04:						; Drum 2.                 
	db $06, $90							; volume Snare
	db $16, $ab, $06						; note Snare 
	db $1e, $01							; Percussion
	db $02							; STOP - End of Drum macro

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic noise1
	dw .instrument_01				; FM trumpet      
	dw .instrument_02				; FM BELL         
	dw .instrument_03				; FM flute        
	dw .instrument_04				; FM PLUCKED PSG B
	dw .instrument_05				; BD POW Solid    
	dw .instrument_06				; SD POW Solid    
	dw .instrument_07				; HH close So HI  
	dw .instrument_08				; FM Violin       
	dw .instrument_09				; FM Heavy trumpet
	dw .instrument_10				; FM Heavy bass   
	dw .instrument_11				; Horn            

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

.instrument_01:					; FM trumpet      
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

.instrument_03:					; FM flute        
	db $40					; FM Hardware Voice 4
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_04:					; FM PLUCKED PSG B
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

.instrument_05:					; BD POW Solid    
	db $f0					; FM Hardware Voice 15
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
								; --- Macro loop
	db $02,$80						; Mixer (N)
	db $08,$00						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_06:					; SD POW Solid    
	db $10					; FM Hardware Voice 1
	db $02,$90						; Mixer (TN)
	db $04,$05,$00					; Tone add
	db $0E,$00						; Noise _
	db $08,$0f						; Volume _
	db $02,$80						; Mixer (N)
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
	db $02,$80						; Mixer (N)
	db $08,$02						; Volume _
	db $02,$10						; Mixer (T)
	db $0c,$0f						; Volume -
	db $06						; End

.instrument_07:					; HH close So HI  
	db $0F					; FM Hardware Voice was not set
	db $02,$80						; Mixer (N)
	db $0E,$00						; Noise _
	db $08,$0a						; Volume _
	db $02,$80						; Mixer (N)
	db $08,$06						; Volume _
								; --- Macro loop
	db $00							; Volume same
	db $18,$fe						; Loop (-3)

.instrument_08:					; FM Violin       
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

.instrument_09:					; FM Heavy trumpet
	db $00,$0c					; FM Software Voice 2
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

.instrument_10:					; FM Heavy bass   
	db $f0					; FM Hardware Voice 15
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
	db $18,$d7						; Loop (-42)

.instrument_11:					; Horn            
	db $90					; FM Hardware Voice 9
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
	db $18,$d7						; Loop (-42)


; [ Song track data ]
.track_000:
	db $0c			;Note C-2
	db $71			;Volume 15
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_001:
	db $10			;Note E-2
	db $6d			;Volume 11
	db $72			;Instrument 0
	db $cb			;Wait 12
	db $10			;Note E-2
	db $c0			;Wait 1
	db $12			;Note F#2
					;Wait Repeat 1
	db $14			;Note G#2
					;Wait Repeat 1
	db $15			;Note A-2
					;Wait Repeat 1
	db $17			;Note B-2
					;Wait Repeat 1
	db $1b			;Note D#3
					;Wait Repeat 1
	db $20			;Note G#3
	db $d1			;Wait 18
	db $10			;Note E-2
	db $cb			;Wait 12
	db $10			;Note E-2
	db $c5			;Wait 6
	db $10			;Note E-2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_002:
	db $10			;Note E-2
	db $71			;Volume 15
	db $7c			;Instrument 10
	db $d1			;Wait 18
	db $14			;Note G#2
					;Wait Repeat 18
	db $10			;Note E-2
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_003:
	db $1c			;Note E-3
	db $71			;Volume 15
	db $7c			;Instrument 10
	db $cb			;Wait 12
	db $1c			;Note E-3
	db $c5			;Wait 6
	db $20			;Note G#3
					;Wait Repeat 6
	db $20			;Note G#3
					;Wait Repeat 6
	db $1e			;Note F#3
					;Wait Repeat 6
	db $1c			;Note E-3
					;Wait Repeat 6
	db $10			;Note E-2
	db $c2			;Wait 3
	db $12			;Note F#2
					;Wait Repeat 3
	db $17			;Note B-2
					;Wait Repeat 3
	db $23			;Note B-3
	db $c2			;Wait 3
	db $28			;Note E-4
	db $a4,$0f			;CMD Speed
					;Wait Repeat 3
	db $61			;Sustain 97
	db $a4,$20			;CMD Speed
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_004:
	db $28			;Note E-4
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $cb			;Wait 12
	db $1c			;Note E-3
	db $c0			;Wait 1
	db $1e			;Note F#3
					;Wait Repeat 1
	db $20			;Note G#3
					;Wait Repeat 1
	db $21			;Note A-3
					;Wait Repeat 1
	db $23			;Note B-3
					;Wait Repeat 1
	db $27			;Note D#4
					;Wait Repeat 1
	db $2c			;Note G#4
	db $d1			;Wait 18
	db $34			;Note E-5
	db $cb			;Wait 12
	db $34			;Note E-5
	db $c0			;Wait 1
	db $33			;Note D#5
					;Wait Repeat 1
	db $31			;Note C#5
					;Wait Repeat 1
	db $2f			;Note B-4
					;Wait Repeat 1
	db $2d			;Note A-4
					;Wait Repeat 1
	db $2c			;Note G#4
					;Wait Repeat 1
	db $28			;Note E-4
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_005:
	db $2c			;Note G#4
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $d1			;Wait 18
	db $2f			;Note B-4
					;Wait Repeat 18
	db $2f			;Note B-4
					;Wait Repeat 18
	db $38			;Note G#5
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_006:
	db $2f			;Note B-4
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $d1			;Wait 18
	db $28			;Note E-4
					;Wait Repeat 18
	db $38			;Note G#5
					;Wait Repeat 18
	db $2f			;Note B-4
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_007:
	db $40			;Note E-6
	db $71			;Volume 15
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $40			;Note E-6
	db $c5			;Wait 6
	db $44			;Note G#6
					;Wait Repeat 6
	db $44			;Note G#6
					;Wait Repeat 6
	db $42			;Note F#6
					;Wait Repeat 6
	db $40			;Note E-6
					;Wait Repeat 6
	db $34			;Note E-5
	db $c2			;Wait 3
	db $36			;Note F#5
					;Wait Repeat 3
	db $3b			;Note B-5
					;Wait Repeat 3
	db $47			;Note B-6
					;Wait Repeat 3
	db $4c			;Note E-7
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_008:
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $a4,$07			;CMD Speed
	db $c5			;Wait 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_009:
	db $15			;Note A-2
	db $71			;Volume 15
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $d1			;Wait 18
	db $17			;Note B-2
					;Wait Repeat 18
	db $10			;Note E-2
					;Wait Repeat 18
	db $0d			;Note C#2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_010:
	db $21			;Note A-3
	db $71			;Volume 15
	db $7c			;Instrument 10
	db $d1			;Wait 18
	db $23			;Note B-3
					;Wait Repeat 18
	db $1c			;Note E-3
					;Wait Repeat 18
	db $19			;Note C#3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_011:
	db $38			;Note G#5
	db $71			;Volume 15
	db $73			;Instrument 1
	db $c5			;Wait 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $38			;Note G#5
					;Wait Repeat 6
	db $36			;Note F#5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $34			;Note E-5
	db $d1			;Wait 18
	db $31			;Note C#5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_012:
	db $c1			;Wait 2
	db $38			;Note G#5
	db $6f			;Volume 13
	db $73			;Instrument 1
	db $a2,$02			;CMD Track detune
	db $c5			;Wait 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $38			;Note G#5
					;Wait Repeat 6
	db $36			;Note F#5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $34			;Note E-5
	db $c3			;Wait 4
	db $2c			;Note G#4
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c0			;Wait 1
	db $2f			;Note B-4
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c0			;Wait 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c0			;Wait 1
	db $38			;Note G#5
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c0			;Wait 1
	db $3d			;Note C#6
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_013:
	db $44			;Note G#6
	db $71			;Volume 15
	db $74			;Instrument 2
	db $c5			;Wait 6
	db $45			;Note A-6
					;Wait Repeat 6
	db $44			;Note G#6
					;Wait Repeat 6
	db $42			;Note F#6
					;Wait Repeat 6
	db $40			;Note E-6
					;Wait Repeat 6
	db $3f			;Note D#6
					;Wait Repeat 6
	db $40			;Note E-6
	db $d1			;Wait 18
	db $3d			;Note C#6
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_014:
	db $c1			;Wait 2
	db $21			;Note A-3
	db $6f			;Volume 13
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $27			;Note D#4
					;Wait Repeat 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $2a			;Note F#4
					;Wait Repeat 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $2a			;Note F#4
					;Wait Repeat 3
	db $1c			;Note E-3
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $19			;Note C#3
					;Wait Repeat 3
	db $28			;Note E-4
	db $bf			;[End-Of-Track]
.track_015:
	db $21			;Note A-3
	db $71			;Volume 15
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $27			;Note D#4
					;Wait Repeat 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $2a			;Note F#4
					;Wait Repeat 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $2a			;Note F#4
					;Wait Repeat 3
	db $1c			;Note E-3
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $19			;Note C#3
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_016:
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_017:
	db $cb			;Wait 12
	db $15			;Note A-2
	db $72			;Instrument 0
	db $d1			;Wait 18
	db $17			;Note B-2
					;Wait Repeat 18
	db $10			;Note E-2
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_018:
	db $cb			;Wait 12
	db $21			;Note A-3
	db $7c			;Instrument 10
	db $d1			;Wait 18
	db $23			;Note B-3
					;Wait Repeat 18
	db $1c			;Note E-3
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_019:
	db $cb			;Wait 12
	db $38			;Note G#5
	db $73			;Instrument 1
	db $c5			;Wait 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $38			;Note G#5
					;Wait Repeat 6
	db $36			;Note F#5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $34			;Note E-5
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_020:
	db $cb			;Wait 12
	db $9c			;CMD End 
	db $c1			;Wait 2
	db $38			;Note G#5
	db $6f			;Volume 13
	db $73			;Instrument 1
	db $a2,$02			;CMD Track detune
	db $c5			;Wait 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $38			;Note G#5
					;Wait Repeat 6
	db $36			;Note F#5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $34			;Note E-5
	db $c3			;Wait 4
	db $28			;Note E-4
	db $7a			;Instrument 8
	db $c2			;Wait 3
	db $2c			;Note G#4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_021:
	db $cb			;Wait 12
	db $44			;Note G#6
	db $74			;Instrument 2
	db $c5			;Wait 6
	db $45			;Note A-6
					;Wait Repeat 6
	db $44			;Note G#6
					;Wait Repeat 6
	db $42			;Note F#6
					;Wait Repeat 6
	db $40			;Note E-6
					;Wait Repeat 6
	db $3f			;Note D#6
					;Wait Repeat 6
	db $40			;Note E-6
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_022:
	db $c1			;Wait 2
	db $2c			;Note G#4
	db $6f			;Volume 13
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $25			;Note C#4
					;Wait Repeat 3
	db $21			;Note A-3
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $27			;Note D#4
					;Wait Repeat 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $2a			;Note F#4
					;Wait Repeat 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $2a			;Note F#4
					;Wait Repeat 3
	db $1c			;Note E-3
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $28			;Note E-4
	db $bf			;[End-Of-Track]
.track_023:
	db $2c			;Note G#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $31			;Note C#5
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_024:
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_025:
	db $c5			;Wait 6
	db $10			;Note E-2
	db $72			;Instrument 0
	db $d1			;Wait 18
	db $15			;Note A-2
	db $cb			;Wait 12
	db $15			;Note A-2
	db $c2			;Wait 3
	db $19			;Note C#3
					;Wait Repeat 3
	db $17			;Note B-2
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_026:
	db $c5			;Wait 6
	db $1c			;Note E-3
	db $7c			;Instrument 10
	db $d1			;Wait 18
	db $21			;Note A-3
	db $cb			;Wait 12
	db $21			;Note A-3
	db $c2			;Wait 3
	db $25			;Note C#4
					;Wait Repeat 3
	db $23			;Note B-3
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_027:
	db $c5			;Wait 6
	db $34			;Note E-5
	db $71			;Volume 15
	db $7a			;Instrument 8
	db $94,$40			;CMD Arpeggio
					;Wait Repeat 6
	db $38			;Note G#5
	db $73			;Instrument 1
	db $9c			;CMD End 
					;Wait Repeat 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $3b			;Note B-5
	db $cb			;Wait 12
	db $39			;Note A-5
	db $c2			;Wait 3
	db $38			;Note G#5
					;Wait Repeat 3
	db $36			;Note F#5
	db $cb			;Wait 12
	db $34			;Note E-5
	db $c2			;Wait 3
	db $36			;Note F#5
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_028:
	db $2f			;Note B-4
	db $7a			;Instrument 8
	db $c2			;Wait 3
	db $33			;Note D#5
	db $c2			;Wait 3
	db $34			;Note E-5
	db $71			;Volume 15
	db $73			;Instrument 1
	db $94,$40			;CMD Arpeggio
	db $c5			;Wait 6
	db $61			;Sustain 97
	db $c0			;Wait 1
	db $a2,$02			;CMD Track detune
					;Wait Repeat 1
	db $38			;Note G#5
	db $6e			;Volume 12
	db $9c			;CMD End 
	db $c5			;Wait 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $3b			;Note B-5
	db $cb			;Wait 12
	db $39			;Note A-5
	db $c2			;Wait 3
	db $38			;Note G#5
					;Wait Repeat 3
	db $36			;Note F#5
	db $cb			;Wait 12
	db $34			;Note E-5
	db $c2			;Wait 3
	db $36			;Note F#5
	db $bf			;[End-Of-Track]
.track_029:
	db $c5			;Wait 6
	db $40			;Note E-6
	db $74			;Instrument 2
					;Wait Repeat 6
	db $61			;Sustain 97
					;Wait Repeat 6
	db $45			;Note A-6
					;Wait Repeat 6
	db $47			;Note B-6
	db $cb			;Wait 12
	db $45			;Note A-6
	db $c2			;Wait 3
	db $44			;Note G#6
					;Wait Repeat 3
	db $42			;Note F#6
	db $cb			;Wait 12
	db $40			;Note E-6
	db $c2			;Wait 3
	db $42			;Note F#6
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_030:
	db $c1			;Wait 2
	db $2c			;Note G#4
	db $6f			;Volume 13
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $1c			;Note E-3
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $21			;Note A-3
	db $6f			;Volume 13
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $27			;Note D#4
					;Wait Repeat 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $2a			;Note F#4
					;Wait Repeat 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $bf			;[End-Of-Track]
.track_031:
	db $2c			;Note G#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $31			;Note C#5
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_032:
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_033:
	db $10			;Note E-2
	db $72			;Instrument 0
	db $cb			;Wait 12
	db $10			;Note E-2
	db $c2			;Wait 3
	db $0f			;Note D#2
					;Wait Repeat 3
	db $0d			;Note C#2
	db $d1			;Wait 18
	db $15			;Note A-2
					;Wait Repeat 18
	db $17			;Note B-2
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_034:
	db $1c			;Note E-3
	db $7c			;Instrument 10
	db $cb			;Wait 12
	db $1c			;Note E-3
	db $c2			;Wait 3
	db $1b			;Note D#3
					;Wait Repeat 3
	db $19			;Note C#3
	db $d1			;Wait 18
	db $21			;Note A-3
					;Wait Repeat 18
	db $23			;Note B-3
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_035:
	db $38			;Note G#5
	db $73			;Instrument 1
	db $c5			;Wait 6
	db $36			;Note F#5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $31			;Note C#5
	db $cb			;Wait 12
	db $31			;Note C#5
	db $c2			;Wait 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $34			;Note E-5
	db $cb			;Wait 12
	db $34			;Note E-5
	db $c5			;Wait 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $31			;Note C#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_036:
	db $c1			;Wait 2
	db $38			;Note G#5
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $c5			;Wait 6
	db $36			;Note F#5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $31			;Note C#5
	db $cb			;Wait 12
	db $31			;Note C#5
	db $c2			;Wait 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $34			;Note E-5
	db $cb			;Wait 12
	db $34			;Note E-5
	db $c5			;Wait 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $31			;Note C#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_037:
	db $50			;Note G#7
	db $74			;Instrument 2
	db $c5			;Wait 6
	db $4e			;Note F#7
					;Wait Repeat 6
	db $4c			;Note E-7
					;Wait Repeat 6
	db $49			;Note C#7
	db $cb			;Wait 12
	db $49			;Note C#7
	db $c2			;Wait 3
	db $4b			;Note D#7
					;Wait Repeat 3
	db $4c			;Note E-7
	db $cb			;Wait 12
	db $4c			;Note E-7
	db $c5			;Wait 6
	db $4b			;Note D#7
					;Wait Repeat 6
	db $49			;Note C#7
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_038:
	db $c1			;Wait 2
	db $1c			;Note E-3
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $19			;Note C#3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $2c			;Note G#4
	db $6f			;Volume 13
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $25			;Note C#4
	db $c2			;Wait 3
	db $21			;Note A-3
	db $6f			;Volume 13
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2d			;Note A-4
					;Wait Repeat 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $27			;Note D#4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_039:
	db $1c			;Note E-3
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $19			;Note C#3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $31			;Note C#5
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
	db $bf			;[End-Of-Track]
.track_040:
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_041:
	db $c7			;Wait 8
	db $10			;Note E-2
	db $72			;Instrument 0
	db $d1			;Wait 18
	db $10			;Note E-2
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_042:
	db $c7			;Wait 8
	db $1c			;Note E-3
	db $7c			;Instrument 10
	db $d1			;Wait 18
	db $1c			;Note E-3
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_043:
	db $c1			;Wait 2
	db $33			;Note D#5
	db $73			;Instrument 1
	db $c5			;Wait 6
	db $34			;Note E-5
	db $d1			;Wait 18
	db $61			;Sustain 97
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_044:
	db $c3			;Wait 4
	db $33			;Note D#5
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $c5			;Wait 6
	db $34			;Note E-5
	db $cf			;Wait 16
	db $61			;Sustain 97
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_045:
	db $c1			;Wait 2
	db $4b			;Note D#7
	db $74			;Instrument 2
	db $c5			;Wait 6
	db $4c			;Note E-7
	db $d1			;Wait 18
	db $4c			;Note E-7
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_046:
	db $c0			;Wait 1
	db $2a			;Note F#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $2c			;Note G#4
	db $6f			;Volume 13
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $1c			;Note E-3
					;Wait Repeat 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $28			;Note E-4
					;Wait Repeat 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $28			;Note E-4
	db $bf			;[End-Of-Track]
.track_047:
	db $c1			;Wait 2
	db $2f			;Note B-4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_048:
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_049:
	db $09			;Note A-1
	db $72			;Instrument 0
	db $cb			;Wait 12
	db $15			;Note A-2
	db $c5			;Wait 6
	db $17			;Note B-2
	db $cb			;Wait 12
	db $17			;Note B-2
	db $c2			;Wait 3
	db $12			;Note F#2
					;Wait Repeat 3
	db $10			;Note E-2
	db $d1			;Wait 18
	db $0d			;Note C#2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_050:
	db $21			;Note A-3
	db $7c			;Instrument 10
	db $cb			;Wait 12
	db $21			;Note A-3
	db $c5			;Wait 6
	db $23			;Note B-3
	db $cb			;Wait 12
	db $23			;Note B-3
	db $c2			;Wait 3
	db $1e			;Note F#3
					;Wait Repeat 3
	db $1c			;Note E-3
	db $d1			;Wait 18
	db $19			;Note C#3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_051:
	db $31			;Note C#5
	db $73			;Instrument 1
	db $cb			;Wait 12
	db $31			;Note C#5
	db $c2			;Wait 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $33			;Note D#5
	db $cb			;Wait 12
	db $31			;Note C#5
	db $c2			;Wait 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $34			;Note E-5
	db $c5			;Wait 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $2f			;Note B-4
					;Wait Repeat 6
	db $31			;Note C#5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_052:
	db $c1			;Wait 2
	db $31			;Note C#5
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $cb			;Wait 12
	db $31			;Note C#5
	db $c2			;Wait 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $33			;Note D#5
	db $cb			;Wait 12
	db $31			;Note C#5
	db $c2			;Wait 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $34			;Note E-5
	db $c5			;Wait 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $2f			;Note B-4
					;Wait Repeat 6
	db $31			;Note C#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_053:
	db $49			;Note C#7
	db $74			;Instrument 2
	db $cb			;Wait 12
	db $49			;Note C#7
	db $c2			;Wait 3
	db $49			;Note C#7
					;Wait Repeat 3
	db $4b			;Note D#7
	db $cb			;Wait 12
	db $49			;Note C#7
	db $c2			;Wait 3
	db $4b			;Note D#7
					;Wait Repeat 3
	db $4c			;Note E-7
	db $c5			;Wait 6
	db $4b			;Note D#7
					;Wait Repeat 6
	db $47			;Note B-6
					;Wait Repeat 6
	db $49			;Note C#7
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_055:
	db $21			;Note A-3
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $31			;Note C#5
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $19			;Note C#3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_057:
	db $c5			;Wait 6
	db $10			;Note E-2
	db $72			;Instrument 0
	db $c2			;Wait 3
	db $17			;Note B-2
					;Wait Repeat 3
	db $15			;Note A-2
	db $d1			;Wait 18
	db $17			;Note B-2
					;Wait Repeat 18
	db $10			;Note E-2
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_058:
	db $c5			;Wait 6
	db $1c			;Note E-3
	db $7c			;Instrument 10
	db $c2			;Wait 3
	db $23			;Note B-3
					;Wait Repeat 3
	db $21			;Note A-3
	db $d1			;Wait 18
	db $23			;Note B-3
					;Wait Repeat 18
	db $1c			;Note E-3
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_059:
	db $c5			;Wait 6
	db $2d			;Note A-4
	db $73			;Instrument 1
	db $c2			;Wait 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $31			;Note C#5
	db $cb			;Wait 12
	db $31			;Note C#5
	db $c5			;Wait 6
	db $33			;Note D#5
	db $cb			;Wait 12
	db $33			;Note D#5
	db $c5			;Wait 6
	db $34			;Note E-5
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_060:
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $c2			;Wait 3
	db $2f			;Note B-4
					;Wait Repeat 3
	db $31			;Note C#5
	db $cb			;Wait 12
	db $31			;Note C#5
	db $c5			;Wait 6
	db $33			;Note D#5
	db $cb			;Wait 12
	db $33			;Note D#5
	db $c5			;Wait 6
	db $34			;Note E-5
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_061:
	db $6e			;Volume 12
	db $75			;Instrument 3
	db $c1			;Wait 2
	db $50			;Note G#7
	db $6e			;Volume 12
	db $c0			;Wait 1
	db $4e			;Note F#7
	db $c0			;Wait 1
	db $50			;Note G#7
	db $6e			;Volume 12
	db $c1			;Wait 2
	db $6e			;Volume 12
					;Wait Repeat 2
	db $6d			;Volume 11
	db $c0			;Wait 1
	db $47			;Note B-6
	db $74			;Instrument 2
	db $c2			;Wait 3
	db $49			;Note C#7
	db $71			;Volume 15
	db $cb			;Wait 12
	db $49			;Note C#7
	db $c5			;Wait 6
	db $4b			;Note D#7
	db $cb			;Wait 12
	db $4b			;Note D#7
	db $c5			;Wait 6
	db $4c			;Note E-7
	db $c5			;Wait 6
	db $47			;Note B-6
	db $6e			;Volume 12
	db $75			;Instrument 3
	db $c0			;Wait 1
	db $49			;Note C#7
					;Wait Repeat 1
	db $4b			;Note D#7
					;Wait Repeat 1
	db $4c			;Note E-7
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_065:
	db $c5			;Wait 6
	db $10			;Note E-2
	db $72			;Instrument 0
	db $d1			;Wait 18
	db $15			;Note A-2
					;Wait Repeat 18
	db $17			;Note B-2
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_066:
	db $c5			;Wait 6
	db $1c			;Note E-3
	db $7c			;Instrument 10
	db $d1			;Wait 18
	db $21			;Note A-3
					;Wait Repeat 18
	db $23			;Note B-3
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_067:
	db $d7			;Wait 24
	db $2d			;Note A-4
	db $73			;Instrument 1
	db $cb			;Wait 12
	db $2d			;Note A-4
	db $c5			;Wait 6
	db $2f			;Note B-4
	db $cb			;Wait 12
	db $2f			;Note B-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_068:
	db $d9			;Wait 26
	db $2d			;Note A-4
	db $73			;Instrument 1
	db $cb			;Wait 12
	db $2d			;Note A-4
	db $c5			;Wait 6
	db $2f			;Note B-4
	db $cb			;Wait 12
	db $2f			;Note B-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_069:
	db $40			;Note E-6
	db $75			;Instrument 3
	db $c0			;Wait 1
	db $42			;Note F#6
					;Wait Repeat 1
	db $40			;Note E-6
					;Wait Repeat 1
	db $42			;Note F#6
					;Wait Repeat 1
	db $40			;Note E-6
					;Wait Repeat 1
	db $42			;Note F#6
					;Wait Repeat 1
	db $40			;Note E-6
	db $c1			;Wait 2
	db $61			;Sustain 97
	db $cf			;Wait 16
	db $39			;Note A-5
	db $71			;Volume 15
	db $7a			;Instrument 8
	db $a2,$01			;CMD Track detune
	db $cb			;Wait 12
	db $39			;Note A-5
	db $c5			;Wait 6
	db $3b			;Note B-5
	db $cb			;Wait 12
	db $3b			;Note B-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_070:
	db $c1			;Wait 2
	db $2c			;Note G#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $31			;Note C#5
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
	db $bf			;[End-Of-Track]
.track_073:
	db $10			;Note E-2
	db $72			;Instrument 0
	db $d1			;Wait 18
	db $0d			;Note C#2
					;Wait Repeat 18
	db $15			;Note A-2
	db $cb			;Wait 12
	db $15			;Note A-2
	db $c2			;Wait 3
	db $15			;Note A-2
					;Wait Repeat 3
	db $17			;Note B-2
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_074:
	db $1c			;Note E-3
	db $7c			;Instrument 10
	db $d1			;Wait 18
	db $19			;Note C#3
					;Wait Repeat 18
	db $21			;Note A-3
	db $cb			;Wait 12
	db $15			;Note A-2
	db $c2			;Wait 3
	db $21			;Note A-3
					;Wait Repeat 3
	db $23			;Note B-3
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_075:
	db $34			;Note E-5
	db $73			;Instrument 1
	db $c5			;Wait 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $31			;Note C#5
					;Wait Repeat 6
	db $2c			;Note G#4
	db $cb			;Wait 12
	db $2a			;Note F#4
	db $c2			;Wait 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $c5			;Wait 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $33			;Note D#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_076:
	db $c1			;Wait 2
	db $34			;Note E-5
	db $73			;Instrument 1
	db $c5			;Wait 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $31			;Note C#5
					;Wait Repeat 6
	db $2c			;Note G#4
	db $cb			;Wait 12
	db $2a			;Note F#4
	db $c2			;Wait 3
	db $2c			;Note G#4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $c5			;Wait 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $33			;Note D#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_077:
	db $40			;Note E-6
	db $7a			;Instrument 8
	db $c5			;Wait 6
	db $3f			;Note D#6
					;Wait Repeat 6
	db $3d			;Note C#6
					;Wait Repeat 6
	db $38			;Note G#5
	db $cb			;Wait 12
	db $36			;Note F#5
	db $c2			;Wait 3
	db $38			;Note G#5
					;Wait Repeat 3
	db $39			;Note A-5
	db $c5			;Wait 6
	db $40			;Note E-6
					;Wait Repeat 6
	db $40			;Note E-6
					;Wait Repeat 6
	db $40			;Note E-6
					;Wait Repeat 6
	db $3f			;Note D#6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_078:
	db $c1			;Wait 2
	db $1c			;Note E-3
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $19			;Note C#3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2d			;Note A-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $31			;Note C#5
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2f			;Note B-4
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_080:
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
	db $c2			;Wait 3
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 3
	db $26			;Note D-4
	db $9d,$02			;CMD Drum $02
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_081:
	db $c7			;Wait 8
	db $10			;Note E-2
	db $72			;Instrument 0
	db $d1			;Wait 18
	db $10			;Note E-2
	db $c5			;Wait 6
	db $1c			;Note E-3
					;Wait Repeat 6
	db $10			;Note E-2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_082:
	db $c7			;Wait 8
	db $1c			;Note E-3
	db $7c			;Instrument 10
	db $d1			;Wait 18
	db $10			;Note E-2
	db $c5			;Wait 6
	db $1c			;Note E-3
					;Wait Repeat 6
	db $10			;Note E-2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_083:
	db $c1			;Wait 2
	db $31			;Note C#5
	db $73			;Instrument 1
	db $c2			;Wait 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $34			;Note E-5
	db $d1			;Wait 18
	db $61			;Sustain 97
	db $c2			;Wait 3
	db $28			;Note E-4
	db $7a			;Instrument 8
	db $c1			;Wait 2
	db $28			;Note E-4
	db $c0			;Wait 1
	db $2a			;Note F#4
	db $c1			;Wait 2
	db $2a			;Note F#4
	db $c0			;Wait 1
	db $2c			;Note G#4
	db $c1			;Wait 2
	db $2c			;Note G#4
	db $c0			;Wait 1
	db $2d			;Note A-4
	db $c1			;Wait 2
	db $2d			;Note A-4
	db $c0			;Wait 1
	db $2f			;Note B-4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_084:
	db $c3			;Wait 4
	db $31			;Note C#5
	db $73			;Instrument 1
	db $c2			;Wait 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $34			;Note E-5
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_085:
	db $c1			;Wait 2
	db $3d			;Note C#6
	db $7a			;Instrument 8
	db $c2			;Wait 3
	db $3f			;Note D#6
					;Wait Repeat 3
	db $40			;Note E-6
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_086:
	db $c0			;Wait 1
	db $2a			;Note F#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $2f			;Note B-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $1c			;Note E-3
	db $76			;Instrument 4
	db $c0			;Wait 1
	db $34			;Note E-5
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $34			;Note E-5
	db $76			;Instrument 4
	db $c0			;Wait 1
	db $36			;Note F#5
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $36			;Note F#5
	db $76			;Instrument 4
	db $c0			;Wait 1
	db $38			;Note G#5
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $38			;Note G#5
	db $76			;Instrument 4
	db $c0			;Wait 1
	db $39			;Note A-5
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $39			;Note A-5
	db $76			;Instrument 4
	db $c0			;Wait 1
	db $3b			;Note B-5
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $3b			;Note B-5
	db $76			;Instrument 4
	db $bf			;[End-Of-Track]
.track_087:
	db $c1			;Wait 2
	db $2f			;Note B-4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2c			;Note G#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $1c			;Note E-3
	db $76			;Instrument 4
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_089:
	db $06			;Note F#1
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $0b			;Note B-1
					;Wait Repeat 6
	db $17			;Note B-2
					;Wait Repeat 6
	db $16			;Note A#2
					;Wait Repeat 6
	db $08			;Note G#1
					;Wait Repeat 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $0d			;Note C#2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_090:
	db $12			;Note F#2
	db $7c			;Instrument 10
	db $c5			;Wait 6
	db $1e			;Note F#3
					;Wait Repeat 6
	db $1e			;Note F#3
					;Wait Repeat 6
	db $17			;Note B-2
					;Wait Repeat 6
	db $23			;Note B-3
					;Wait Repeat 6
	db $16			;Note A#2
					;Wait Repeat 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $20			;Note G#3
					;Wait Repeat 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $19			;Note C#3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_091:
	db $3d			;Note C#6
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3f			;Note D#6
					;Wait Repeat 18
	db $3f			;Note D#6
					;Wait Repeat 18
	db $40			;Note E-6
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_092:
	db $c1			;Wait 2
	db $3d			;Note C#6
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3f			;Note D#6
					;Wait Repeat 18
	db $3f			;Note D#6
					;Wait Repeat 18
	db $40			;Note E-6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_093:
	db $39			;Note A-5
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3b			;Note B-5
					;Wait Repeat 18
	db $3b			;Note B-5
					;Wait Repeat 18
	db $3b			;Note B-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_094:
	db $1e			;Note F#3
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $20			;Note G#3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $31			;Note C#5
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_095:
	db $3d			;Note C#6
	db $7d			;Instrument 11
	db $c2			;Wait 3
	db $39			;Note A-5
					;Wait Repeat 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $45			;Note A-6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $47			;Note B-6
					;Wait Repeat 3
	db $45			;Note A-6
					;Wait Repeat 3
	db $44			;Note G#6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $40			;Note E-6
					;Wait Repeat 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $3f			;Note D#6
					;Wait Repeat 3
	db $3b			;Note B-5
					;Wait Repeat 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $3f			;Note D#6
					;Wait Repeat 3
	db $40			;Note E-6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $44			;Note G#6
	db $c0			;Wait 1
	db $45			;Note A-6
					;Wait Repeat 1
	db $44			;Note G#6
					;Wait Repeat 1
	db $45			;Note A-6
					;Wait Repeat 1
	db $44			;Note G#6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_097:
	db $19			;Note C#3
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $06			;Note F#1
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $0b			;Note B-1
					;Wait Repeat 6
	db $17			;Note B-2
					;Wait Repeat 6
	db $16			;Note A#2
					;Wait Repeat 6
	db $08			;Note G#1
					;Wait Repeat 6
	db $14			;Note G#2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_098:
	db $19			;Note C#3
	db $7c			;Instrument 10
	db $c5			;Wait 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $1e			;Note F#3
					;Wait Repeat 6
	db $1e			;Note F#3
					;Wait Repeat 6
	db $17			;Note B-2
					;Wait Repeat 6
	db $23			;Note B-3
					;Wait Repeat 6
	db $16			;Note A#2
					;Wait Repeat 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $20			;Note G#3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_099:
	db $cb			;Wait 12
	db $3d			;Note C#6
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3f			;Note D#6
					;Wait Repeat 18
	db $3f			;Note D#6
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_100:
	db $cd			;Wait 14
	db $3d			;Note C#6
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3f			;Note D#6
					;Wait Repeat 18
	db $3f			;Note D#6
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_101:
	db $cb			;Wait 12
	db $39			;Note A-5
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3b			;Note B-5
					;Wait Repeat 18
	db $3b			;Note B-5
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_102:
	db $38			;Note G#5
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $34			;Note E-5
	db $76			;Instrument 4
					;Wait Repeat 3
	db $31			;Note C#5
	db $76			;Instrument 4
					;Wait Repeat 3
	db $34			;Note E-5
	db $76			;Instrument 4
					;Wait Repeat 3
	db $1e			;Note F#3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $20			;Note G#3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_103:
	db $cb			;Wait 12
	db $3d			;Note C#6
	db $7d			;Instrument 11
	db $c2			;Wait 3
	db $39			;Note A-5
					;Wait Repeat 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $45			;Note A-6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $47			;Note B-6
					;Wait Repeat 3
	db $45			;Note A-6
					;Wait Repeat 3
	db $44			;Note G#6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $40			;Note E-6
					;Wait Repeat 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $3f			;Note D#6
					;Wait Repeat 3
	db $40			;Note E-6
					;Wait Repeat 3
	db $3f			;Note D#6
					;Wait Repeat 3
	db $3d			;Note C#6
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_105:
	db $14			;Note G#2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $0d			;Note C#2
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $06			;Note F#1
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $0b			;Note B-1
					;Wait Repeat 6
	db $17			;Note B-2
					;Wait Repeat 6
	db $16			;Note A#2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_106:
	db $14			;Note G#2
	db $c5			;Wait 6
	db $19			;Note C#3
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $1e			;Note F#3
					;Wait Repeat 6
	db $1e			;Note F#3
					;Wait Repeat 6
	db $17			;Note B-2
					;Wait Repeat 6
	db $23			;Note B-3
					;Wait Repeat 6
	db $16			;Note A#2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_107:
	db $c5			;Wait 6
	db $40			;Note E-6
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3d			;Note C#6
					;Wait Repeat 18
	db $3f			;Note D#6
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_108:
	db $d9			;Wait 26
	db $3d			;Note C#6
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3f			;Note D#6
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_109:
	db $c5			;Wait 6
	db $3b			;Note B-5
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $39			;Note A-5
					;Wait Repeat 18
	db $3b			;Note B-5
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_110:
	db $25			;Note C#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
	db $c5			;Wait 6
	db $0d			;Note C#2
	db $76			;Instrument 4
	db $c0			;Wait 1
	db $0f			;Note D#2
	db $76			;Instrument 4
					;Wait Repeat 1
	db $10			;Note E-2
	db $76			;Instrument 4
					;Wait Repeat 1
	db $12			;Note F#2
	db $76			;Instrument 4
					;Wait Repeat 1
	db $14			;Note G#2
	db $76			;Instrument 4
					;Wait Repeat 1
	db $15			;Note A-2
	db $76			;Instrument 4
					;Wait Repeat 1
	db $17			;Note B-2
	db $76			;Instrument 4
					;Wait Repeat 1
	db $19			;Note C#3
	db $76			;Instrument 4
					;Wait Repeat 1
	db $1b			;Note D#3
	db $76			;Instrument 4
					;Wait Repeat 1
	db $1c			;Note E-3
	db $76			;Instrument 4
					;Wait Repeat 1
	db $1e			;Note F#3
	db $76			;Instrument 4
					;Wait Repeat 1
	db $20			;Note G#3
	db $76			;Instrument 4
					;Wait Repeat 1
	db $1e			;Note F#3
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_111:
	db $3b			;Note B-5
	db $7d			;Instrument 11
	db $c2			;Wait 3
	db $39			;Note A-5
					;Wait Repeat 3
	db $38			;Note G#5
	db $d1			;Wait 18
	db $3d			;Note C#6
	db $c2			;Wait 3
	db $39			;Note A-5
					;Wait Repeat 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $45			;Note A-6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $47			;Note B-6
					;Wait Repeat 3
	db $45			;Note A-6
					;Wait Repeat 3
	db $44			;Note G#6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $40			;Note E-6
					;Wait Repeat 3
	db $3d			;Note C#6
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_113:
	db $08			;Note G#1
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $0d			;Note C#2
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $0d			;Note C#2
					;Wait Repeat 6
	db $06			;Note F#1
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $0b			;Note B-1
					;Wait Repeat 6
	db $17			;Note B-2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_114:
	db $14			;Note G#2
	db $c5			;Wait 6
	db $20			;Note G#3
					;Wait Repeat 6
	db $14			;Note G#2
	db $c5			;Wait 6
	db $19			;Note C#3
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $12			;Note F#2
					;Wait Repeat 6
	db $1e			;Note F#3
					;Wait Repeat 6
	db $1e			;Note F#3
					;Wait Repeat 6
	db $17			;Note B-2
					;Wait Repeat 6
	db $23			;Note B-3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_115:
	db $3f			;Note D#6
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $40			;Note E-6
					;Wait Repeat 18
	db $3d			;Note C#6
					;Wait Repeat 18
	db $3f			;Note D#6
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_116:
	db $c1			;Wait 2
	db $3f			;Note D#6
	db $d1			;Wait 18
	db $40			;Note E-6
	db $d1			;Wait 18
	db $3d			;Note C#6
	db $6e			;Volume 12
	db $73			;Instrument 1
					;Wait Repeat 18
	db $3f			;Note D#6
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_117:
	db $3b			;Note B-5
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3b			;Note B-5
					;Wait Repeat 18
	db $39			;Note A-5
					;Wait Repeat 18
	db $3b			;Note B-5
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_118:
	db $20			;Note G#3
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
	db $d1			;Wait 18
	db $1e			;Note F#3
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $21			;Note A-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $23			;Note B-3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $2a			;Note F#4
	db $76			;Instrument 4
	db $bf			;[End-Of-Track]
.track_119:
	db $3f			;Note D#6
	db $7d			;Instrument 11
	db $c2			;Wait 3
	db $3b			;Note B-5
					;Wait Repeat 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $3f			;Note D#6
					;Wait Repeat 3
	db $40			;Note E-6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $44			;Note G#6
	db $c0			;Wait 1
	db $45			;Note A-6
					;Wait Repeat 1
	db $44			;Note G#6
					;Wait Repeat 1
	db $45			;Note A-6
					;Wait Repeat 1
	db $44			;Note G#6
	db $cd			;Wait 14
	db $3d			;Note C#6
	db $c2			;Wait 3
	db $39			;Note A-5
					;Wait Repeat 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $45			;Note A-6
					;Wait Repeat 3
	db $42			;Note F#6
					;Wait Repeat 3
	db $47			;Note B-6
					;Wait Repeat 3
	db $45			;Note A-6
					;Wait Repeat 3
	db $44			;Note G#6
					;Wait Repeat 3
	db $42			;Note F#6
	db $bf			;[End-Of-Track]
.track_120:
	db $c1			;Wait 2
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $77			;Instrument 5
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $5f			;Note B-8
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $78			;Instrument 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $5f			;Note B-8
	db $79			;Instrument 7
	db $9d,$04			;CMD Drum $03
	db $c2			;Wait 3
	db $26			;Note D-4
	db $78			;Instrument 6
	db $c2			;Wait 3
	db $26			;Note D-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 3
	db $26			;Note D-4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_121:
	db $c1			;Wait 2
	db $16			;Note A#2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $08			;Note G#1
					;Wait Repeat 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $0d			;Note C#2
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $19			;Note C#3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_122:
	db $c1			;Wait 2
	db $16			;Note A#2
	db $7c			;Instrument 10
	db $c5			;Wait 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $20			;Note G#3
					;Wait Repeat 6
	db $14			;Note G#2
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $19			;Note C#3
					;Wait Repeat 6
	db $19			;Note C#3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_123:
	db $c7			;Wait 8
	db $3f			;Note D#6
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $40			;Note E-6
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_124:
	db $c9			;Wait 10
	db $3f			;Note D#6
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_125:
	db $c7			;Wait 8
	db $3b			;Note B-5
	db $73			;Instrument 1
	db $d1			;Wait 18
	db $3b			;Note B-5
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_126:
	db $c1			;Wait 2
	db $27			;Note D#4
	db $76			;Instrument 4
	db $c2			;Wait 3
	db $2a			;Note F#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $20			;Note G#3
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $27			;Note D#4
	db $76			;Instrument 4
					;Wait Repeat 3
	db $25			;Note C#4
	db $76			;Instrument 4
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_127:
	db $c1			;Wait 2
	db $40			;Note E-6
	db $7d			;Instrument 11
	db $c2			;Wait 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $3f			;Note D#6
					;Wait Repeat 3
	db $40			;Note E-6
					;Wait Repeat 3
	db $3f			;Note D#6
					;Wait Repeat 3
	db $3d			;Note C#6
					;Wait Repeat 3
	db $3b			;Note B-5
					;Wait Repeat 3
	db $39			;Note A-5
					;Wait Repeat 3
	db $38			;Note G#5
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]

