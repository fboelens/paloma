copysOrg:
wipeLineOrg:
    db 0,0
	db 0,3
	db 0,0
	db 0,0
	db 2,0
	db 200,0
	db 0,0,$d0

maptilesOrg:
    db 0,0
	db 0,1
	db 0,0
	db 0,0
	db 8,0
	db 8,0
	db 0,0,$98

spiketilesOrg:
    db 0,0
	db 0,1
	db 0,0
	db 0,0
	db 8,0
	db 8,0
	db 0,0,$d0

animtilesOrg:
    db 0,0
	db 0,1
	db 0,0
	db 0,0
	db 8,0
	db 8,0
	db 0,0,$98

mapTilesBGOrg:			
    db 0,0
	db 0,1
	db 0,0
	db 0,2
	db 32,0
	db 32,0
	db 0,0,$d0

backupSreenOrg:
	db 0,0
	db 0,0
	db 0,0
	db 212,2
	db 0,0
	db 0,0
	db 0,0,$d0

repairScreenOrg:
	db 0,0
	db 212,2
	db 0,0
	db 0,0
	db 0,0
	db 0,0
	db 0,0,$d0

LettersOrg:
    db 0,0
	db 0,1
	db 0,0
	db 0,0
	db 8,0
	db 7,0
	db 0,0,$90

LettersOrgDemo:
    db 0,0
	db 0,1
	db 0,0
	db 0,0
	db 8,0
	db 8,0
	db 0,0,$98

clearLineOrg:
    db 0,0
	db 193,1
	db 0,0
	db 0,0
	db 0,0
	db 1,0
	db 0,0,$d0

doortilesOrg:			
    db 240,0
	db 128,1
	db 0,0
	db 0,0
	db 16,0
	db 16,0
	db 0,0,$98

platform1Org:
	db 72,0
	db 184,1
	db 0,0
	db 0,0
	db 16,0
	db 8,0
	db 0,0,$90

platform2Org:
	db 88,0
	db 184,1
	db 0,0
	db 0,0
	db 16,0
	db 8,0
	db 0,0,$d0

platform1RecoverOrg:
	db 0,0
	db 0,2
	db 0,0
	db 0,0
	db 1,0
	db 8,0
	db 0,0,$90 ; copy no timp

platform2RecoverOrg:
	db 0,0
	db 0,2
	db 0,0
	db 0,0
	db 16,0
	db 1,0
	db 0,0,$d0

cageOrg:
	db 160,0
	db 54,1
	db 200,0
	db 40,0
	db 32,0
	db 42,0
	db 0,0,$d0

cageCleanOrg:
	db 200,0
	db 38,2
	db 200,0
	db 38,0
	db 32,0
	db 2,0
	db 0,0,$d0

statusTilesOrg:
    db 0,0
	db 0,1
	db 0,0
	db 0,0
	db 8,0
	db 8,0
	db 0,0,$d0

;---------------------------
optionsscreenOrg:
	db 0,0
	db 0,3
	db 0,0
	db 0,0
	db 0,0
	db 212,0
	db 0,0,$d0

spritePosOrg
    ; player
	db 218,0,0,0
	db 218,0,4,0
	
	; enemies
	db 218,0,8,0 ; enemy 1
	db 218,0,12,0
	db 218,0,16,0 ; enemy 2
	db 218,0,20,0
	db 218,0,24,0 ; enemy 3
	db 218,0,28,0
	db 218,0,32,0 ; enemy 4
	db 218,0,36,0
	db 218,0,40,0 ; enemy 5
	db 218,0,44,0
	db 218,0,48,0 ; enemy 6
	db 218,0,52,0

	;Box
	db 218,0,56,0
	db 218,0,60,0

	;Help
	db 218,0,64,0
	db 216,0,68,0

	db 218,0,72,0 
	db 218,0,76,0
	db 218,0,80,0
	db 218,0,84,0
	db 218,0,88,0
	db 218,0,92,0
	db 218,0,96,0
	db 218,0,100,0
	db 218,0,104,0

	db 218,0,108,0
	db 218,0,112,0
	db 218,0,116,0
	db 218,0,120,0
	db 218,0,124,0
	db 218,0,128,0

textbarOrg:
	db 71,66,66,66,66,66,70,66,66,66,66,66,66,66,66,66,66,71
	db 65,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65
	db 65,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,69
	db 71,66,66,66,66,66,66,66,66,66,66,66,68,66,66,66,66,71


