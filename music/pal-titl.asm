; Song: Palomas Resque - title screen   
; By:   F.Boelens Okt. 2023             
; Period table: A440 Modern

; [ Song start data ]
	db $08					; Initial song speed.
	db $00					; Channel setup.
	dw .customvoice_start-8			; Start of the custom voices data.
	dw .drummacro_start			; Start of the drum macro data.
	dw .instrument_start			; Start of the instrument data.

; [ Song order pointer list ]
.restart:
	dw .track_000, .track_001, .track_002, .track_003, .track_004, .track_005, .track_006, .track_007	; Step:000 Pattern:000
	dw .track_008, .track_009, .track_010, .track_011, .track_012, .track_013, .track_014, .track_015	; Step:001 Pattern:001
	dw .track_016, .track_017, .track_018, .track_019, .track_020, .track_013, .track_022, .track_023	; Step:002 Pattern:002
	dw .track_024, .track_025, .track_010, .track_011, .track_028, .track_029, .track_030, .track_015	; Step:003 Pattern:003
	dw .track_032, .track_033, .track_034, .track_035, .track_036, .track_037, .track_038, .track_039	; Step:004 Pattern:004
	dw .track_040, .track_041, .track_034, .track_035, .track_044, .track_037, .track_038, .track_039	; Step:005 Pattern:005
	dw .track_048, .track_049, .track_050, .track_051, .track_052, .track_053, .track_054, .track_055	; Step:006 Pattern:006
	dw .track_048, .track_049, .track_050, .track_051, .track_052, .track_053, .track_062, .track_055	; Step:007 Pattern:007
	dw .track_032, .track_073, .track_034, .track_035, .track_076, .track_037, .track_078, .track_039	; Step:008 Pattern:009
	dw .track_064, .track_065, .track_034, .track_035, .track_068, .track_037, .track_070, .track_071	; Step:009 Pattern:008
	dw .track_080, .track_081, .track_082, .track_083, .track_084, .track_085, .track_086, .track_087	; Step:010 Pattern:010
	dw .track_088, .track_089, .track_090, .track_090, .track_090, .track_093, .track_094, .track_095	; Step:011 Pattern:011
	dw 0x0000, .restart				; End of sequence delimiter + restart address.

; [ Custom FM voices ]
.customvoice_start:
	db $00,$21,$01,$07,$da,$f6,$5f,$ff 		; Custom voice:159
	db $00,$00,$00,$00,$00,$00,$00,$00 		; Custom voice:191

; [ FM Drum macros]
.drummacro_start:
	dw .drum_00
	dw .drum_02
	dw .drum_04

.drum_00:						; Drum 0.                 
	db $04, $00							; volume Base drum
	db $1e, $10							; Percussion
	db $02							; STOP - End of Drum macro

.drum_02:						; Drum 1.                 
	db $04, $00							; volume Base drum
	db $08, $00							; volume HiHat
	db $1e, $08							; Percussion
	db $02							; STOP - End of Drum macro

.drum_04:						; Drum 2.                 
	db $06, $00							; volume Snare
	db $16, $ab, $08						; note Snare 
	db $1e, $01							; Percussion
	db $02							; STOP - End of Drum macro

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic noise1
	dw .instrument_01				; PSG sonic noise2
	dw .instrument_02				; PSG sonic       
	dw .instrument_03				; PSG sonic mod   
	dw .instrument_04				; FM+harpsicord   
	dw .instrument_05				; FM Guitar       
	dw .instrument_06				; FM percussion   
	dw .instrument_07				; FM ACCBASS      
	dw .instrument_08				; FM Clarinet     
	dw .instrument_09				;                 

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

.instrument_02:					; PSG sonic       
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

.instrument_03:					; PSG sonic mod   
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

.instrument_04:					; FM+harpsicord   
	db $b0					; FM Hardware Voice 11
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

.instrument_05:					; FM Guitar       
	db $20					; FM Hardware Voice 2
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_06:					; FM percussion   
	db $00,$04					; FM Software Voice 0
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_07:					; FM ACCBASS      
	db $e0					; FM Hardware Voice 14
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_08:					; FM Clarinet     
	db $70					; FM Hardware Voice 7
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_09:					;                 
	db $40					; FM Hardware Voice 4
								; --- Macro loop
	db $02,$10						; Mixer (T)
	db $08,$0f						; Volume _
	db $18,$fb						; Loop (-6)


; [ Song track data ]
.track_000:
	db $0e			;Note D-2
	db $71			;Volume 15
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $0e			;Note D-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_001:
	db $32			;Note D-5
	db $70			;Volume 14
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $32			;Note D-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c2			;Wait 3
	db $60			;Release 96
	db $c0			;Wait 1
	db $30			;Note C-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $32			;Note D-5
	db $c5			;Wait 6
	db $32			;Note D-5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $37			;Note G-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $35			;Note F-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_002:
	db $1a			;Note D-3
	db $71			;Volume 15
	db $76			;Instrument 4
	db $c9			;Wait 10
	db $61			;Sustain 97
	db $cd			;Wait 14
	db $1a			;Note D-3
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_003:
	db $21			;Note A-3
	db $71			;Volume 15
	db $76			;Instrument 4
	db $c9			;Wait 10
	db $61			;Sustain 97
	db $cd			;Wait 14
	db $21			;Note A-3
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_004:
	db $32			;Note D-5
	db $71			;Volume 15
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $32			;Note D-5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_005:
	db $1a			;Note D-3
	db $71			;Volume 15
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c5			;Wait 6
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_006:
	db $c1			;Wait 2
	db $32			;Note D-5
	db $6e			;Volume 12
	db $77			;Instrument 5
	db $a2,$02			;CMD Track detune
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $32			;Note D-5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_007:
	db $1a			;Note D-3
	db $71			;Volume 15
	db $79			;Instrument 7
	db $d7			;Wait 24
	db $1a			;Note D-3
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_008:
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $0e			;Note D-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $15			;Note A-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $0e			;Note D-2
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_009:
	db $32			;Note D-5
	db $70			;Volume 14
	db $74			;Instrument 2
	db $c2			;Wait 3
	db $60			;Release 96
	db $c0			;Wait 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $37			;Note G-5
	db $c1			;Wait 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $39			;Note A-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $35			;Note F-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $35			;Note F-5
	db $c1			;Wait 2
	db $34			;Note E-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $35			;Note F-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $34			;Note E-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_010:
	db $1a			;Note D-3
	db $76			;Instrument 4
	db $cb			;Wait 12
	db $1a			;Note D-3
					;Wait Repeat 12
	db $21			;Note A-3
					;Wait Repeat 12
	db $1c			;Note E-3
	db $c5			;Wait 6
	db $1a			;Note D-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_011:
	db $1d			;Note F-3
	db $76			;Instrument 4
	db $cb			;Wait 12
	db $21			;Note A-3
					;Wait Repeat 12
	db $1c			;Note E-3
					;Wait Repeat 12
	db $21			;Note A-3
	db $c5			;Wait 6
	db $21			;Note A-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_012:
	db $32			;Note D-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_013:
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_014:
	db $c1			;Wait 2
	db $32			;Note D-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_015:
	db $1a			;Note D-3
	db $79			;Instrument 7
	db $cb			;Wait 12
	db $1a			;Note D-3
					;Wait Repeat 12
	db $15			;Note A-2
	db $c5			;Wait 6
	db $15			;Note A-2
					;Wait Repeat 6
	db $15			;Note A-2
					;Wait Repeat 6
	db $1a			;Note D-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_016:
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $0e			;Note D-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_017:
	db $32			;Note D-5
	db $74			;Instrument 2
	db $c2			;Wait 3
	db $60			;Release 96
	db $c0			;Wait 1
	db $32			;Note D-5
	db $c1			;Wait 2
	db $34			;Note E-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $32			;Note D-5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $30			;Note C-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $30			;Note C-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_018:
	db $1a			;Note D-3
	db $76			;Instrument 4
	db $c9			;Wait 10
	db $61			;Sustain 97
	db $cd			;Wait 14
	db $1a			;Note D-3
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_019:
	db $21			;Note A-3
	db $76			;Instrument 4
	db $c9			;Wait 10
	db $61			;Sustain 97
	db $cd			;Wait 14
	db $21			;Note A-3
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_020:
	db $32			;Note D-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $32			;Note D-5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_022:
	db $c1			;Wait 2
	db $32			;Note D-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $32			;Note D-5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_023:
	db $1a			;Note D-3
	db $79			;Instrument 7
	db $d7			;Wait 24
	db $1a			;Note D-3
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_024:
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $0e			;Note D-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $15			;Note A-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 6
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $0e			;Note D-2
	db $9d,$02			;CMD Drum $02
	db $c1			;Wait 2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$02			;CMD Drum $02
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_025:
	db $32			;Note D-5
	db $74			;Instrument 2
	db $c2			;Wait 3
	db $60			;Release 96
	db $c0			;Wait 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $32			;Note D-5
					;Wait Repeat 1
	db $60			;Release 96
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c2			;Wait 3
	db $60			;Release 96
	db $c0			;Wait 1
	db $34			;Note E-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c0			;Wait 1
	db $60			;Release 96
					;Wait Repeat 1
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_028:
	db $32			;Note D-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_029:
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $78			;Instrument 6
					;Wait Repeat 2
	db $1a			;Note D-3
	db $78			;Instrument 6
					;Wait Repeat 2
	db $1a			;Note D-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_030:
	db $c1			;Wait 2
	db $32			;Note D-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_032:
	db $15			;Note A-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $13			;Note G-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $1f			;Note G-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $13			;Note G-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $03
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_033:
	db $39			;Note A-5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $c1			;Wait 2
	db $39			;Note A-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_034:
	db $21			;Note A-3
	db $76			;Instrument 4
	db $c5			;Wait 6
	db $21			;Note A-3
					;Wait Repeat 6
	db $21			;Note A-3
					;Wait Repeat 6
	db $21			;Note A-3
					;Wait Repeat 6
	db $1f			;Note G-3
					;Wait Repeat 6
	db $1f			;Note G-3
					;Wait Repeat 6
	db $1d			;Note F-3
					;Wait Repeat 6
	db $1d			;Note F-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_035:
	db $28			;Note E-4
	db $76			;Instrument 4
	db $c5			;Wait 6
	db $28			;Note E-4
					;Wait Repeat 6
	db $28			;Note E-4
					;Wait Repeat 6
	db $28			;Note E-4
	db $c1			;Wait 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $24			;Note C-4
					;Wait Repeat 2
	db $23			;Note B-3
	db $c5			;Wait 6
	db $23			;Note B-3
	db $c1			;Wait 2
	db $21			;Note A-3
					;Wait Repeat 2
	db $1f			;Note G-3
					;Wait Repeat 2
	db $21			;Note A-3
	db $c5			;Wait 6
	db $21			;Note A-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_036:
	db $39			;Note A-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $c1			;Wait 2
	db $39			;Note A-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_037:
	db $45			;Note A-6
	db $70			;Volume 14
	db $7a			;Instrument 8
	db $c0			;Wait 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $45			;Note A-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $45			;Note A-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $45			;Note A-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $45			;Note A-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $48			;Note C-7
	db $70			;Volume 14
					;Wait Repeat 1
	db $45			;Note A-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $47			;Note B-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $48			;Note C-7
	db $6d			;Volume 11
					;Wait Repeat 1
	db $45			;Note A-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $47			;Note B-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $45			;Note A-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $45			;Note A-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
	db $7a			;Instrument 8
					;Wait Repeat 1
	db $45			;Note A-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3e			;Note D-6
	db $70			;Volume 14
	db $7a			;Instrument 8
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3e			;Note D-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $45			;Note A-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $45			;Note A-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $45			;Note A-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $45			;Note A-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $6d			;Volume 11
	db $bf			;[End-Of-Track]
.track_038:
	db $c1			;Wait 2
	db $39			;Note A-5
	db $6e			;Volume 12
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
	db $c3			;Wait 4
	db $37			;Note G-5
	db $c1			;Wait 2
	db $39			;Note A-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_039:
	db $15			;Note A-2
	db $79			;Instrument 7
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $13			;Note G-2
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c1			;Wait 2
	db $13			;Note G-2
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c1			;Wait 2
	db $11			;Note F-2
	db $c3			;Wait 4
	db $11			;Note F-2
	db $c1			;Wait 2
	db $11			;Note F-2
					;Wait Repeat 2
	db $10			;Note E-2
					;Wait Repeat 2
	db $11			;Note F-2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_040:
	db $15			;Note A-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $72			;Instrument 0
	db $c1			;Wait 2
	db $15			;Note A-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $13			;Note G-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $1f			;Note G-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $13			;Note G-2
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $13			;Note G-2
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_041:
	db $39			;Note A-5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_044:
	db $39			;Note A-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3b			;Note B-5
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_048:
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $c1			;Wait 2
	db $0e			;Note D-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $18			;Note C-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0c			;Note C-2
	db $73			;Instrument 1
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_049:
	db $32			;Note D-5
	db $74			;Instrument 2
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
	db $c3			;Wait 4
	db $35			;Note F-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_050:
	db $26			;Note D-4
	db $76			;Instrument 4
	db $c5			;Wait 6
	db $26			;Note D-4
					;Wait Repeat 6
	db $26			;Note D-4
					;Wait Repeat 6
	db $26			;Note D-4
	db $c1			;Wait 2
	db $2d			;Note A-4
					;Wait Repeat 2
	db $2b			;Note G-4
					;Wait Repeat 2
	db $29			;Note F-4
	db $c5			;Wait 6
	db $29			;Note F-4
	db $c1			;Wait 2
	db $28			;Note E-4
					;Wait Repeat 2
	db $26			;Note D-4
					;Wait Repeat 2
	db $24			;Note C-4
	db $c5			;Wait 6
	db $24			;Note C-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_051:
	db $2d			;Note A-4
	db $76			;Instrument 4
	db $c5			;Wait 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $2b			;Note G-4
					;Wait Repeat 6
	db $2b			;Note G-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_052:
	db $32			;Note D-5
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
	db $c3			;Wait 4
	db $35			;Note F-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_053:
	db $3e			;Note D-6
	db $70			;Volume 14
	db $7a			;Instrument 8
	db $c0			;Wait 1
	db $32			;Note D-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3e			;Note D-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3e			;Note D-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3e			;Note D-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $39			;Note A-5
	db $70			;Volume 14
					;Wait Repeat 1
	db $3e			;Note D-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $39			;Note A-5
	db $6d			;Volume 11
					;Wait Repeat 1
	db $41			;Note F-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $41			;Note F-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $41			;Note F-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $41			;Note F-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $41			;Note F-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $3c			;Note C-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $3c			;Note C-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $40			;Note E-6
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
	db $48			;Note C-7
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
					;Wait Repeat 1
	db $43			;Note G-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $48			;Note C-7
	db $6d			;Volume 11
					;Wait Repeat 1
	db $40			;Note E-6
	db $70			;Volume 14
					;Wait Repeat 1
	db $43			;Note G-6
	db $6d			;Volume 11
	db $bf			;[End-Of-Track]
.track_054:
	db $c1			;Wait 2
	db $32			;Note D-5
	db $6e			;Volume 12
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
	db $c3			;Wait 4
	db $35			;Note F-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_055:
	db $1a			;Note D-3
	db $79			;Instrument 7
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1d			;Note F-3
	db $c3			;Wait 4
	db $1d			;Note F-3
	db $c1			;Wait 2
	db $1d			;Note F-3
	db $c3			;Wait 4
	db $1d			;Note F-3
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $18			;Note C-3
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $18			;Note C-3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_062:
	db $c1			;Wait 2
	db $32			;Note D-5
	db $6e			;Volume 12
	db $77			;Instrument 5
	db $c3			;Wait 4
	db $32			;Note D-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $35			;Note F-5
	db $c3			;Wait 4
	db $35			;Note F-5
	db $c1			;Wait 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $35			;Note F-5
					;Wait Repeat 2
	db $34			;Note E-5
	db $c3			;Wait 4
	db $34			;Note E-5
	db $c1			;Wait 2
	db $34			;Note E-5
					;Wait Repeat 2
	db $32			;Note D-5
					;Wait Repeat 2
	db $30			;Note C-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c3			;Wait 4
	db $30			;Note C-5
	db $c1			;Wait 2
	db $32			;Note D-5
	db $c1			;Wait 2
	db $18			;Note C-3
	db $78			;Instrument 6
	db $c0			;Wait 1
	db $18			;Note C-3
	db $78			;Instrument 6
	db $bf			;[End-Of-Track]
.track_064:
	db $15			;Note A-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $13			;Note G-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $1f			;Note G-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $13			;Note G-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $13			;Note G-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $03
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_065:
	db $39			;Note A-5
	db $75			;Instrument 3
	db $c5			;Wait 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $40			;Note E-6
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $c1			;Wait 2
	db $3e			;Note D-6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $40			;Note E-6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $c1			;Wait 2
	db $3e			;Note D-6
	db $72			;Instrument 0
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_068:
	db $39			;Note A-5
	db $77			;Instrument 5
	db $c5			;Wait 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $40			;Note E-6
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $c1			;Wait 2
	db $3e			;Note D-6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $40			;Note E-6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $39			;Note A-5
					;Wait Repeat 2
	db $37			;Note G-5
					;Wait Repeat 2
	db $32			;Note D-5
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_070:
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $21			;Note A-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $13			;Note G-2
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $13			;Note G-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $13			;Note G-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $1f			;Note G-3
	db $78			;Instrument 6
	db $c0			;Wait 1
	db $1f			;Note G-3
	db $78			;Instrument 6
					;Wait Repeat 1
	db $1f			;Note G-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1d			;Note F-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_071:
	db $15			;Note A-2
	db $79			;Instrument 7
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $13			;Note G-2
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c1			;Wait 2
	db $13			;Note G-2
	db $c3			;Wait 4
	db $13			;Note G-2
	db $c1			;Wait 2
	db $11			;Note F-2
	db $c5			;Wait 6
	db $11			;Note F-2
	db $c3			;Wait 4
	db $11			;Note F-2
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_073:
	db $39			;Note A-5
	db $75			;Instrument 3
	db $c5			;Wait 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $40			;Note E-6
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $c1			;Wait 2
	db $3e			;Note D-6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $40			;Note E-6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $c5			;Wait 6
	db $39			;Note A-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_076:
	db $39			;Note A-5
	db $77			;Instrument 5
	db $c5			;Wait 6
	db $39			;Note A-5
					;Wait Repeat 6
	db $39			;Note A-5
	db $c1			;Wait 2
	db $3c			;Note C-6
					;Wait Repeat 2
	db $3e			;Note D-6
					;Wait Repeat 2
	db $40			;Note E-6
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $c1			;Wait 2
	db $3e			;Note D-6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $40			;Note E-6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $c5			;Wait 6
	db $39			;Note A-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_078:
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $21			;Note A-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $15			;Note A-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $13			;Note G-2
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $13			;Note G-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $13			;Note G-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $1f			;Note G-3
	db $78			;Instrument 6
	db $c0			;Wait 1
	db $1f			;Note G-3
	db $78			;Instrument 6
					;Wait Repeat 1
	db $1f			;Note G-3
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $1d			;Note F-3
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $11			;Note F-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $11			;Note F-2
	db $78			;Instrument 6
					;Wait Repeat 2
	db $1d			;Note F-3
	db $78			;Instrument 6
					;Wait Repeat 2
	db $11			;Note F-2
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_080:
	db $15			;Note A-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $18			;Note C-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0c			;Note C-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0c			;Note C-2
	db $9d,$04			;CMD Drum $03
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_081:
	db $34			;Note E-5
	db $c3			;Wait 4
	db $60			;Release 96
	db $eb			;Wait 44
	db $bf			;[End-Of-Track]
.track_082:
	db $2d			;Note A-4
	db $76			;Instrument 4
	db $ef			;Wait 48
	db $bf			;[End-Of-Track]
.track_083:
	db $30			;Note C-5
	db $76			;Instrument 4
	db $ef			;Wait 48
	db $bf			;[End-Of-Track]
.track_084:
	db $34			;Note E-5
	db $ef			;Wait 48
	db $bf			;[End-Of-Track]
.track_085:
	db $34			;Note E-5
	db $76			;Instrument 4
	db $cb			;Wait 12
	db $45			;Note A-6
	db $7b			;Instrument 9
	db $c3			;Wait 4
	db $4a			;Note D-7
	db $c0			;Wait 1
	db $4b			;Note D#7
					;Wait Repeat 1
	db $4c			;Note E-7
	db $c3			;Wait 4
	db $60			;Release 96
	db $d9			;Wait 26
	db $bf			;[End-Of-Track]
.track_086:
	db $39			;Note A-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $39			;Note A-5
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $39			;Note A-5
	db $78			;Instrument 6
					;Wait Repeat 2
	db $45			;Note A-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $45			;Note A-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $45			;Note A-6
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $41			;Note F-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $43			;Note G-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $41			;Note F-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $40			;Note E-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $41			;Note F-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $40			;Note E-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $3c			;Note C-6
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_087:
	db $15			;Note A-2
	db $79			;Instrument 7
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1d			;Note F-3
	db $c3			;Wait 4
	db $1d			;Note F-3
	db $c1			;Wait 2
	db $1d			;Note F-3
	db $c3			;Wait 4
	db $1d			;Note F-3
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $18			;Note C-3
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $18			;Note C-3
	db $c1			;Wait 2
	db $bf			;[End-Of-Track]
.track_088:
	db $15			;Note A-2
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c1			;Wait 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0e			;Note D-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $11			;Note F-2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
					;Wait Repeat 2
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $18			;Note C-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 2
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_089:
	db $c3			;Wait 4
	db $60			;Release 96
	db $eb			;Wait 44
	db $bf			;[End-Of-Track]
.track_090:
	db $ef			;Wait 48
	db $bf			;[End-Of-Track]
.track_093:
	db $cb			;Wait 12
	db $45			;Note A-6
	db $c3			;Wait 4
	db $4a			;Note D-7
	db $c0			;Wait 1
	db $4b			;Note D#7
					;Wait Repeat 1
	db $4c			;Note E-7
	db $c3			;Wait 4
	db $60			;Release 96
	db $d9			;Wait 26
	db $bf			;[End-Of-Track]
.track_094:
	db $39			;Note A-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $39			;Note A-5
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $39			;Note A-5
	db $78			;Instrument 6
					;Wait Repeat 2
	db $45			;Note A-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $45			;Note A-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $45			;Note A-6
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $3e			;Note D-6
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $41			;Note F-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $43			;Note G-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $41			;Note F-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $40			;Note E-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $41			;Note F-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $40			;Note E-6
	db $78			;Instrument 6
					;Wait Repeat 2
	db $3c			;Note C-6
	db $78			;Instrument 6
	db $c3			;Wait 4
	db $3c			;Note C-6
	db $78			;Instrument 6
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_095:
	db $15			;Note A-2
	db $79			;Instrument 7
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $15			;Note A-2
	db $c1			;Wait 2
	db $15			;Note A-2
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1a			;Note D-3
	db $c3			;Wait 4
	db $1a			;Note D-3
	db $c1			;Wait 2
	db $1d			;Note F-3
	db $c3			;Wait 4
	db $1d			;Note F-3
	db $c1			;Wait 2
	db $1d			;Note F-3
	db $c3			;Wait 4
	db $1d			;Note F-3
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c3			;Wait 4
	db $18			;Note C-3
	db $c1			;Wait 2
	db $18			;Note C-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]

