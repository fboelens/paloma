; Song: Princess Paloma - black snow    
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
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_005, .track_005	; Step:000 Pattern:000
	dw .track_008, .track_009, .track_010, .track_011, .track_012, .track_009, .track_009, .track_009	; Step:001 Pattern:001
	dw .track_016, .track_017, .track_018, .track_019, .track_004, .track_021, .track_009, .track_009	; Step:002 Pattern:002
	dw .track_008, .track_025, .track_010, .track_011, .track_012, .track_029, .track_009, .track_009	; Step:003 Pattern:003
	dw .track_016, .track_033, .track_018, .track_019, .track_036, .track_037, .track_038, .track_039	; Step:004 Pattern:004
	dw .track_040, .track_041, .track_042, .track_043, .track_044, .track_045, .track_046, .track_047	; Step:005 Pattern:005
	dw .track_048, .track_049, .track_050, .track_051, .track_052, .track_053, .track_054, .track_055	; Step:006 Pattern:006
	dw .track_056, .track_057, .track_058, .track_059, .track_060, .track_061, .track_062, .track_063	; Step:007 Pattern:007
	dw .track_016, .track_033, .track_018, .track_019, .track_036, .track_037, .track_038, .track_039	; Step:008 Pattern:004
	dw .track_040, .track_041, .track_042, .track_043, .track_044, .track_045, .track_046, .track_047	; Step:009 Pattern:005
	dw .track_048, .track_049, .track_050, .track_051, .track_052, .track_053, .track_054, .track_055	; Step:010 Pattern:006
	dw .track_064, .track_065, .track_066, .track_067, .track_068, .track_069, .track_070, .track_071	; Step:011 Pattern:008
	dw .track_072, .track_073, .track_074, .track_075, .track_076, .track_077, .track_078, .track_079	; Step:012 Pattern:009
	dw .track_080, .track_081, .track_082, .track_083, .track_084, .track_085, .track_086, .track_087	; Step:013 Pattern:010
	dw .track_088, .track_089, .track_090, .track_091, .track_092, .track_093, .track_094, .track_095	; Step:014 Pattern:011
	dw .track_096, .track_097, .track_098, .track_099, .track_100, .track_101, .track_102, .track_103	; Step:015 Pattern:012
	dw .track_104, .track_105, .track_106, .track_107, .track_108, .track_109, .track_110, .track_111	; Step:016 Pattern:013
	dw .track_112, .track_105, .track_108, .track_115, .track_116, .track_117, .track_118, .track_119	; Step:017 Pattern:014
	dw .track_120, .track_121, .track_122, .track_123, .track_124, .track_125, .track_126, .track_127	; Step:018 Pattern:015
	dw .track_128, .track_129, .track_130, .track_131, .track_132, .track_133, .track_134, .track_135	; Step:019 Pattern:016
	dw .track_104, .track_105, .track_106, .track_107, .track_108, .track_109, .track_110, .track_111	; Step:020 Pattern:013
	dw .track_112, .track_105, .track_108, .track_115, .track_116, .track_117, .track_118, .track_119	; Step:021 Pattern:014
	dw .track_120, .track_121, .track_122, .track_123, .track_124, .track_125, .track_126, .track_127	; Step:022 Pattern:015
	dw .track_136, .track_137, .track_130, .track_131, .track_132, .track_133, .track_142, .track_143	; Step:023 Pattern:017
	dw 0x0000, .restart				; End of sequence delimiter + restart address.

; [ Custom FM voices ]
.customvoice_start:
	db $61,$31,$94,$07,$e4,$c1,$1b,$eb 		; Custom voice:70
	db $81,$01,$85,$1a,$64,$62,$12,$00 		; Custom voice:177

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
	db $0e, $03							; volume Tom
	db $1a, $ab, $0a						; note Cymbal 
	db $1e, $02							; Percussion
	db $02							; STOP - End of Drum macro

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic noise1
	dw .instrument_01				; PSG sonic       
	dw .instrument_02				; FM trumpet      
	dw .instrument_03				; SD POW Solid    
	dw .instrument_04				; FM Violin       
	dw .instrument_05				; FM Heavy trumpet
	dw .instrument_06				; FM Heavy bass   

.instrument_00:					; PSG sonic noise1
	db $00,$04					; FM Software Voice 0
	db $02,$10						; Mixer (T)
	db $08,$0b						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0b						; Volume _
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $04,$fd,$ff					; Tone sub
	db $0c,$01						; Volume -
	db $02,$10						; Mixer (T)
	db $04,$fd,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$fd,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$03,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$03,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$03,$00					; Tone add
	db $00							; Volume same
	db $18,$da						; Loop (-39)

.instrument_01:					; PSG sonic       
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
	db $0c,$02						; Volume -
	db $02,$10						; Mixer (T)
	db $0c,$02						; Volume -
	db $18,$f7						; Loop (-10)

.instrument_02:					; FM trumpet      
	db $c0					; FM Hardware Voice 12
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $00							; Volume same
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

.instrument_03:					; SD POW Solid    
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

.instrument_04:					; FM Violin       
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

.instrument_05:					; FM Heavy trumpet
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
	db $04,$01,$00					; Tone add
	db $0c,$01						; Volume -
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$01,$00					; Tone add
	db $00							; Volume same
	db $02,$10						; Mixer (T)
	db $04,$ff,$ff					; Tone sub
	db $00							; Volume same
	db $18,$da						; Loop (-39)

.instrument_06:					; FM Heavy bass   
	db $a0					; FM Hardware Voice 10
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0d						; Volume _
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


; [ Song track data ]
.track_000:
	db $24			;Note C-4
	db $71			;Volume 15
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $30			;Note C-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_001:
	db $71			;Volume 15
	db $72			;Instrument 0
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_002:
	db $30			;Note C-5
	db $71			;Volume 15
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $38			;Note G#5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $38			;Note G#5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_003:
	db $71			;Volume 15
	db $c3			;Wait 4
	db $33			;Note D#5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $3c			;Note C-6
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $3c			;Note C-6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_004:
	db $c1			;Wait 2
	db $30			;Note C-5
	db $6f			;Volume 13
	db $74			;Instrument 2
	db $a2,$02			;CMD Track detune
	db $c3			;Wait 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $3c			;Note C-6
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $3c			;Note C-6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_005:
	db $60			;Release 96
	db $71			;Volume 15
	db $72			;Instrument 0
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_008:
	db $26			;Note D-4
	db $c3			;Wait 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $26			;Note D-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_009:
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_010:
	db $32			;Note D-5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $38			;Note G#5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $38			;Note G#5
					;Wait Repeat 8
	db $2e			;Note A#4
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $35			;Note F-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_011:
	db $c3			;Wait 4
	db $35			;Note F-5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $3e			;Note D-6
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $3e			;Note D-6
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $38			;Note G#5
					;Wait Repeat 8
	db $38			;Note G#5
					;Wait Repeat 8
	db $32			;Note D-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_012:
	db $c1			;Wait 2
	db $32			;Note D-5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $3e			;Note D-6
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $3e			;Note D-6
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_016:
	db $24			;Note C-4
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $30			;Note C-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_017:
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $18			;Note C-3
	db $c1			;Wait 2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $18			;Note C-3
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $18			;Note C-3
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $19			;Note C#3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_018:
	db $30			;Note C-5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $38			;Note G#5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $38			;Note G#5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_019:
	db $c3			;Wait 4
	db $33			;Note D#5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $3c			;Note C-6
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $3c			;Note C-6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_021:
	db $0c			;Note C-2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $18			;Note C-3
					;Wait Repeat 6
	db $0c			;Note C-2
	db $c7			;Wait 8
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $0f			;Note D#2
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $0c			;Note C-2
					;Wait Repeat 6
	db $0c			;Note C-2
	db $c7			;Wait 8
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $19			;Note C#3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_025:
	db $0a			;Note A#1
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $16			;Note A#2
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $16			;Note A#2
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $c3			;Wait 4
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $0a			;Note A#1
					;Wait Repeat 2
	db $0c			;Note C-2
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c1			;Wait 2
	db $16			;Note A#2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_029:
	db $16			;Note A#2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $16			;Note A#2
					;Wait Repeat 6
	db $16			;Note A#2
	db $c3			;Wait 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $16			;Note A#2
	db $c5			;Wait 6
	db $16			;Note A#2
					;Wait Repeat 6
	db $16			;Note A#2
					;Wait Repeat 6
	db $16			;Note A#2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $22			;Note A#3
	db $c3			;Wait 4
	db $16			;Note A#2
	db $c1			;Wait 2
	db $22			;Note A#3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_033:
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $19			;Note C#3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_036:
	db $c1			;Wait 2
	db $30			;Note C-5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $3c			;Note C-6
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $3c			;Note C-6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_037:
	db $0c			;Note C-2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $18			;Note C-3
					;Wait Repeat 4
	db $0c			;Note C-2
					;Wait Repeat 4
	db $19			;Note C#3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_038:
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $6f			;Volume 13
	db $77			;Instrument 5
	db $a2,$02			;CMD Track detune
	db $cb			;Wait 12
	db $37			;Note G-5
	db $db			;Wait 28
	db $3c			;Note C-6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $c7			;Wait 8
	db $3c			;Note C-6
					;Wait Repeat 8
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_039:
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $cb			;Wait 12
	db $37			;Note G-5
	db $77			;Instrument 5
	db $db			;Wait 28
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3c			;Note C-6
	db $77			;Instrument 5
					;Wait Repeat 8
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_040:
	db $1f			;Note G-3
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_041:
	db $07			;Note G-1
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $07			;Note G-1
	db $c1			;Wait 2
	db $13			;Note G-2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $07			;Note G-1
	db $c1			;Wait 2
	db $13			;Note G-2
	db $c1			;Wait 2
	db $07			;Note G-1
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $07			;Note G-1
	db $c1			;Wait 2
	db $13			;Note G-2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $07			;Note G-1
	db $c1			;Wait 2
	db $13			;Note G-2
	db $c1			;Wait 2
	db $07			;Note G-1
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $07			;Note G-1
	db $c1			;Wait 2
	db $13			;Note G-2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $07			;Note G-1
	db $c1			;Wait 2
	db $13			;Note G-2
	db $c1			;Wait 2
	db $07			;Note G-1
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c3			;Wait 4
	db $07			;Note G-1
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $14			;Note G#2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_042:
	db $2b			;Note G-4
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $2b			;Note G-4
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $2b			;Note G-4
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $2b			;Note G-4
					;Wait Repeat 8
	db $32			;Note D-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_043:
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $2e			;Note A#4
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $2e			;Note A#4
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $37			;Note G-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_044:
	db $c1			;Wait 2
	db $2b			;Note G-4
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $37			;Note G-5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_045:
	db $13			;Note G-2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $13			;Note G-2
	db $c5			;Wait 6
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $13			;Note G-2
	db $c5			;Wait 6
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $13			;Note G-2
	db $c3			;Wait 4
	db $1f			;Note G-3
					;Wait Repeat 4
	db $13			;Note G-2
					;Wait Repeat 4
	db $20			;Note G#3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_046:
	db $dd			;Wait 30
	db $37			;Note G-5
	db $77			;Instrument 5
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_047:
	db $db			;Wait 28
	db $37			;Note G-5
	db $77			;Instrument 5
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_048:
	db $22			;Note A#3
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2c			;Note G#4
					;Wait Repeat 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $26			;Note D-4
					;Wait Repeat 4
	db $29			;Note F-4
					;Wait Repeat 4
	db $2e			;Note A#4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_049:
	db $0a			;Note A#1
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $c1			;Wait 2
	db $0a			;Note A#1
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $c1			;Wait 2
	db $0a			;Note A#1
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $c1			;Wait 2
	db $0a			;Note A#1
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $16			;Note A#2
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 4
	db $17			;Note B-2
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_050:
	db $2e			;Note A#4
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $2e			;Note A#4
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $2e			;Note A#4
					;Wait Repeat 8
	db $35			;Note F-5
					;Wait Repeat 8
	db $2e			;Note A#4
					;Wait Repeat 8
	db $35			;Note F-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_051:
	db $c3			;Wait 4
	db $32			;Note D-5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $38			;Note G#5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $38			;Note G#5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $32			;Note D-5
					;Wait Repeat 8
	db $3a			;Note A#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_052:
	db $c1			;Wait 2
	db $2e			;Note A#4
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $38			;Note G#5
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $32			;Note D-5
					;Wait Repeat 4
	db $35			;Note F-5
					;Wait Repeat 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_053:
	db $16			;Note A#2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $16			;Note A#2
	db $c1			;Wait 2
	db $22			;Note A#3
	db $c3			;Wait 4
	db $16			;Note A#2
	db $c1			;Wait 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $16			;Note A#2
	db $c5			;Wait 6
	db $16			;Note A#2
	db $c1			;Wait 2
	db $22			;Note A#3
	db $c3			;Wait 4
	db $16			;Note A#2
	db $c1			;Wait 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $16			;Note A#2
	db $c5			;Wait 6
	db $16			;Note A#2
	db $c1			;Wait 2
	db $22			;Note A#3
	db $c3			;Wait 4
	db $16			;Note A#2
	db $c1			;Wait 2
	db $22			;Note A#3
					;Wait Repeat 2
	db $16			;Note A#2
	db $c3			;Wait 4
	db $22			;Note A#3
					;Wait Repeat 4
	db $16			;Note A#2
					;Wait Repeat 4
	db $23			;Note B-3
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_054:
	db $c1			;Wait 2
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $cb			;Wait 12
	db $35			;Note F-5
	db $77			;Instrument 5
	db $db			;Wait 28
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_055:
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $cb			;Wait 12
	db $35			;Note F-5
	db $77			;Instrument 5
	db $db			;Wait 28
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_056:
	db $24			;Note C-4
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $24			;Note C-4
					;Wait Repeat 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_057:
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_058:
	db $30			;Note C-5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $30			;Note C-5
					;Wait Repeat 8
	db $37			;Note G-5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_059:
	db $c3			;Wait 4
	db $33			;Note D#5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $3a			;Note A#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_060:
	db $c1			;Wait 2
	db $30			;Note C-5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $30			;Note C-5
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_061:
	db $0c			;Note C-2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_062:
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $6f			;Volume 13
	db $77			;Instrument 5
	db $a2,$02			;CMD Track detune
	db $fd			;Wait 62
	db $bf			;[End-Of-Track]
.track_063:
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_064:
	db $27			;Note D#4
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $27			;Note D#4
					;Wait Repeat 4
	db $2b			;Note G-4
					;Wait Repeat 4
	db $2e			;Note A#4
					;Wait Repeat 4
	db $33			;Note D#5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_065:
	db $0f			;Note D#2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $0f			;Note D#2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $0f			;Note D#2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $0f			;Note D#2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $9d,$00			;CMD Drum $01
	db $c3			;Wait 4
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_066:
	db $33			;Note D#5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $3a			;Note A#5
					;Wait Repeat 8
	db $33			;Note D#5
					;Wait Repeat 8
	db $3a			;Note A#5
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_067:
	db $c3			;Wait 4
	db $37			;Note G-5
	db $74			;Instrument 2
	db $c7			;Wait 8
	db $3f			;Note D#6
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $3f			;Note D#6
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $3f			;Note D#6
					;Wait Repeat 8
	db $37			;Note G-5
					;Wait Repeat 8
	db $3f			;Note D#6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_068:
	db $c1			;Wait 2
	db $33			;Note D#5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $3f			;Note D#6
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $3f			;Note D#6
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $3f			;Note D#6
					;Wait Repeat 4
	db $33			;Note D#5
					;Wait Repeat 4
	db $37			;Note G-5
					;Wait Repeat 4
	db $3a			;Note A#5
					;Wait Repeat 4
	db $3f			;Note D#6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_069:
	db $0f			;Note D#2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $c3			;Wait 4
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
					;Wait Repeat 2
	db $0f			;Note D#2
	db $c5			;Wait 6
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $c3			;Wait 4
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
					;Wait Repeat 2
	db $0f			;Note D#2
	db $c5			;Wait 6
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $c3			;Wait 4
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
					;Wait Repeat 2
	db $0f			;Note D#2
	db $c5			;Wait 6
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $c3			;Wait 4
	db $0f			;Note D#2
	db $c1			;Wait 2
	db $1b			;Note D#3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_070:
	db $c1			;Wait 2
	db $3f			;Note D#6
	db $6f			;Volume 13
	db $77			;Instrument 5
	db $a2,$02			;CMD Track detune
	db $fd			;Wait 62
	db $bf			;[End-Of-Track]
.track_071:
	db $3f			;Note D#6
	db $77			;Instrument 5
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_072:
	db $30			;Note C-5
	db $71			;Volume 15
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $9d,$04			;CMD Drum $04
	db $c7			;Wait 8
	db $2e			;Note A#4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c7			;Wait 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $2b			;Note G-4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $2e			;Note A#4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_073:
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_074:
	db $24			;Note C-4
	db $76			;Instrument 4
	db $e3			;Wait 36
	db $24			;Note C-4
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_075:
	db $27			;Note D#4
	db $76			;Instrument 4
	db $e3			;Wait 36
	db $33			;Note D#5
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_076:
	db $2b			;Note G-4
	db $76			;Instrument 4
	db $dd			;Wait 30
	db $0c			;Note C-2
	db $78			;Instrument 6
	db $c0			;Wait 1
	db $0c			;Note C-2
					;Wait Repeat 1
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $37			;Note G-5
	db $76			;Instrument 4
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_077:
	db $18			;Note C-3
	db $78			;Instrument 6
	db $dd			;Wait 30
	db $0c			;Note C-2
	db $c0			;Wait 1
	db $0c			;Note C-2
					;Wait Repeat 1
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_078:
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3e			;Note D-6
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $77			;Instrument 5
	db $d3			;Wait 20
	db $37			;Note G-5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c9			;Wait 10
	db $bf			;[End-Of-Track]
.track_079:
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3e			;Note D-6
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $77			;Instrument 5
	db $d3			;Wait 20
	db $37			;Note G-5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_080:
	db $2e			;Note A#4
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $30			;Note C-5
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $9d,$04			;CMD Drum $04
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c7			;Wait 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_081:
	db $07			;Note G-1
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_082:
	db $2b			;Note G-4
	db $76			;Instrument 4
	db $e7			;Wait 40
	db $2b			;Note G-4
	db $cb			;Wait 12
	db $2b			;Note G-4
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_083:
	db $22			;Note A#3
	db $76			;Instrument 4
	db $e7			;Wait 40
	db $2e			;Note A#4
	db $cb			;Wait 12
	db $2e			;Note A#4
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_084:
	db $26			;Note D-4
	db $76			;Instrument 4
	db $e7			;Wait 40
	db $26			;Note D-4
	db $cb			;Wait 12
	db $26			;Note D-4
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_085:
	db $13			;Note G-2
	db $78			;Instrument 6
	db $e4			;Wait 37
	db $13			;Note G-2
	db $c0			;Wait 1
	db $13			;Note G-2
					;Wait Repeat 1
	db $13			;Note G-2
					;Wait Repeat 1
	db $13			;Note G-2
	db $cb			;Wait 12
	db $13			;Note G-2
	db $cb			;Wait 12
	db $bf			;[End-Of-Track]
.track_086:
	db $c1			;Wait 2
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3c			;Note C-6
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $c7			;Wait 8
	db $39			;Note A-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $77			;Instrument 5
	db $e5			;Wait 38
	db $bf			;[End-Of-Track]
.track_087:
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $39			;Note A-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $77			;Instrument 5
	db $e7			;Wait 40
	db $bf			;[End-Of-Track]
.track_088:
	db $2e			;Note A#4
	db $72			;Instrument 0
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 4
	db $30			;Note C-5
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $9d,$04			;CMD Drum $04
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c7			;Wait 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $2e			;Note A#4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $9d,$04			;CMD Drum $04
	db $c7			;Wait 8
	db $2e			;Note A#4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_089:
	db $0f			;Note D#2
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_090:
	db $27			;Note D#4
	db $76			;Instrument 4
	db $e3			;Wait 36
	db $27			;Note D#4
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_091:
	db $2b			;Note G-4
	db $76			;Instrument 4
	db $e3			;Wait 36
	db $2b			;Note G-4
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_092:
	db $2e			;Note A#4
	db $76			;Instrument 4
	db $dd			;Wait 30
	db $0f			;Note D#2
	db $78			;Instrument 6
	db $c0			;Wait 1
	db $0f			;Note D#2
					;Wait Repeat 1
	db $0f			;Note D#2
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $76			;Instrument 4
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_093:
	db $1b			;Note D#3
	db $78			;Instrument 6
	db $dd			;Wait 30
	db $0f			;Note D#2
	db $c0			;Wait 1
	db $0f			;Note D#2
					;Wait Repeat 1
	db $0f			;Note D#2
	db $c3			;Wait 4
	db $0f			;Note D#2
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_094:
	db $c1			;Wait 2
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $39			;Note A-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $77			;Instrument 5
	db $d3			;Wait 20
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $77			;Instrument 5
					;Wait Repeat 4
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_095:
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3c			;Note C-6
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $39			;Note A-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $77			;Instrument 5
	db $d3			;Wait 20
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $3a			;Note A#5
	db $77			;Instrument 5
					;Wait Repeat 4
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $3a			;Note A#5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_096:
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c7			;Wait 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $2d			;Note A-4
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 8
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_097:
	db $1a			;Note D-3
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $26			;Note D-4
	db $75			;Instrument 3
	db $9d,$02			;CMD Drum $02
	db $c5			;Wait 6
	db $26			;Note D-4
	db $9d,$02			;CMD Drum $02
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_098:
	db $26			;Note D-4
	db $76			;Instrument 4
	db $e3			;Wait 36
	db $26			;Note D-4
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_099:
	db $2b			;Note G-4
	db $76			;Instrument 4
	db $e3			;Wait 36
	db $2a			;Note F#4
	db $77			;Instrument 5
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_100:
	db $2d			;Note A-4
	db $76			;Instrument 4
	db $dd			;Wait 30
	db $0e			;Note D-2
	db $78			;Instrument 6
	db $c0			;Wait 1
	db $0e			;Note D-2
					;Wait Repeat 1
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $2d			;Note A-4
	db $76			;Instrument 4
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_101:
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $dd			;Wait 30
	db $0e			;Note D-2
	db $c0			;Wait 1
	db $0e			;Note D-2
					;Wait Repeat 1
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $77			;Instrument 5
	db $db			;Wait 28
	db $bf			;[End-Of-Track]
.track_102:
	db $dd			;Wait 30
	db $39			;Note A-5
	db $77			;Instrument 5
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_103:
	db $db			;Wait 28
	db $39			;Note A-5
	db $77			;Instrument 5
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_104:
	db $0c			;Note C-2
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0c			;Note C-2
					;Wait Repeat 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0c			;Note C-2
					;Wait Repeat 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $18			;Note C-3
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $19			;Note C#3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0c			;Note C-2
					;Wait Repeat 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0c			;Note C-2
					;Wait Repeat 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $13			;Note G-2
	db $c1			;Wait 2
	db $16			;Note A#2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 2
	db $15			;Note A-2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_105:
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $26			;Note D-4
	db $75			;Instrument 3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $26			;Note D-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $26			;Note D-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $26			;Note D-4
	db $9d,$02			;CMD Drum $02
	db $c5			;Wait 6
	db $26			;Note D-4
	db $9d,$02			;CMD Drum $02
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_106:
	db $24			;Note C-4
	db $76			;Instrument 4
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_107:
	db $27			;Note D#4
	db $76			;Instrument 4
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_108:
	db $2b			;Note G-4
	db $76			;Instrument 4
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_109:
	db $0c			;Note C-2
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $18			;Note C-3
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $25			;Note C#4
	db $c1			;Wait 2
	db $0c			;Note C-2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $0c			;Note C-2
	db $c1			;Wait 2
	db $18			;Note C-3
					;Wait Repeat 2
	db $13			;Note G-2
					;Wait Repeat 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $15			;Note A-2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_110:
	db $c1			;Wait 2
	db $30			;Note C-5
	db $6e			;Volume 12
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c7			;Wait 8
	db $2e			;Note A#4
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $e5			;Wait 38
	db $bf			;[End-Of-Track]
.track_111:
	db $30			;Note C-5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $32			;Note D-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $77			;Instrument 5
	db $e7			;Wait 40
	db $bf			;[End-Of-Track]
.track_112:
	db $07			;Note G-1
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $07			;Note G-1
					;Wait Repeat 2
	db $13			;Note G-2
	db $c3			;Wait 4
	db $07			;Note G-1
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $13			;Note G-2
					;Wait Repeat 2
	db $07			;Note G-1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $07			;Note G-1
					;Wait Repeat 2
	db $13			;Note G-2
	db $c3			;Wait 4
	db $13			;Note G-2
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $14			;Note G#2
					;Wait Repeat 2
	db $07			;Note G-1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $07			;Note G-1
					;Wait Repeat 2
	db $13			;Note G-2
	db $c3			;Wait 4
	db $07			;Note G-1
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $13			;Note G-2
					;Wait Repeat 2
	db $07			;Note G-1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $07			;Note G-1
					;Wait Repeat 2
	db $13			;Note G-2
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c1			;Wait 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 2
	db $10			;Note E-2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_115:
	db $2e			;Note A#4
	db $76			;Instrument 4
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_116:
	db $32			;Note D-5
	db $76			;Instrument 4
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_117:
	db $13			;Note G-2
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $13			;Note G-2
	db $c5			;Wait 6
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
	db $c3			;Wait 4
	db $1f			;Note G-3
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $2c			;Note G#4
	db $c1			;Wait 2
	db $13			;Note G-2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $13			;Note G-2
	db $c5			;Wait 6
	db $13			;Note G-2
	db $c1			;Wait 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $1d			;Note F-3
					;Wait Repeat 2
	db $1c			;Note E-3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_118:
	db $c1			;Wait 2
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $77			;Instrument 5
	db $e5			;Wait 38
	db $bf			;[End-Of-Track]
.track_119:
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $77			;Instrument 5
	db $e7			;Wait 40
	db $bf			;[End-Of-Track]
.track_120:
	db $0a			;Note A#1
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0a			;Note A#1
					;Wait Repeat 2
	db $16			;Note A#2
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $0a			;Note A#1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0a			;Note A#1
					;Wait Repeat 2
	db $16			;Note A#2
	db $c3			;Wait 4
	db $16			;Note A#2
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $17			;Note B-2
					;Wait Repeat 2
	db $0a			;Note A#1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0a			;Note A#1
					;Wait Repeat 2
	db $16			;Note A#2
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $0a			;Note A#1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0a			;Note A#1
					;Wait Repeat 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $11			;Note F-2
	db $c1			;Wait 2
	db $14			;Note G#2
	db $9d,$04			;CMD Drum $04
					;Wait Repeat 2
	db $13			;Note G-2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_121:
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $24			;Note C-4
	db $75			;Instrument 3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $24			;Note C-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $24			;Note C-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $24			;Note C-4
	db $9d,$02			;CMD Drum $02
	db $c5			;Wait 6
	db $24			;Note C-4
	db $9d,$02			;CMD Drum $02
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_122:
	db $22			;Note A#3
	db $76			;Instrument 4
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_123:
	db $26			;Note D-4
	db $76			;Instrument 4
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_124:
	db $29			;Note F-4
	db $76			;Instrument 4
	db $ff			;Wait 64
	db $bf			;[End-Of-Track]
.track_125:
	db $0a			;Note A#1
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $0a			;Note A#1
	db $c5			;Wait 6
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $c3			;Wait 4
	db $16			;Note A#2
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $23			;Note B-3
	db $c1			;Wait 2
	db $0a			;Note A#1
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
	db $c3			;Wait 4
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $0a			;Note A#1
	db $c5			;Wait 6
	db $0a			;Note A#1
	db $c1			;Wait 2
	db $16			;Note A#2
					;Wait Repeat 2
	db $11			;Note F-2
					;Wait Repeat 2
	db $14			;Note G#2
					;Wait Repeat 2
	db $13			;Note G-2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_126:
	db $c1			;Wait 2
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $77			;Instrument 5
	db $d3			;Wait 20
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $2e			;Note A#4
	db $77			;Instrument 5
					;Wait Repeat 8
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_127:
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $30			;Note C-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $2d			;Note A-4
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $2b			;Note G-4
	db $77			;Instrument 5
	db $d3			;Wait 20
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c7			;Wait 8
	db $2e			;Note A#4
	db $77			;Instrument 5
					;Wait Repeat 8
	db $2e			;Note A#4
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_128:
	db $0e			;Note D-2
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $1b			;Note D#3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_129:
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $24			;Note C-4
	db $75			;Instrument 3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $28			;Note E-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $28			;Note E-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $28			;Note E-4
	db $9d,$02			;CMD Drum $02
	db $c5			;Wait 6
	db $28			;Note E-4
	db $9d,$02			;CMD Drum $02
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_130:
	db $26			;Note D-4
	db $76			;Instrument 4
	db $df			;Wait 32
	db $26			;Note D-4
	db $73			;Instrument 1
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_131:
	db $2a			;Note F#4
	db $76			;Instrument 4
	db $df			;Wait 32
	db $2a			;Note F#4
	db $73			;Instrument 1
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_132:
	db $2e			;Note A#4
	db $70			;Volume 14
	db $76			;Instrument 4
	db $df			;Wait 32
	db $2d			;Note A-4
	db $73			;Instrument 1
	db $df			;Wait 32
	db $bf			;[End-Of-Track]
.track_133:
	db $0e			;Note D-2
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $0e			;Note D-2
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $0e			;Note D-2
	db $c1			;Wait 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c5			;Wait 6
	db $0e			;Note D-2
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $76			;Instrument 4
	db $c1			;Wait 2
	db $27			;Note D#4
	db $c1			;Wait 2
	db $0e			;Note D-2
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $0e			;Note D-2
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $0e			;Note D-2
	db $c1			;Wait 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c5			;Wait 6
	db $0e			;Note D-2
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_134:
	db $dd			;Wait 30
	db $2d			;Note A-4
	db $77			;Instrument 5
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_135:
	db $db			;Wait 28
	db $2d			;Note A-4
	db $77			;Instrument 5
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_136:
	db $0e			;Note D-2
	db $6e			;Volume 12
	db $73			;Instrument 1
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $1b			;Note D#3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $1a			;Note D-3
					;Wait Repeat 2
	db $0e			;Note D-2
	db $c3			;Wait 4
	db $9d,$04			;CMD Drum $04
	db $c1			;Wait 2
	db $0e			;Note D-2
					;Wait Repeat 2
	db $1a			;Note D-3
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_137:
	db $9d,$00			;CMD Drum $01
	db $c7			;Wait 8
	db $24			;Note C-4
	db $75			;Instrument 3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $28			;Note E-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $28			;Note E-4
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 8
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 8
	db $28			;Note E-4
	db $9d,$02			;CMD Drum $02
	db $c7			;Wait 8
	db $bf			;[End-Of-Track]
.track_142:
	db $dd			;Wait 30
	db $32			;Note D-5
	db $77			;Instrument 5
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_143:
	db $db			;Wait 28
	db $32			;Note D-5
	db $77			;Instrument 5
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]

