; Song: Palomas Rescue Morgaths dungeons
; By:   F.Boelens Feb-24                
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
	dw .track_008, .track_009, .track_010, .track_011, .track_012, .track_013, .track_014, .track_015	; Step:002 Pattern:001
	dw .track_008, .track_009, .track_010, .track_019, .track_020, .track_013, .track_022, .track_023	; Step:003 Pattern:002
	dw .track_008, .track_025, .track_026, .track_019, .track_028, .track_029, .track_030, .track_015	; Step:004 Pattern:003
	dw .track_032, .track_033, .track_034, .track_035, .track_036, .track_037, .track_038, .track_039	; Step:005 Pattern:004
	dw .track_008, .track_025, .track_010, .track_019, .track_044, .track_029, .track_046, .track_047	; Step:006 Pattern:005
	dw .track_008, .track_009, .track_010, .track_019, .track_020, .track_013, .track_022, .track_023	; Step:007 Pattern:002
	dw .track_008, .track_025, .track_026, .track_019, .track_028, .track_029, .track_030, .track_015	; Step:008 Pattern:003
	dw .track_032, .track_033, .track_034, .track_035, .track_036, .track_037, .track_038, .track_039	; Step:009 Pattern:004
	dw .track_008, .track_025, .track_010, .track_019, .track_044, .track_029, .track_046, .track_047	; Step:010 Pattern:005
	dw .track_048, .track_049, .track_050, .track_051, .track_052, .track_053, .track_054, .track_055	; Step:011 Pattern:006
	dw .track_008, .track_025, .track_010, .track_019, .track_060, .track_029, .track_062, .track_063	; Step:012 Pattern:007
	dw .track_064, .track_065, .track_066, .track_067, .track_068, .track_069, .track_070, .track_071	; Step:013 Pattern:008
	dw .track_008, .track_025, .track_010, .track_019, .track_076, .track_029, .track_078, .track_079	; Step:014 Pattern:009
	dw .track_048, .track_049, .track_050, .track_051, .track_052, .track_053, .track_054, .track_055	; Step:015 Pattern:006
	dw .track_008, .track_025, .track_010, .track_019, .track_060, .track_029, .track_062, .track_063	; Step:016 Pattern:007
	dw .track_080, .track_081, .track_066, .track_083, .track_084, .track_085, .track_086, .track_087	; Step:017 Pattern:010
	dw .track_008, .track_009, .track_010, .track_019, .track_092, .track_013, .track_094, .track_095	; Step:018 Pattern:011
	dw .track_008, .track_009, .track_010, .track_011, .track_100, .track_013, .track_014, .track_015	; Step:019 Pattern:012
	dw .track_008, .track_009, .track_010, .track_011, .track_100, .track_013, .track_110, .track_111	; Step:020 Pattern:013
	dw .track_008, .track_009, .track_010, .track_019, .track_100, .track_013, .track_118, .track_119	; Step:021 Pattern:014
	dw .track_008, .track_009, .track_010, .track_011, .track_100, .track_013, .track_126, .track_127	; Step:022 Pattern:015
	dw .track_128, .track_009, .track_010, .track_011, .track_100, .track_013, .track_134, .track_135	; Step:023 Pattern:016
	dw .track_136, .track_137, .track_138, .track_139, .track_140, .track_014, .track_142, .track_143	; Step:024 Pattern:017
	dw .track_144, .track_145, .track_146, .track_147, .track_148, .track_015, .track_150, .track_151	; Step:025 Pattern:018
	dw .track_152, .track_153, .track_154, .track_155, .track_156, .track_015, .track_158, .track_159	; Step:026 Pattern:019
	dw .track_160, .track_161, .track_162, .track_163, .track_164, .track_165, .track_166, .track_015	; Step:027 Pattern:020
	dw 0x0000, .restart				; End of sequence delimiter + restart address.

; [ Custom FM voices ]
.customvoice_start:
	db $61,$31,$94,$07,$e4,$c1,$1b,$eb 		; Custom voice:70
	db $73,$31,$0f,$06,$c1,$f2,$cf,$4e 		; Custom voice:167
	db $61,$61,$1f,$07,$c5,$96,$f5,$f6 		; Custom voice:173
	db $81,$11,$85,$5a,$64,$62,$12,$00 		; Custom voice:177

; [ FM Drum macros]
.drummacro_start:
	dw .drum_00
	dw .drum_02
	dw .drum_04

.drum_00:						; Drum 0.                 
	db $04, $00							; volume Base drum
	db $12, $ab, $02						; note Bdrum
	db $1e, $10							; Percussion
	db $02							; STOP - End of Drum macro

.drum_02:						; Drum 1.                 
	db $04, $00							; volume Base drum
	db $0a, $33							; volume Snare + HiHat
	db $16, $ab, $06						; note Snare 
	db $1e, $19							; Percussion
	db $02							; STOP - End of Drum macro

.drum_04:						; Drum 2.                 
	db $06, $30							; volume Snare
	db $16, $ab, $08						; note Snare 
	db $1e, $01							; Percussion
	db $02							; STOP - End of Drum macro

; [ Instruments]
.instrument_start:
	dw .instrument_00				; PSG sonic noise1
	dw .instrument_01				; FM trumpet      
	dw .instrument_02				; FM BELL         
	dw .instrument_03				; FM PLUCKED PSG B
	dw .instrument_04				; BD POW Solid    
	dw .instrument_05				; SD POW Solid    
	dw .instrument_06				; FM Violin       
	dw .instrument_07				; FM Heavy trumpet
	dw .instrument_08				; FM Heavy bass   
	dw .instrument_09				; Horn            
	dw .instrument_10				;                 
	dw .instrument_11				; FM Synth bell   

.instrument_00:					; PSG sonic noise1
	db $00,$04					; FM Software Voice 0
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
	db $02,$10						; Mixer (T)
	db $08,$0c						; Volume _
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

.instrument_03:					; FM PLUCKED PSG B
	db $00,$0c					; FM Software Voice 2
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

.instrument_04:					; BD POW Solid    
	db $f0					; FM Hardware Voice 15
	db $02,$10						; Mixer (T)
	db $08,$0e						; Volume _
								; --- Macro loop
	db $02,$80						; Mixer (N)
	db $08,$00						; Volume _
	db $18,$fb						; Loop (-6)

.instrument_05:					; SD POW Solid    
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

.instrument_06:					; FM Violin       
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

.instrument_07:					; FM Heavy trumpet
	db $00,$10					; FM Software Voice 3
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

.instrument_08:					; FM Heavy bass   
	db $e0					; FM Hardware Voice 14
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

.instrument_09:					; Horn            
	db $70					; FM Hardware Voice 7
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
	db $08,$0c						; Volume _
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

.instrument_10:					;                 
	db $10					; FM Hardware Voice 1
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

.instrument_11:					; FM Synth bell   
	db $00,$08					; FM Software Voice 1
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
	db $02,$10						; Mixer (T)
	db $00							; Volume same
	db $18,$e6						; Loop (-27)


; [ Song track data ]
.track_000:
	db $0c			;Note C-2
	db $71			;Volume 15
	db $76			;Instrument 4
	db $a4,$07			;CMD Speed
	db $d1			;Wait 18
	db $0c			;Note C-2
	db $9d,$00			;CMD Drum $01
	db $cb			;Wait 12
	db $0c			;Note C-2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_001:
	db $30			;Note C-5
	db $6e			;Volume 12
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c2			;Wait 3
	db $33			;Note D#5
	db $9e,$00			;CMD Arpegio speed
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_002:
	db $30			;Note C-5
	db $71			;Volume 15
	db $78			;Instrument 6
	db $a2,$00			;CMD Track detune
	db $c2			;Wait 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_003:
	db $c1			;Wait 2
	db $30			;Note C-5
	db $6e			;Volume 12
	db $78			;Instrument 6
	db $a2,$02			;CMD Track detune
	db $c2			;Wait 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
					;Wait Repeat 3
	db $30			;Note C-5
					;Wait Repeat 3
	db $33			;Note D#5
	db $bf			;[End-Of-Track]
.track_004:
	db $60			;Release 96
	db $71			;Volume 15
	db $72			;Instrument 0
	db $dd			;Wait 30
	db $0c			;Note C-2
	db $7a			;Instrument 8
	db $c0			;Wait 1
	db $0f			;Note D#2
					;Wait Repeat 1
	db $11			;Note F-2
					;Wait Repeat 1
	db $13			;Note G-2
					;Wait Repeat 1
	db $15			;Note A-2
					;Wait Repeat 1
	db $16			;Note A#2
	db $bf			;[End-Of-Track]
.track_005:
	db $48			;Note C-7
	db $71			;Volume 15
	db $74			;Instrument 2
	db $a2,$00			;CMD Track detune
	db $c2			;Wait 3
	db $4b			;Note D#7
					;Wait Repeat 3
	db $48			;Note C-7
					;Wait Repeat 3
	db $4b			;Note D#7
					;Wait Repeat 3
	db $48			;Note C-7
					;Wait Repeat 3
	db $4b			;Note D#7
					;Wait Repeat 3
	db $48			;Note C-7
					;Wait Repeat 3
	db $4b			;Note D#7
					;Wait Repeat 3
	db $48			;Note C-7
					;Wait Repeat 3
	db $4b			;Note D#7
					;Wait Repeat 3
	db $48			;Note C-7
					;Wait Repeat 3
	db $4b			;Note D#7
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_006:
	db $60			;Release 96
	db $71			;Volume 15
	db $72			;Instrument 0
	db $dd			;Wait 30
	db $18			;Note C-3
	db $75			;Instrument 3
	db $c0			;Wait 1
	db $1b			;Note D#3
	db $75			;Instrument 3
					;Wait Repeat 1
	db $1d			;Note F-3
	db $75			;Instrument 3
					;Wait Repeat 1
	db $1f			;Note G-3
	db $75			;Instrument 3
					;Wait Repeat 1
	db $21			;Note A-3
	db $75			;Instrument 3
					;Wait Repeat 1
	db $22			;Note A#3
	db $75			;Instrument 3
	db $bf			;[End-Of-Track]
.track_007:
	db $60			;Release 96
	db $71			;Volume 15
	db $72			;Instrument 0
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_008:
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $18			;Note C-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $18			;Note C-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $77			;Instrument 5
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $18			;Note C-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $18			;Note C-3
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_009:
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $1f			;Note G-3
					;Wait Repeat 6
	db $1f			;Note G-3
					;Wait Repeat 6
	db $07			;Note G-1
					;Wait Repeat 6
	db $1f			;Note G-3
					;Wait Repeat 6
	db $1f			;Note G-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_010:
	db $18			;Note C-3
	db $7a			;Instrument 8
	db $d1			;Wait 18
	db $13			;Note G-2
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_011:
	db $c5			;Wait 6
	db $30			;Note C-5
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $30			;Note C-5
	db $cb			;Wait 12
	db $30			;Note C-5
	db $c5			;Wait 6
	db $30			;Note C-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_012:
	db $60			;Release 96
	db $c5			;Wait 6
	db $33			;Note D#5
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $33			;Note D#5
	db $cb			;Wait 12
	db $33			;Note D#5
	db $c5			;Wait 6
	db $33			;Note D#5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_013:
	db $c5			;Wait 6
	db $2b			;Note G-4
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $2b			;Note G-4
	db $cb			;Wait 12
	db $2b			;Note G-4
	db $c5			;Wait 6
	db $2b			;Note G-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_014:
	db $60			;Release 96
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_015:
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_019:
	db $30			;Note C-5
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $30			;Note C-5
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $30			;Note C-5
	db $cb			;Wait 12
	db $30			;Note C-5
	db $c5			;Wait 6
	db $30			;Note C-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_020:
	db $60			;Release 96
	db $c1			;Wait 2
	db $30			;Note C-5
	db $6f			;Volume 13
	db $7d			;Instrument 11
	db $a2,$02			;CMD Track detune
	db $c5			;Wait 6
	db $32			;Note D-5
					;Wait Repeat 6
	db $33			;Note D#5
					;Wait Repeat 6
	db $37			;Note G-5
					;Wait Repeat 6
	db $3c			;Note C-6
					;Wait Repeat 6
	db $3b			;Note B-5
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_022:
	db $30			;Note C-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $32			;Note D-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $33			;Note D#5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $37			;Note G-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $3c			;Note C-6
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $3b			;Note B-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_023:
	db $9c			;CMD End 
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_025:
	db $0c			;Note C-2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $1f			;Note G-3
					;Wait Repeat 6
	db $1f			;Note G-3
					;Wait Repeat 6
	db $07			;Note G-1
					;Wait Repeat 6
	db $1d			;Note F-3
					;Wait Repeat 6
	db $1d			;Note F-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_026:
	db $18			;Note C-3
	db $7a			;Instrument 8
	db $d1			;Wait 18
	db $13			;Note G-2
	db $c5			;Wait 6
	db $15			;Note A-2
					;Wait Repeat 6
	db $18			;Note C-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_028:
	db $60			;Release 96
	db $c1			;Wait 2
	db $3a			;Note A#5
	db $7d			;Instrument 11
	db $a2,$02			;CMD Track detune
	db $c5			;Wait 6
	db $37			;Note G-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $39			;Note A-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_029:
	db $c5			;Wait 6
	db $2b			;Note G-4
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $2b			;Note G-4
	db $cb			;Wait 12
	db $29			;Note F-4
	db $c5			;Wait 6
	db $29			;Note F-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_030:
	db $3a			;Note A#5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $37			;Note G-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $39			;Note A-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_032:
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $19			;Note C#3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $19			;Note C#3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $77			;Instrument 5
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $19			;Note C#3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $19			;Note C#3
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_033:
	db $0d			;Note C#2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $20			;Note G#3
					;Wait Repeat 6
	db $20			;Note G#3
					;Wait Repeat 6
	db $08			;Note G#1
					;Wait Repeat 6
	db $20			;Note G#3
					;Wait Repeat 6
	db $20			;Note G#3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_034:
	db $19			;Note C#3
	db $7a			;Instrument 8
	db $d1			;Wait 18
	db $14			;Note G#2
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_035:
	db $31			;Note C#5
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $31			;Note C#5
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $31			;Note C#5
	db $cb			;Wait 12
	db $31			;Note C#5
	db $c5			;Wait 6
	db $31			;Note C#5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_036:
	db $c1			;Wait 2
	db $31			;Note C#5
	db $7d			;Instrument 11
	db $d1			;Wait 18
	db $38			;Note G#5
	db $7d			;Instrument 11
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_037:
	db $c5			;Wait 6
	db $2c			;Note G#4
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $2c			;Note G#4
	db $cb			;Wait 12
	db $2c			;Note G#4
	db $c5			;Wait 6
	db $2c			;Note G#4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_038:
	db $31			;Note C#5
	db $7d			;Instrument 11
	db $d1			;Wait 18
	db $38			;Note G#5
	db $7d			;Instrument 11
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_039:
	db $31			;Note C#5
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $33			;Note D#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $35			;Note F-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $37			;Note G-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $38			;Note G#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3a			;Note A#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3d			;Note C#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $41			;Note F-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $44			;Note G#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $41			;Note F-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3d			;Note C#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $38			;Note G#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $33			;Note D#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $31			;Note C#5
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_044:
	db $60			;Release 96
	db $c1			;Wait 2
	db $30			;Note C-5
	db $7d			;Instrument 11
	db $d1			;Wait 18
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_046:
	db $30			;Note C-5
	db $7d			;Instrument 11
	db $d1			;Wait 18
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_047:
	db $30			;Note C-5
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $32			;Note D-5
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $33			;Note D#5
	db $71			;Volume 15
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $34			;Note E-5
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $35			;Note F-5
	db $71			;Volume 15
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $36			;Note F#5
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $37			;Note G-5
	db $71			;Volume 15
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3a			;Note A#5
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $3c			;Note C-6
	db $71			;Volume 15
					;Wait Repeat 1
	db $6e			;Volume 12
	db $c1			;Wait 2
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $6e			;Volume 12
	db $c1			;Wait 2
	db $43			;Note G-6
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $94,$01			;CMD Arpeggio
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_048:
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $1d			;Note F-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $1d			;Note F-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $77			;Instrument 5
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $1d			;Note F-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $1d			;Note F-3
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_049:
	db $11			;Note F-2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $18			;Note C-3
					;Wait Repeat 6
	db $18			;Note C-3
					;Wait Repeat 6
	db $0c			;Note C-2
					;Wait Repeat 6
	db $18			;Note C-3
					;Wait Repeat 6
	db $18			;Note C-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_050:
	db $1d			;Note F-3
	db $7a			;Instrument 8
	db $d1			;Wait 18
	db $18			;Note C-3
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_051:
	db $c5			;Wait 6
	db $35			;Note F-5
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $35			;Note F-5
	db $cb			;Wait 12
	db $35			;Note F-5
	db $c5			;Wait 6
	db $35			;Note F-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_052:
	db $c1			;Wait 2
	db $35			;Note F-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $37			;Note G-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $38			;Note G#5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $3c			;Note C-6
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $3f			;Note D#6
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $3e			;Note D-6
	db $7d			;Instrument 11
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_053:
	db $c5			;Wait 6
	db $24			;Note C-4
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $24			;Note C-4
	db $cb			;Wait 12
	db $24			;Note C-4
	db $c5			;Wait 6
	db $24			;Note C-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_054:
	db $35			;Note F-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $37			;Note G-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $38			;Note G#5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $3c			;Note C-6
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $3f			;Note D#6
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $3e			;Note D-6
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_055:
	db $35			;Note F-5
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $9c			;CMD End 
	db $c0			;Wait 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $37			;Note G-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $38			;Note G#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $41			;Note F-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $43			;Note G-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $44			;Note G#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $48			;Note C-7
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $44			;Note G#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $43			;Note G-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $41			;Note F-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $38			;Note G#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $37			;Note G-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
	db $bf			;[End-Of-Track]
.track_060:
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $33			;Note D#5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $cf			;Wait 16
	db $bf			;[End-Of-Track]
.track_062:
	db $3c			;Note C-6
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $33			;Note D#5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_063:
	db $30			;Note C-5
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $9c			;CMD End 
	db $c0			;Wait 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $32			;Note D-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $33			;Note D#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $35			;Note F-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $37			;Note G-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3a			;Note A#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $43			;Note G-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3a			;Note A#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $37			;Note G-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $35			;Note F-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $32			;Note D-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $30			;Note C-5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
	db $bf			;[End-Of-Track]
.track_064:
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $1f			;Note G-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $1f			;Note G-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $77			;Instrument 5
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $1d			;Note F-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $1d			;Note F-3
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_065:
	db $13			;Note G-2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $0e			;Note D-2
					;Wait Repeat 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $1a			;Note D-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_066:
	db $1f			;Note G-3
	db $7a			;Instrument 8
	db $d1			;Wait 18
	db $1a			;Note D-3
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_067:
	db $c5			;Wait 6
	db $37			;Note G-5
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $37			;Note G-5
	db $cb			;Wait 12
	db $35			;Note F-5
	db $c5			;Wait 6
	db $35			;Note F-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_068:
	db $c1			;Wait 2
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $38			;Note G#5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $37			;Note G-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $32			;Note D-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_069:
	db $c5			;Wait 6
	db $26			;Note D-4
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $26			;Note D-4
	db $cb			;Wait 12
	db $26			;Note D-4
	db $c5			;Wait 6
	db $26			;Note D-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_070:
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $38			;Note G#5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $37			;Note G-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $32			;Note D-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_071:
	db $43			;Note G-6
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $44			;Note G#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $43			;Note G-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $41			;Note F-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3a			;Note A#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3a			;Note A#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
	db $bf			;[End-Of-Track]
.track_076:
	db $c1			;Wait 2
	db $33			;Note D#5
	db $7d			;Instrument 11
	db $cb			;Wait 12
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $d5			;Wait 22
	db $bf			;[End-Of-Track]
.track_078:
	db $33			;Note D#5
	db $7d			;Instrument 11
	db $cb			;Wait 12
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $d7			;Wait 24
	db $bf			;[End-Of-Track]
.track_079:
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c5			;Wait 6
	db $9c			;CMD End 
	db $cb			;Wait 12
	db $94,$01			;CMD Arpeggio
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_080:
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $1f			;Note G-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $1f			;Note G-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $77			;Instrument 5
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $1d			;Note F-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $1f			;Note G-3
	db $9d,$04			;CMD Drum $03
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_081:
	db $13			;Note G-2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $0e			;Note D-2
					;Wait Repeat 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $1c			;Note E-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_083:
	db $c5			;Wait 6
	db $37			;Note G-5
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $37			;Note G-5
	db $cb			;Wait 12
	db $35			;Note F-5
	db $c5			;Wait 6
	db $37			;Note G-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_084:
	db $c1			;Wait 2
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $38			;Note G#5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $37			;Note G-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $32			;Note D-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $34			;Note E-5
	db $7d			;Instrument 11
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_085:
	db $c5			;Wait 6
	db $26			;Note D-4
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $26			;Note D-4
	db $cb			;Wait 12
	db $26			;Note D-4
	db $c5			;Wait 6
	db $24			;Note C-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_086:
	db $37			;Note G-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $38			;Note G#5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $37			;Note G-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $35			;Note F-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $32			;Note D-5
	db $7d			;Instrument 11
					;Wait Repeat 6
	db $34			;Note E-5
	db $7d			;Instrument 11
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_087:
	db $43			;Note G-6
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c0			;Wait 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $44			;Note G#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $43			;Note G-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $41			;Note F-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3a			;Note A#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3f			;Note D#6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3e			;Note D-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3a			;Note A#5
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $3c			;Note C-6
	db $71			;Volume 15
	db $7b			;Instrument 9
					;Wait Repeat 1
	db $6e			;Volume 12
					;Wait Repeat 1
	db $40			;Note E-6
	db $71			;Volume 15
	db $7b			;Instrument 9
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_092:
	db $c1			;Wait 2
	db $30			;Note C-5
	db $7d			;Instrument 11
	db $c3			;Wait 4
	db $34			;Note E-5
	db $7c			;Instrument 10
	db $c5			;Wait 6
	db $34			;Note E-5
	db $cb			;Wait 12
	db $34			;Note E-5
	db $c5			;Wait 6
	db $34			;Note E-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_094:
	db $30			;Note C-5
	db $7d			;Instrument 11
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_095:
	db $3c			;Note C-6
	db $7b			;Instrument 9
	db $d1			;Wait 18
	db $94,$01			;CMD Arpeggio
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_100:
	db $60			;Release 96
	db $c5			;Wait 6
	db $34			;Note E-5
	db $7c			;Instrument 10
					;Wait Repeat 6
	db $34			;Note E-5
	db $cb			;Wait 12
	db $34			;Note E-5
	db $c5			;Wait 6
	db $34			;Note E-5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_110:
	db $37			;Note G-5
	db $79			;Instrument 7
	db $dd			;Wait 30
	db $37			;Note G-5
	db $79			;Instrument 7
	db $c0			;Wait 1
	db $38			;Note G#5
	db $79			;Instrument 7
					;Wait Repeat 1
	db $39			;Note A-5
	db $79			;Instrument 7
					;Wait Repeat 1
	db $3a			;Note A#5
	db $79			;Instrument 7
					;Wait Repeat 1
	db $3b			;Note B-5
	db $79			;Instrument 7
					;Wait Repeat 1
	db $3c			;Note C-6
	db $79			;Instrument 7
	db $bf			;[End-Of-Track]
.track_111:
	db $c1			;Wait 2
	db $37			;Note G-5
	db $6e			;Volume 12
	db $79			;Instrument 7
	db $9c			;CMD End 
	db $dd			;Wait 30
	db $37			;Note G-5
	db $c0			;Wait 1
	db $38			;Note G#5
					;Wait Repeat 1
	db $39			;Note A-5
					;Wait Repeat 1
	db $3a			;Note A#5
	db $bf			;[End-Of-Track]
.track_118:
	db $3c			;Note C-6
	db $79			;Instrument 7
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_119:
	db $c1			;Wait 2
	db $3c			;Note C-6
	db $6e			;Volume 12
	db $79			;Instrument 7
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_126:
	db $40			;Note E-6
	db $79			;Instrument 7
	db $dd			;Wait 30
	db $40			;Note E-6
	db $79			;Instrument 7
	db $c0			;Wait 1
	db $41			;Note F-6
	db $79			;Instrument 7
					;Wait Repeat 1
	db $43			;Note G-6
	db $79			;Instrument 7
					;Wait Repeat 1
	db $45			;Note A-6
	db $79			;Instrument 7
					;Wait Repeat 1
	db $46			;Note A#6
	db $79			;Instrument 7
					;Wait Repeat 1
	db $47			;Note B-6
	db $79			;Instrument 7
	db $bf			;[End-Of-Track]
.track_127:
	db $c1			;Wait 2
	db $40			;Note E-6
	db $6e			;Volume 12
	db $79			;Instrument 7
	db $dd			;Wait 30
	db $40			;Note E-6
	db $c0			;Wait 1
	db $41			;Note F-6
					;Wait Repeat 1
	db $43			;Note G-6
					;Wait Repeat 1
	db $45			;Note A-6
	db $bf			;[End-Of-Track]
.track_128:
	db $9d,$00			;CMD Drum $01
	db $c5			;Wait 6
	db $18			;Note C-3
	db $72			;Instrument 0
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $18			;Note C-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 6
	db $26			;Note D-4
	db $77			;Instrument 5
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 6
	db $18			;Note C-3
	db $72			;Instrument 0
	db $9d,$02			;CMD Drum $02
	db $c2			;Wait 3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 3
	db $18			;Note C-3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 3
	db $9d,$02			;CMD Drum $02
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_134:
	db $48			;Note C-7
	db $79			;Instrument 7
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_135:
	db $c1			;Wait 2
	db $48			;Note C-7
	db $6e			;Volume 12
	db $79			;Instrument 7
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_136:
	db $1d			;Note F-3
	db $6e			;Volume 12
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c2			;Wait 3
	db $24			;Note C-4
	db $c2			;Wait 3
	db $21			;Note A-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $24			;Note C-4
	db $c2			;Wait 3
	db $21			;Note A-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $24			;Note C-4
	db $c2			;Wait 3
	db $1d			;Note F-3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 3
	db $24			;Note C-4
	db $c2			;Wait 3
	db $21			;Note A-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $24			;Note C-4
	db $c2			;Wait 3
	db $21			;Note A-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $24			;Note C-4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_137:
	db $11			;Note F-2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $18			;Note C-3
					;Wait Repeat 6
	db $18			;Note C-3
					;Wait Repeat 6
	db $11			;Note F-2
					;Wait Repeat 6
	db $18			;Note C-3
					;Wait Repeat 6
	db $18			;Note C-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_138:
	db $1d			;Note F-3
	db $7a			;Instrument 8
	db $cb			;Wait 12
	db $1d			;Note F-3
	db $c5			;Wait 6
	db $1d			;Note F-3
	db $cb			;Wait 12
	db $1d			;Note F-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_139:
	db $29			;Note F-4
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $29			;Note F-4
					;Wait Repeat 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $2d			;Note A-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_140:
	db $c2			;Wait 3
	db $30			;Note C-5
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $30			;Note C-5
					;Wait Repeat 6
	db $30			;Note C-5
					;Wait Repeat 6
	db $30			;Note C-5
					;Wait Repeat 6
	db $30			;Note C-5
					;Wait Repeat 6
	db $30			;Note C-5
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_142:
	db $41			;Note F-6
	db $78			;Instrument 6
	db $d1			;Wait 18
	db $41			;Note F-6
	db $c5			;Wait 6
	db $40			;Note E-6
					;Wait Repeat 6
	db $3c			;Note C-6
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_143:
	db $c1			;Wait 2
	db $41			;Note F-6
	db $6e			;Volume 12
	db $78			;Instrument 6
	db $d1			;Wait 18
	db $41			;Note F-6
	db $73			;Instrument 1
	db $c5			;Wait 6
	db $40			;Note E-6
					;Wait Repeat 6
	db $3c			;Note C-6
	db $c3			;Wait 4
	db $bf			;[End-Of-Track]
.track_144:
	db $1f			;Note G-3
	db $6e			;Volume 12
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c2			;Wait 3
	db $26			;Note D-4
	db $c2			;Wait 3
	db $23			;Note B-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $26			;Note D-4
	db $c2			;Wait 3
	db $23			;Note B-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $26			;Note D-4
	db $c2			;Wait 3
	db $1f			;Note G-3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 3
	db $26			;Note D-4
	db $c2			;Wait 3
	db $23			;Note B-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $26			;Note D-4
	db $c2			;Wait 3
	db $23			;Note B-3
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $26			;Note D-4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_145:
	db $13			;Note G-2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $13			;Note G-2
					;Wait Repeat 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $1a			;Note D-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_146:
	db $1f			;Note G-3
	db $7a			;Instrument 8
	db $d1			;Wait 18
	db $1f			;Note G-3
	db $c5			;Wait 6
	db $1a			;Note D-3
					;Wait Repeat 6
	db $17			;Note B-2
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_147:
	db $2b			;Note G-4
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $2f			;Note B-4
					;Wait Repeat 6
	db $2f			;Note B-4
					;Wait Repeat 6
	db $2b			;Note G-4
					;Wait Repeat 6
	db $2f			;Note B-4
					;Wait Repeat 6
	db $2f			;Note B-4
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_148:
	db $c2			;Wait 3
	db $32			;Note D-5
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $32			;Note D-5
					;Wait Repeat 6
	db $32			;Note D-5
					;Wait Repeat 6
	db $32			;Note D-5
					;Wait Repeat 6
	db $32			;Note D-5
					;Wait Repeat 6
	db $32			;Note D-5
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_150:
	db $3e			;Note D-6
	db $78			;Instrument 6
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_151:
	db $c1			;Wait 2
	db $3e			;Note D-6
	db $78			;Instrument 6
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_152:
	db $21			;Note A-3
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c2			;Wait 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $21			;Note A-3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_153:
	db $15			;Note A-2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $1c			;Note E-3
					;Wait Repeat 6
	db $1c			;Note E-3
					;Wait Repeat 6
	db $15			;Note A-2
					;Wait Repeat 6
	db $1c			;Note E-3
					;Wait Repeat 6
	db $1c			;Note E-3
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_154:
	db $15			;Note A-2
	db $7a			;Instrument 8
	db $cb			;Wait 12
	db $15			;Note A-2
	db $c5			;Wait 6
	db $21			;Note A-3
	db $d1			;Wait 18
	db $bf			;[End-Of-Track]
.track_155:
	db $2d			;Note A-4
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $31			;Note C#5
					;Wait Repeat 6
	db $31			;Note C#5
					;Wait Repeat 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $31			;Note C#5
					;Wait Repeat 6
	db $31			;Note C#5
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]
.track_156:
	db $c2			;Wait 3
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_158:
	db $40			;Note E-6
	db $78			;Instrument 6
	db $e3			;Wait 36
	db $bf			;[End-Of-Track]
.track_159:
	db $c1			;Wait 2
	db $40			;Note E-6
	db $e1			;Wait 34
	db $bf			;[End-Of-Track]
.track_160:
	db $21			;Note A-3
	db $72			;Instrument 0
	db $9d,$00			;CMD Drum $01
	db $c2			;Wait 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $21			;Note A-3
	db $9d,$02			;CMD Drum $02
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $28			;Note E-4
	db $c2			;Wait 3
	db $25			;Note C#4
	db $9d,$04			;CMD Drum $03
					;Wait Repeat 3
	db $60			;Release 96
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_161:
	db $15			;Note A-2
	db $72			;Instrument 0
	db $c5			;Wait 6
	db $1c			;Note E-3
					;Wait Repeat 6
	db $1c			;Note E-3
					;Wait Repeat 6
	db $15			;Note A-2
					;Wait Repeat 6
	db $1c			;Note E-3
					;Wait Repeat 6
	db $1c			;Note E-3
	db $c2			;Wait 3
	db $60			;Release 96
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_162:
	db $15			;Note A-2
	db $7a			;Instrument 8
	db $d1			;Wait 18
	db $15			;Note A-2
	db $ce			;Wait 15
	db $60			;Release 96
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_163:
	db $2d			;Note A-4
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $31			;Note C#5
					;Wait Repeat 6
	db $31			;Note C#5
					;Wait Repeat 6
	db $2d			;Note A-4
					;Wait Repeat 6
	db $31			;Note C#5
					;Wait Repeat 6
	db $31			;Note C#5
	db $c2			;Wait 3
	db $60			;Release 96
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_164:
	db $c2			;Wait 3
	db $34			;Note E-5
	db $78			;Instrument 6
	db $c5			;Wait 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $34			;Note E-5
					;Wait Repeat 6
	db $60			;Release 96
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_165:
	db $31			;Note C#5
	db $78			;Instrument 6
	db $a2,$01			;CMD Track detune
	db $c2			;Wait 3
	db $34			;Note E-5
					;Wait Repeat 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $34			;Note E-5
					;Wait Repeat 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $34			;Note E-5
					;Wait Repeat 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $34			;Note E-5
					;Wait Repeat 3
	db $31			;Note C#5
					;Wait Repeat 3
	db $34			;Note E-5
					;Wait Repeat 3
	db $31			;Note C#5
	db $c2			;Wait 3
	db $95,$30			;CMD Vibrato
	db $c2			;Wait 3
	db $bf			;[End-Of-Track]
.track_166:
	db $49			;Note C#7
	db $74			;Instrument 2
	db $a2,$01			;CMD Track detune
	db $c2			;Wait 3
	db $4c			;Note E-7
					;Wait Repeat 3
	db $49			;Note C#7
					;Wait Repeat 3
	db $4c			;Note E-7
					;Wait Repeat 3
	db $49			;Note C#7
					;Wait Repeat 3
	db $4c			;Note E-7
					;Wait Repeat 3
	db $49			;Note C#7
					;Wait Repeat 3
	db $4c			;Note E-7
					;Wait Repeat 3
	db $49			;Note C#7
					;Wait Repeat 3
	db $4c			;Note E-7
					;Wait Repeat 3
	db $49			;Note C#7
	db $c5			;Wait 6
	db $bf			;[End-Of-Track]

