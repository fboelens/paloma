	; --- magician right 1
	DB $30,$7C,$42,$7F,$40,$3F,$23,$3F
	DB $3F,$18,$0F,$1F,$3F,$7F,$7F,$3F
	DB $00,$00,$00,$C0,$3F,$FE,$84,$F8
	DB $E2,$27,$EE,$FC,$F8,$F0,$F0,$E0
	DB $00,$4C,$7E,$41,$7F,$20,$3F,$3E
	DB $3C,$1F,$00,$16,$20,$44,$44,$00
	DB $00,$00,$00,$C0,$FF,$02,$FC,$78
	DB $A2,$E5,$00,$7C,$38,$10,$D0,$00
	
	; --- magician right 2
	DB $70,$FC,$82,$7F,$40,$3F,$23,$3F
	DB $3F,$1F,$0F,$1F,$3F,$7F,$7F,$3F
	DB $00,$00,$00,$C0,$3F,$FE,$84,$F8
	DB $E0,$E2,$E7,$FE,$F8,$F0,$F0,$E0
	DB $00,$8C,$FE,$41,$7F,$20,$3F,$3F
	DB $3C,$18,$0F,$16,$20,$42,$46,$00
	DB $00,$00,$00,$C0,$FF,$02,$FC,$78
	DB $A0,$22,$E5,$7E,$38,$10,$50,$00
	
	; --- magician right 3
	DB $30,$7C,$82,$FF,$40,$3F,$23,$3F
	DB $3F,$1F,$0F,$1F,$3F,$7F,$7F,$3F
	DB $00,$00,$00,$C0,$3F,$FE,$84,$F8
	DB $E0,$E4,$EE,$FC,$F8,$F0,$F0,$E0
	DB $00,$4C,$FE,$81,$7F,$20,$3F,$3F
	DB $3C,$18,$0F,$16,$20,$40,$41,$00
	DB $00,$00,$00,$C0,$FF,$02,$FC,$78
	DB $A0,$24,$EA,$7C,$38,$50,$30,$00
	
	; --- magician left 1
	DB $00,$00,$00,$03,$FC,$7F,$21,$1F
	DB $47,$E4,$77,$3F,$1F,$0F,$0F,$07
	DB $0C,$3E,$42,$FE,$02,$FC,$C4,$FC
	DB $FC,$18,$F0,$F8,$FC,$FE,$FE,$FC
	DB $00,$00,$00,$03,$FF,$40,$3F,$1E
	DB $45,$A7,$00,$3E,$1C,$08,$0B,$00
	DB $00,$32,$7E,$82,$FE,$04,$FC,$7C
	DB $3C,$F8,$00,$68,$04,$22,$22,$00
	
	; --- magician left 2
	DB $00,$00,$00,$03,$FC,$7F,$21,$1F
	DB $07,$47,$E7,$7F,$1F,$0F,$0E,$07
	DB $0E,$3F,$41,$FE,$02,$FC,$C4,$FC
	DB $FC,$F8,$F0,$F8,$FC,$FE,$EE,$FC
	DB $00,$00,$00,$03,$FF,$40,$3F,$1E
	DB $05,$44,$A7,$7E,$1C,$08,$0B,$00
	DB $00,$31,$7F,$82,$FE,$04,$FC,$FC
	DB $3C,$18,$F0,$68,$04,$42,$72,$00
	
	; --- magician left 3
	DB $00,$00,$00,$03,$FC,$7F,$21,$1F
	DB $07,$27,$77,$3F,$1F,$0F,$0F,$07
	DB $0C,$3E,$41,$FF,$02,$FC,$C4,$FC
	DB $FC,$F8,$F0,$F8,$FC,$FE,$FE,$FC
	DB $00,$00,$00,$03,$FF,$40,$3F,$1E
	DB $05,$24,$57,$3E,$1C,$0A,$0C,$00
	DB $00,$32,$7F,$81,$FE,$04,$FC,$FC
	DB $3C,$18,$F0,$68,$04,$02,$82,$00
	
	; --- block 1
	DB $00,$73,$8C,$B3,$BF,$5F,$4E,$BF
	DB $BF,$BF,$5F,$5F,$BF,$B3,$8C,$73
	DB $00,$9C,$62,$9A,$FA,$F4,$F4,$FA
	DB $FA,$FA,$F4,$F4,$FA,$9A,$62,$9C
	DB $00,$00,$FF,$CC,$C0,$7E,$7B,$C6
	DB $C0,$C0,$67,$6F,$C0,$CC,$FF,$00
	DB $00,$00,$FE,$66,$06,$FC,$BC,$66
	DB $06,$06,$EC,$8C,$06,$66,$FE,$00
	
	; --- block 2
	DB $00,$79,$86,$B9,$5F,$5F,$8E,$BF
	DB $BF,$5F,$5F,$BF,$BF,$A7,$98,$67
	DB $00,$CC,$32,$CA,$FA,$FA,$F4,$F4
	DB $FA,$FA,$FA,$F4,$F4,$3A,$C2,$3C
	DB $00,$00,$FF,$C6,$60,$7E,$FB,$C6
	DB $C0,$60,$67,$CF,$C0,$D8,$FF,$00
	DB $00,$00,$FE,$36,$06,$F6,$BC,$6C
	DB $06,$06,$86,$EC,$0C,$C6,$FE,$00
	
	; --- bullet 3
	DB $00,$7D,$83,$5C,$5F,$9E,$8E,$BF
	DB $5F,$5F,$BF,$BF,$BF,$8E,$B1,$4E
	DB $00,$E4,$1A,$E2,$FA,$F2,$F2,$F4
	DB $F4,$FA,$FA,$FA,$F4,$74,$82,$7C
	DB $00,$00,$FF,$63,$60,$FF,$FB,$C6
	DB $60,$60,$C7,$CF,$C0,$F1,$FF,$00
	DB $00,$00,$FE,$1E,$06,$FE,$BE,$6C
	DB $0C,$06,$86,$C6,$0C,$8C,$FE,$00
	
	; --- bullet 4
	DB $00,$00,$00,$00,$01,$03,$07,$0F
	DB $0F,$0F,$07,$03,$01,$00,$00,$00
	DB $00,$00,$00,$00,$C0,$E0,$F0,$F8
	DB $F8,$F8,$F0,$E0,$C0,$00,$00,$00
	DB $00,$00,$00,$00,$00,$02,$04,$08
	DB $08,$08,$04,$02,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$20,$10,$08
	DB $08,$08,$10,$20,$00,$00,$00,$00
	
	; --- bullet 5
	DB $00,$00,$00,$00,$01,$03,$07,$07
	DB $07,$03,$01,$00,$00,$00,$00,$00
	DB $00,$00,$00,$E0,$F0,$F8,$FC,$FC
	DB $FC,$F8,$F0,$E0,$00,$00,$00,$00
	DB $00,$00,$00,$00,$01,$02,$04,$04
	DB $04,$02,$01,$00,$00,$00,$00,$00
	DB $00,$00,$00,$00,$10,$08,$04,$04
	DB $04,$08,$10,$00,$00,$00,$00,$00
	
	; --- bullet 6
	DB $00,$00,$00,$00,$00,$00,$01,$03
	DB $07,$07,$07,$03,$01,$00,$00,$00
	DB $00,$00,$00,$00,$00,$E0,$F0,$F8
	DB $FC,$FC,$FC,$F8,$F0,$E0,$00,$00
	DB $00,$00,$00,$00,$00,$00,$01,$02
	DB $04,$04,$04,$02,$01,$00,$00,$00
	DB $00,$00,$00,$00,$00,$00,$10,$08
	DB $04,$04,$04,$08,$10,$00,$00,$00
	
	; --- princess right 1
	DB $03,$04,$08,$10,$11,$13,$37,$23
	DB $27,$2B,$36,$24,$08,$10,$21,$73
	DB $F0,$08,$04,$04,$C8,$F0,$F0,$F0
	DB $E0,$C0,$20,$A0,$50,$10,$08,$9C
	DB $00,$07,$0F,$1F,$1F,$1E,$3C,$3E
	DB $3E,$3B,$37,$27,$0F,$1F,$3F,$7F
	DB $00,$F8,$FC,$FC,$F8,$30,$50,$50
	DB $20,$C0,$E0,$60,$B0,$F0,$F8,$FC
	
	; --- princess right 2
	DB $03,$04,$08,$10,$11,$13,$37,$23
	DB $27,$2B,$36,$04,$09,$10,$22,$73
	DB $F0,$08,$08,$04,$C4,$F8,$F0,$F0
	DB $E0,$C0,$20,$A0,$10,$10,$08,$3C
	DB $00,$07,$0F,$1F,$1F,$1E,$3C,$3E
	DB $3E,$3B,$37,$07,$0E,$1F,$3F,$7F
	DB $00,$F8,$F8,$FC,$FC,$38,$50,$50
	DB $20,$C0,$E0,$60,$F0,$F0,$F8,$FC
	
	; --- princess right 3
	DB $03,$04,$08,$10,$11,$13,$37,$23
	DB $67,$4B,$36,$05,$0A,$10,$24,$66
	DB $E0,$10,$08,$0C,$C4,$F8,$F0,$F0
	DB $E0,$C0,$20,$20,$10,$10,$08,$3C
	DB $00,$07,$0F,$1F,$1F,$1E,$3C,$3E
	DB $7E,$7B,$37,$06,$0D,$1F,$3F,$7F
	DB $00,$F0,$F8,$FC,$FC,$38,$10,$50
	DB $20,$C0,$E0,$E0,$F0,$F0,$F8,$FC
	
	; --- princess left 1
	DB $0F,$10,$20,$20,$13,$0F,$0F,$0F
	DB $07,$03,$04,$05,$0A,$08,$10,$39
	DB $C0,$20,$10,$08,$88,$C8,$EC,$C4
	DB $E4,$D4,$6C,$24,$10,$08,$84,$CE
	DB $00,$1F,$3F,$3F,$1F,$0C,$0A,$0A
	DB $04,$03,$07,$06,$0D,$0F,$1F,$3F
	DB $00,$E0,$F0,$F8,$F8,$78,$3C,$7C
	DB $7C,$DC,$EC,$E4,$F0,$F8,$FC,$FE
	
	; --- princess left 2
	DB $0F,$10,$10,$20,$23,$1F,$0F,$0F
	DB $07,$03,$04,$05,$08,$08,$10,$3C
	DB $C0,$20,$10,$08,$88,$C8,$EC,$C4
	DB $E4,$D4,$6C,$20,$90,$08,$04,$CE
	DB $00,$1F,$1F,$3F,$3F,$1C,$0A,$0A
	DB $04,$03,$07,$06,$0F,$0F,$1F,$3F
	DB $00,$E0,$F0,$F8,$F8,$78,$3C,$7C
	DB $7C,$DC,$EC,$E0,$70,$F8,$FC,$FE
	
	; --- princess left 3
	DB $07,$08,$10,$30,$23,$1F,$0F,$0F
	DB $07,$03,$04,$04,$09,$08,$10,$3C
	DB $C0,$20,$10,$08,$88,$C8,$EC,$C4
	DB $E6,$D2,$6C,$A0,$10,$08,$04,$66
	DB $00,$0F,$1F,$3F,$3F,$1C,$08,$0A
	DB $04,$03,$07,$07,$0E,$0F,$1F,$3F
	DB $00,$E0,$F0,$F8,$F8,$78,$3C,$7C
	DB $7E,$DE,$EC,$60,$F0,$F8,$FC,$FE
	
	; --- monster 4 right 1
	DB $00,$00,$00,$0F,$13,$27,$2F,$27
	DB $13,$0D,$0E,$09,$16,$2D,$1F,$0F
	DB $00,$00,$00,$E0,$D0,$F0,$E0,$E0
	DB $F0,$53,$16,$FC,$28,$E8,$B0,$D0
	DB $00,$00,$00,$00,$1C,$38,$31,$39
	DB $1C,$0E,$09,$0E,$19,$36,$1D,$09
	DB $00,$00,$00,$00,$30,$10,$A0,$A0
	DB $10,$B3,$F6,$1C,$F8,$38,$F0,$B0
	
	; --- monster 4 right 2
	DB $00,$00,$0F,$13,$27,$2F,$27,$13
	DB $0D,$0E,$09,$16,$2D,$1F,$03,$03
	DB $00,$00,$E0,$D0,$F0,$E0,$E0,$F0
	DB $50,$17,$FE,$28,$E8,$F0,$80,$C0
	DB $00,$00,$00,$1C,$38,$31,$39,$1C
	DB $0E,$09,$0E,$19,$36,$1C,$02,$02
	DB $00,$00,$00,$30,$10,$A0,$A0,$10
	DB $B0,$F7,$1E,$F8,$38,$F0,$80,$40
	
	; --- monster 4 right 3
	DB $00,$00,$00,$0F,$13,$27,$2F,$27
	DB $13,$0D,$0E,$09,$16,$2D,$1D,$0B
	DB $00,$00,$00,$E0,$D0,$F0,$E0,$E0
	DB $F0,$50,$10,$FE,$2F,$E8,$F0,$F0
	DB $00,$00,$00,$00,$1C,$38,$31,$39
	DB $1C,$0E,$09,$0E,$19,$36,$1F,$0D
	DB $00,$00,$00,$00,$30,$10,$A0,$A0
	DB $10,$B0,$F0,$1E,$FF,$38,$B0,$90
	
	; --- monster 4 left 1
	DB $00,$00,$00,$07,$0B,$0F,$07,$07
	DB $0F,$CA,$68,$3F,$14,$17,$0D,$0B
	DB $00,$00,$00,$F0,$C8,$E4,$F4,$E4
	DB $C8,$B0,$70,$90,$68,$B4,$F8,$F0
	DB $00,$00,$00,$00,$0C,$08,$05,$05
	DB $08,$CD,$6F,$38,$1F,$1C,$0F,$0D
	DB $00,$00,$00,$00,$38,$1C,$8C,$9C
	DB $38,$70,$90,$70,$98,$6C,$B8,$90
	
	; --- monster 4 left 2
	DB $00,$00,$07,$0B,$0F,$07,$07,$0F
	DB $0A,$E8,$7F,$14,$17,$0F,$01,$03
	DB $00,$00,$F0,$C8,$E4,$F4,$E4,$C8
	DB $B0,$70,$90,$68,$B4,$F8,$C0,$C0
	DB $00,$00,$00,$0C,$08,$05,$05,$08
	DB $0D,$EF,$78,$1F,$1C,$0F,$01,$02
	DB $00,$00,$00,$38,$1C,$8C,$9C,$38
	DB $70,$90,$70,$98,$6C,$38,$40,$40
	
	; --- monster 4 left 3
	DB $00,$00,$00,$07,$0B,$0F,$07,$07
	DB $0F,$0A,$08,$6F,$F4,$17,$0F,$0F
	DB $00,$00,$00,$F0,$C8,$E4,$F4,$E4
	DB $C8,$B0,$70,$90,$68,$B4,$B8,$D0
	DB $00,$00,$00,$00,$0C,$08,$05,$05
	DB $08,$0D,$0F,$68,$FF,$1C,$0D,$09
	DB $00,$00,$00,$00,$38,$1C,$8C,$9C
	DB $38,$70,$90,$70,$98,$6C,$F8,$B0
	
	; --- monster 5 right 1
	DB $00,$00,$03,$0F,$10,$26,$2C,$20
	DB $1F,$07,$07,$07,$07,$0F,$03,$06
	DB $00,$00,$C0,$30,$18,$0C,$64,$E4
	DB $F8,$E0,$E8,$F0,$E0,$E0,$C0,$E0
	DB $00,$00,$00,$0C,$1F,$39,$33,$3F
	DB $00,$04,$04,$04,$04,$0C,$00,$00
	DB $00,$00,$00,$F0,$E8,$F4,$9C,$1C
	DB $00,$A0,$A8,$30,$E0,$20,$00,$00
	
	; --- monster 5 right 2
	DB $00,$00,$00,$03,$0F,$10,$26,$2C
	DB $20,$1F,$07,$07,$07,$07,$07,$03
	DB $00,$00,$00,$C0,$30,$18,$0C,$64
	DB $E4,$F8,$E0,$E0,$E0,$E0,$E0,$C0
	DB $00,$00,$00,$00,$0C,$1F,$39,$33
	DB $3F,$00,$04,$04,$04,$05,$05,$00
	DB $00,$00,$00,$00,$F0,$E8,$F4,$9C
	DB $1C,$00,$A0,$A0,$20,$60,$20,$00
	
	; --- monster 5 right 3
	DB $00,$00,$03,$0F,$10,$26,$2C,$20
	DB $1F,$07,$07,$0F,$17,$07,$00,$01
	DB $00,$00,$C0,$30,$18,$0C,$64,$E4
	DB $F8,$E0,$E0,$F0,$E0,$E0,$80,$00
	DB $00,$00,$00,$0C,$1F,$39,$33,$3F
	DB $00,$04,$04,$0C,$14,$04,$03,$07
	DB $00,$00,$00,$F0,$E8,$F4,$9C,$1C
	DB $00,$A0,$A0,$30,$60,$20,$C0,$60
	
	; --- monster 5 left 1
	DB $00,$00,$03,$0C,$18,$30,$26,$27
	DB $1F,$07,$17,$0F,$07,$07,$03,$07
	DB $00,$00,$C0,$F0,$08,$64,$34,$04
	DB $F8,$E0,$E0,$E0,$E0,$F0,$C0,$60
	DB $00,$00,$00,$0F,$17,$2F,$39,$38
	DB $00,$05,$15,$0C,$07,$04,$00,$00
	DB $00,$00,$00,$30,$F8,$9C,$CC,$FC
	DB $00,$20,$20,$20,$20,$30,$00,$00
	
	; --- monster 5 left 2
	DB $00,$00,$00,$03,$0C,$18,$30,$26
	DB $27,$1F,$07,$07,$07,$07,$07,$03
	DB $00,$00,$00,$C0,$F0,$08,$64,$34
	DB $04,$F8,$E0,$E0,$E0,$E0,$E0,$C0
	DB $00,$00,$00,$00,$0F,$17,$2F,$39
	DB $38,$00,$05,$05,$04,$06,$04,$00
	DB $00,$00,$00,$00,$30,$F8,$9C,$CC
	DB $FC,$00,$20,$20,$20,$A0,$A0,$00
	
	; --- monster 5 left 3
	DB $00,$00,$03,$0C,$18,$30,$26,$27
	DB $1F,$07,$07,$0F,$07,$07,$01,$00
	DB $00,$00,$C0,$F0,$08,$64,$34,$04
	DB $F8,$E0,$E0,$F0,$E8,$E0,$00,$80
	DB $00,$00,$00,$0F,$17,$2F,$39,$38
	DB $00,$05,$05,$0C,$06,$04,$03,$06
	DB $00,$00,$00,$30,$F8,$9C,$CC,$FC
	DB $00,$20,$20,$30,$28,$20,$C0,$E0
	
	; --- bat right 1
	DB $00,$00,$00,$00,$01,$03,$07,$0E
	DB $1E,$3F,$43,$BE,$9C,$E0,$00,$00
	DB $00,$00,$00,$00,$C0,$E0,$F0,$50
	DB $F0,$5C,$F2,$17,$09,$07,$00,$00
	DB $00,$00,$00,$00,$00,$02,$04,$09
	DB $19,$25,$7F,$C2,$FC,$00,$00,$00
	DB $00,$00,$00,$00,$00,$20,$10,$B0
	DB $B0,$FC,$5E,$19,$0F,$00,$00,$00
	
	; --- bat right 2
	DB $00,$00,$00,$00,$3E,$5F,$BF,$FF
	DB $FE,$F7,$63,$01,$00,$00,$00,$00
	DB $00,$00,$00,$00,$EC,$FA,$FD,$5F
	DB $5F,$FF,$56,$F0,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$61,$C2,$84
	DB $89,$94,$63,$01,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$16,$0B,$A9
	DB $A1,$A9,$F6,$50,$00,$00,$00,$00
	
	; --- bat right 3
	DB $00,$1C,$2E,$7F,$80,$FF,$FF,$0F
	DB $07,$03,$01,$00,$00,$00,$00,$00
	DB $00,$18,$24,$FE,$A1,$FF,$AF,$28
	DB $F8,$A8,$F8,$00,$00,$00,$00,$00
	DB $00,$00,$32,$41,$FF,$81,$F2,$0C
	DB $04,$02,$01,$00,$00,$00,$00,$00
	DB $00,$00,$3C,$C2,$FF,$11,$5F,$D8
	DB $58,$F8,$A8,$00,$00,$00,$00,$00
	
	; --- bat left 1
	DB $00,$00,$00,$00,$03,$07,$0F,$0A
	DB $0F,$3A,$4F,$E8,$90,$E0,$00,$00
	DB $00,$00,$00,$00,$80,$C0,$E0,$70
	DB $78,$FC,$C2,$7D,$39,$07,$00,$00
	DB $00,$00,$00,$00,$00,$04,$08,$0D
	DB $0D,$3F,$7A,$98,$F0,$00,$00,$00
	DB $00,$00,$00,$00,$00,$40,$20,$90
	DB $98,$A4,$FE,$43,$3F,$00,$00,$00
	
	; --- bat left 2
	DB $00,$00,$00,$00,$37,$5F,$BF,$FA
	DB $FA,$FF,$6A,$0F,$00,$00,$00,$00
	DB $00,$00,$00,$00,$7C,$FA,$FD,$FF
	DB $7F,$EF,$C6,$80,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$68,$D0,$95
	DB $85,$95,$6F,$0A,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$86,$43,$21
	DB $91,$29,$C6,$80,$00,$00,$00,$00
	
	; --- bat left 3
	DB $00,$18,$24,$7F,$85,$FF,$F5,$14
	DB $1F,$15,$1F,$00,$00,$00,$00,$00
	DB $00,$38,$74,$FE,$01,$FF,$FF,$F0
	DB $E0,$C0,$80,$00,$00,$00,$00,$00
	DB $00,$00,$3C,$43,$FF,$88,$FA,$1B
	DB $1A,$1F,$15,$00,$00,$00,$00,$00
	DB $00,$00,$4C,$82,$FF,$81,$4F,$30
	DB $20,$40,$80,$00,$00,$00,$00,$00
	
	; --- frog right 1
	DB $00,$00,$00,$00,$00,$00,$01,$03
	DB $02,$07,$0A,$1D,$38,$24,$33,$7F
	DB $00,$00,$00,$00,$00,$00,$D8,$3C
	DB $FC,$DE,$81,$FF,$9A,$1C,$FE,$FF
	DB $00,$00,$00,$00,$00,$00,$00,$02
	DB $03,$06,$0F,$12,$27,$3F,$3E,$00
	DB $00,$00,$00,$00,$00,$00,$00,$E4
	DB $24,$6A,$7F,$7F,$E6,$FC,$26,$00
	
	; --- frog right 2
	DB $00,$00,$00,$01,$03,$02,$07,$0A
	DB $1D,$38,$24,$13,$26,$7F,$F3,$00
	DB $00,$00,$00,$D8,$2C,$FC,$DE,$81
	DB $FF,$32,$1E,$AA,$44,$80,$00,$00
	DB $00,$00,$00,$00,$02,$03,$06,$0F
	DB $12,$27,$3F,$1F,$3F,$4C,$00,$00
	DB $00,$00,$00,$00,$F4,$24,$6A,$7F
	DB $7F,$CE,$FE,$EE,$C4,$80,$00,$00
	
	; --- frog right 3
	DB $00,$00,$00,$00,$01,$73,$4A,$27
	DB $3E,$6E,$21,$1F,$00,$00,$00,$00
	DB $00,$00,$00,$00,$D8,$AC,$FC,$DE
	DB $41,$FF,$9A,$96,$DB,$7A,$00,$00
	DB $00,$00,$00,$00,$00,$72,$7B,$3E
	DB $3B,$5D,$3E,$1F,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$74,$24,$6A
	DB $BF,$7F,$66,$FE,$ED,$00,$00,$00
	
	; --- frog left 1
	DB $00,$00,$00,$00,$00,$00,$1B,$3C
	DB $3F,$7B,$81,$FF,$59,$38,$7F,$FF
	DB $00,$00,$00,$00,$00,$00,$80,$C0
	DB $40,$E0,$50,$B8,$1C,$24,$CC,$FE
	DB $00,$00,$00,$00,$00,$00,$00,$27
	DB $24,$56,$FE,$FE,$67,$3F,$64,$00
	DB $00,$00,$00,$00,$00,$00,$00,$40
	DB $C0,$60,$F0,$48,$E4,$FC,$7C,$00
	
	; --- frog left 2
	DB $00,$00,$00,$1B,$34,$3F,$7B,$81
	DB $FF,$4C,$78,$55,$22,$01,$00,$00
	DB $00,$00,$00,$80,$C0,$40,$E0,$50
	DB $B8,$1C,$24,$C8,$64,$FE,$CF,$00
	DB $00,$00,$00,$00,$2F,$24,$56,$FE
	DB $FE,$73,$7F,$77,$23,$01,$00,$00
	DB $00,$00,$00,$00,$40,$C0,$60,$F0
	DB $48,$E4,$FC,$F8,$FC,$32,$00,$00
	
	; --- frog left 3
	DB $00,$00,$00,$00,$1B,$35,$3F,$7B
	DB $82,$FF,$59,$69,$DB,$5E,$00,$00
	DB $00,$00,$00,$00,$80,$CE,$52,$E4
	DB $7C,$76,$84,$F8,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$2E,$24,$56
	DB $FD,$FE,$66,$7F,$B7,$00,$00,$00
	DB $00,$00,$00,$00,$00,$4E,$DE,$7C
	DB $DC,$BA,$7C,$F8,$00,$00,$00,$00

	; --- magician right 1
	DB $0F,$08,$0D,$08,$0D,$08,$0D,$0B
	DB $0B,$0C,$0F,$0A,$0A,$0A,$0A,$0F
	DB $00,$47,$42,$47,$42,$47,$42,$44
	DB $44,$4B,$00,$45,$45,$45,$45,$00
	; 
	
	; --- magician right 2
	DB $0F,$08,$0D,$08,$0D,$08,$0D,$0B
	DB $0B,$0B,$0C,$0A,$0A,$0A,$0A,$0F
	DB $00,$47,$42,$47,$42,$47,$42,$44
	DB $44,$44,$43,$45,$45,$45,$45,$00
	; 
	
	; --- magician right 3
	DB $0F,$08,$0D,$08,$0D,$08,$0D,$0B
	DB $0B,$0B,$0C,$0A,$0A,$0A,$0A,$0F
	DB $00,$47,$42,$47,$42,$47,$42,$44
	DB $44,$44,$43,$45,$45,$45,$45,$00
	; 
	
	; --- magician left 1
	DB $0F,$08,$0D,$08,$0D,$08,$0D,$0B
	DB $0B,$0C,$0F,$0A,$0A,$0A,$0A,$0F
	DB $00,$47,$42,$47,$42,$47,$42,$44
	DB $44,$4B,$00,$45,$45,$45,$45,$00
	; 
	
	; --- magician left 2
	DB $0F,$08,$0D,$08,$0D,$08,$0D,$0B
	DB $0B,$0B,$0C,$0A,$0A,$0A,$0A,$0F
	DB $00,$47,$42,$47,$42,$47,$42,$44
	DB $44,$44,$43,$45,$45,$45,$45,$00
	; 
	
	; --- magician left 3
	DB $0F,$08,$0D,$08,$0D,$08,$0D,$0B
	DB $0B,$0B,$0C,$0A,$0A,$0A,$0A,$0F
	DB $00,$47,$42,$47,$42,$47,$42,$44
	DB $44,$44,$43,$45,$45,$45,$45,$00
	; 
	
	; --- block 1
	DB $00,$0F,$08,$09,$09,$09,$0D,$09
	DB $09,$09,$09,$09,$09,$09,$08,$0F
	DB $00,$00,$47,$47,$47,$47,$47,$47
	DB $47,$47,$47,$47,$47,$47,$47,$00
	; 
	
	; --- block 2
	DB $00,$0F,$08,$09,$09,$09,$0D,$09
	DB $09,$09,$09,$09,$09,$09,$08,$0F
	DB $00,$00,$47,$47,$47,$47,$47,$47
	DB $47,$47,$47,$47,$47,$47,$47,$00
	; 
	
	; --- bullet 3
	DB $00,$0F,$08,$09,$09,$08,$0D,$09
	DB $09,$09,$09,$09,$09,$09,$08,$0F
	DB $00,$00,$47,$47,$47,$47,$47,$47
	DB $47,$47,$47,$47,$47,$47,$47,$00
	; 
	
	; --- bullet 4
	DB $00,$00,$00,$00,$0F,$0A,$09,$0C
	DB $0D,$0C,$09,$0A,$0F,$00,$00,$00
	DB $00,$00,$00,$00,$00,$45,$46,$43
	DB $42,$43,$46,$45,$00,$00,$00,$00
	; 
	
	; --- bullet 5
	DB $00,$00,$00,$0F,$0A,$09,$0C,$0D
	DB $0C,$09,$0A,$0F,$00,$00,$00,$00
	DB $00,$00,$00,$00,$45,$46,$43,$42
	DB $43,$46,$45,$00,$00,$00,$00,$00
	; 
	
	; --- bullet 6
	DB $00,$00,$00,$00,$00,$0F,$0A,$09
	DB $0C,$0D,$0C,$09,$0A,$0F,$00,$00
	DB $00,$00,$00,$00,$00,$00,$45,$46
	DB $43,$42,$43,$46,$45,$00,$00,$00
	; 
	
	; --- princess right 1
	DB $0F,$0C,$0B,$0C,$0B,$0B,$0B,$0B
	DB $0B,$0C,$0A,$0B,$0B,$08,$0A,$0C
	DB $00,$43,$44,$43,$44,$44,$44,$44
	DB $44,$43,$45,$47,$47,$47,$45,$43
	; 
	
	; --- princess right 2
	DB $0F,$0C,$0B,$0C,$0B,$0B,$0B,$0B
	DB $0B,$0C,$0A,$0B,$0B,$08,$0A,$0C
	DB $00,$43,$44,$43,$44,$44,$44,$44
	DB $44,$43,$45,$47,$47,$47,$45,$43
	; 
	
	; --- princess right 3
	DB $0F,$0C,$0B,$0C,$0B,$0B,$0B,$0B
	DB $0B,$0C,$0A,$0B,$0B,$08,$0A,$0C
	DB $00,$43,$44,$43,$44,$44,$44,$44
	DB $44,$43,$45,$47,$47,$47,$45,$43
	; 
	
	; --- princess left 1
	DB $0F,$0C,$0B,$0C,$0B,$0B,$0B,$0B
	DB $0B,$0C,$0A,$0B,$0B,$08,$0A,$0C
	DB $00,$43,$44,$43,$44,$44,$44,$44
	DB $44,$43,$45,$47,$47,$47,$45,$43
	; 
	
	; --- princess left 2
	DB $0F,$0C,$0B,$0C,$0B,$0B,$0B,$0B
	DB $0B,$0C,$0A,$0B,$0B,$08,$0A,$0C
	DB $00,$43,$44,$43,$44,$44,$44,$44
	DB $44,$43,$45,$47,$47,$47,$45,$43
	; 
	
	; --- princess left 3
	DB $0F,$0C,$0B,$0C,$0B,$0B,$0B,$0B
	DB $0B,$0C,$0A,$0B,$0B,$08,$0A,$0C
	DB $00,$43,$44,$43,$44,$44,$44,$44
	DB $44,$43,$45,$47,$47,$47,$45,$43
	; 
	
	; --- monster 4 right 1
	DB $00,$00,$00,$0F,$0D,$0D,$0D,$0D
	DB $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
	DB $00,$00,$00,$00,$47,$47,$43,$43
	DB $43,$43,$43,$43,$43,$47,$43,$43
	; 
	
	; --- monster 4 right 2
	DB $00,$00,$0F,$0D,$0D,$0D,$0D,$0D
	DB $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
	DB $00,$00,$00,$47,$47,$43,$43,$43
	DB $43,$43,$43,$43,$47,$42,$42,$42
	; 
	
	; --- monster 4 right 3
	DB $00,$00,$00,$0F,$0D,$0D,$0D,$0D
	DB $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
	DB $00,$00,$00,$00,$47,$47,$43,$43
	DB $43,$43,$43,$43,$43,$47,$43,$43
	; 
	
	; --- monster 4 left 1
	DB $00,$00,$00,$0F,$0D,$0D,$0D,$0D
	DB $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
	DB $00,$00,$00,$00,$47,$47,$43,$43
	DB $43,$43,$43,$43,$43,$47,$43,$43
	; 
	
	; --- monster 4 left 2
	DB $00,$00,$0F,$0D,$0D,$0D,$0D,$0D
	DB $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
	DB $00,$00,$00,$47,$47,$43,$43,$43
	DB $43,$43,$43,$43,$47,$42,$42,$42
	; 
	
	; --- monster 4 left 3
	DB $00,$00,$00,$0F,$0D,$0D,$0D,$0D
	DB $0D,$0D,$0D,$0D,$0D,$0D,$0D,$0D
	DB $00,$00,$00,$00,$47,$47,$43,$43
	DB $43,$43,$43,$43,$43,$47,$43,$43
	; 
	
	; --- monster 5 right 1
	DB $00,$00,$0F,$0D,$0D,$0D,$0D,$0D
	DB $0F,$09,$0B,$0B,$09,$0B,$0F,$0F
	DB $00,$00,$00,$4A,$4A,$4A,$4A,$4A
	DB $00,$46,$44,$44,$46,$44,$00,$00
	; 
	
	; --- monster 5 right 2
	DB $00,$00,$00,$0F,$0D,$0D,$0D,$0D
	DB $0D,$0F,$09,$0B,$0B,$09,$0B,$0F
	DB $00,$00,$00,$00,$4A,$4A,$4A,$4A
	DB $4A,$00,$46,$44,$44,$46,$44,$00
	; 
	
	; --- monster 5 right 3
	DB $00,$00,$0F,$0D,$0D,$0D,$0D,$0D
	DB $0F,$09,$0B,$0B,$09,$0B,$0F,$0F
	DB $00,$00,$00,$4A,$4A,$4A,$4A,$4A
	DB $00,$46,$44,$44,$46,$44,$40,$40
	; 
	
	; --- monster 5 left 1
	DB $00,$00,$0F,$0D,$0D,$0D,$0D,$0D
	DB $0F,$09,$0B,$0B,$09,$0B,$0F,$0F
	DB $00,$00,$00,$4A,$4A,$4A,$4A,$4A
	DB $00,$46,$44,$44,$46,$44,$00,$00
	; 
	
	; --- monster 5 left 2
	DB $00,$00,$00,$0F,$0D,$0D,$0D,$0D
	DB $0D,$0F,$09,$0B,$0B,$09,$0B,$0F
	DB $00,$00,$00,$00,$4A,$4A,$4A,$4A
	DB $4A,$00,$46,$44,$44,$46,$44,$00
	; 
	
	; --- monster 5 left 3
	DB $00,$00,$0F,$0D,$0D,$0D,$0D,$0D
	DB $0F,$09,$0B,$0B,$09,$0B,$0F,$0F
	DB $00,$00,$00,$4A,$4A,$4A,$4A,$4A
	DB $00,$46,$44,$44,$46,$44,$40,$40
	; 
	
	; --- bat right 1
	DB $00,$00,$00,$00,$0F,$08,$08,$08
	DB $08,$08,$0B,$08,$0A,$0F,$00,$00
	DB $00,$00,$00,$00,$00,$47,$47,$47
	DB $47,$47,$45,$47,$45,$00,$00,$00
	; 
	
	; --- bat right 2
	DB $00,$00,$00,$00,$0F,$08,$08,$08
	DB $08,$08,$08,$0B,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$47,$47,$47
	DB $47,$47,$47,$44,$00,$00,$00,$00
	; 
	
	; --- bat right 3
	DB $00,$0F,$08,$08,$0A,$08,$08,$08
	DB $08,$08,$0B,$00,$00,$00,$00,$00
	DB $00,$00,$47,$47,$45,$47,$47,$47
	DB $47,$47,$44,$00,$00,$00,$00,$00
	; 
	
	; --- bat left 1
	DB $00,$00,$00,$00,$0F,$08,$08,$08
	DB $08,$08,$0B,$08,$0A,$0F,$00,$00
	DB $00,$00,$00,$00,$00,$47,$47,$47
	DB $47,$47,$45,$47,$45,$00,$00,$00
	; 
	
	; --- bat left 2
	DB $00,$00,$00,$00,$0F,$08,$08,$08
	DB $08,$08,$08,$0B,$00,$00,$00,$00
	DB $00,$00,$00,$00,$00,$47,$47,$47
	DB $47,$47,$47,$44,$00,$00,$00,$00
	; 
	
	; --- bat left 3
	DB $00,$0F,$08,$08,$0A,$08,$08,$08
	DB $08,$08,$0B,$00,$00,$00,$00,$00
	DB $00,$00,$47,$47,$45,$47,$47,$47
	DB $47,$47,$44,$00,$00,$00,$00,$00
	; 
	
	; --- frog right 1
	DB $00,$00,$00,$00,$00,$00,$0F,$08
	DB $0D,$0D,$08,$08,$08,$08,$08,$0F
	DB $00,$00,$00,$00,$00,$00,$00,$47
	DB $47,$47,$47,$47,$47,$47,$47,$00
	; 
	
	; --- frog right 2
	DB $00,$00,$00,$0F,$08,$0D,$0D,$08
	DB $08,$08,$08,$08,$08,$08,$0F,$00
	DB $00,$00,$00,$00,$47,$47,$47,$47
	DB $47,$47,$47,$47,$47,$47,$00,$00
	; 
	
	; --- frog right 3
	DB $00,$00,$00,$00,$0F,$08,$0D,$0D
	DB $08,$08,$08,$08,$08,$0F,$00,$00
	DB $00,$00,$00,$00,$00,$47,$47,$47
	DB $47,$47,$47,$47,$47,$00,$00,$00
	; 
	
	; --- frog left 1
	DB $00,$00,$00,$00,$00,$00,$0F,$08
	DB $0D,$0D,$08,$08,$08,$08,$08,$0F
	DB $00,$00,$00,$00,$00,$00,$00,$47
	DB $47,$47,$47,$47,$47,$47,$47,$00
	; 
	
	; --- frog left 2
	DB $00,$00,$00,$0F,$08,$0D,$0D,$08
	DB $08,$08,$08,$08,$08,$08,$0F,$00
	DB $00,$00,$00,$00,$47,$47,$47,$47
	DB $47,$47,$47,$47,$47,$47,$00,$00
	; 
	
	; --- frog left 3
	DB $00,$00,$00,$00,$0F,$08,$0D,$0D
	DB $08,$08,$08,$08,$08,$0F,$00,$00
	DB $00,$00,$00,$00,$00,$47,$47,$47
	DB $47,$47,$47,$47,$47,$00,$00,$00

	; --- box
	DB $3F,$3F,$80,$80,$FF,$FF,$87,$87
	DB $87,$80,$90,$98,$80,$80,$C0,$7F
	DB $FC,$FC,$01,$01,$FF,$FF,$E1,$E1
	DB $E1,$01,$11,$19,$01,$01,$03,$FE
	DB $00,$7F,$FF,$FF,$80,$00,$FC,$FC
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$00
	DB $00,$FE,$FF,$FF,$01,$00,$BF,$3F
	DB $FF,$FF,$FF,$FF,$FF,$FF,$FF,$00

	; --- box
	DB $0F,$04,$0C,$0B,$08,$0F,$0C,$0C
	DB $0C,$0C,$0C,$0B,$0C,$0B,$0C,$0F
	DB $00,$40,$43,$44,$47,$00,$43,$43
	DB $43,$43,$43,$44,$43,$44,$43,$00
	
spriteDataHelp:
	DB $07,$1F,$3F,$7F,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$7F,$3F,$1F,$00,$00
	DB $F8,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$07,$00,$00
	DB $00,$18,$20,$40,$80,$89,$89,$8F
	DB $89,$89,$80,$40,$20,$00,$00,$00
	DB $00,$07,$00,$00,$00,$3C,$20,$30
	DB $20,$3C,$00,$00,$F8,$00,$00,$00

	DB $0F,$FF,$FF,$FF,$FF,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FF,$FF,$E3,$00,$00
	DB $C0,$F8,$FC,$FC,$FE,$FF,$FF,$FF
	DB $FF,$FF,$FF,$FE,$FC,$F8,$00,$00
	DB $00,$F0,$00,$00,$00,$87,$84,$87
	DB $84,$E4,$00,$00,$1C,$00,$00,$00
	DB $00,$38,$04,$04,$02,$29,$A9,$29
	DB $01,$29,$01,$02,$04,$00,$00,$00

spriteColorsHelp:
	DB $0F,$0D,$0D,$0D,$0D,$0D,$0D,$0D
	DB $0D,$0D,$0D,$0D,$0D,$0F,$00,$00
	DB $00,$42,$42,$42,$42,$42,$42,$42
	DB $42,$42,$42,$42,$42,$00,$00,$00

	DB $0F,$0D,$0D,$0D,$0D,$0D,$0D,$0D
	DB $0D,$0D,$0D,$0D,$0D,$0F,$00,$00
	DB $00,$42,$42,$42,$42,$42,$42,$42
	DB $42,$42,$42,$42,$42,$00,$00,$00

