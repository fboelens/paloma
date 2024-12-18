ending:
    call memload_demofont

    call memload_intro
    call enddemo

    ld a,15
    ld (forclr),a
    ld a,0
    ld (bakclr),a
    ld a,0
    ld (bdrclr),a
    call chgclr

	ld a,8
	call chgmod


	call disscr

	call memload_ending

	call enascr
endingloop:
	halt
	call checkTrigger
	jp nz,endingloop

	jp init_start    
