; x
; y
; enemy number
; start direction
; ai type
; doublespeed?

; ai 
; 1 = left/right
; 2 = up/down
; 3 = left/right after key
; 4 = up/down after key
; 5 = floorwalker
; 6 = walk and wait (princess?)
; 7 = floorwalker sudden run
; 8 = up/down for enemy sprite 2
; 9 = left/right after switch on
; 10 =  up/down after switch on


; 0 = orange blob
; 1 = rhino monster
; 2 = skeleton monster
; 3 = alien knight
; 4 = bat
; 5 = snake

maps_world3:
    incbin "world3/paloma3-1f.pal"
    ; finisihed
    db 8,18 ; player position
    db 25,16,   4,left,1,false;  enemy 1
    db 13,4,   2,left,5,false ;  enemy 2
    db 15,8,   5,right,5,false ; enemy 3
    db 24,13,   5,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world3/paloma3-2f.pal"
    db 11,18 ; player position
    db 3,3,   0,left,7,false;  enemy 1
    db 4,12,   1,left,7,false ;  enemy 2
    db 8,6,   4,right,1,false ; enemy 3
    db 29,7,   4,down,2,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world3/paloma3-3f.pal"
    db 26,1 ; player position
    db 10,18,   5,left,1,false;  enemy 1
    db 5,6,   4,left,1,true ;  enemy 2
    db 6,3,   3,right,5,false ; enemy 3
    db 22,18,   5,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 24,1 ; box 

    ; finished
    incbin "world3/paloma3-4f.pal"
    db 1,17 ; player position
    db 8,3,   3,left,5,true ;  enemy 1
    db 22,3,   3,left,5,true ;  enemy 2
    db 1,9,   0,right,5,false ; enemy 3
    db 11,17,   5,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world3/paloma3-5f.pal"
    db 7,5 ; player position
    db 20,1,   4,left,1,false;  enemy 1
    db 13,11,   1,left,7,false;  enemy 2
    db 0,0,   5,right,1,false ; enemy 3
    db 8,9,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 10,1 ; box 

    ; finished
    incbin "world3/paloma3-6f.pal"
    db 16,4 ; player position
    db 3,18,   3,left,1,true;  enemy 1
    db 23,18,   3,left,1,true ;  enemy 2
    db 0,0,   5,right,1,false ; enemy 3
    db 0,0,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world3/paloma3-7f.pal"
    db 1,16 ; player position
    db 21,5,   5,left,5,false;  enemy 1
    db 6,5,   3,left,5,false ;  enemy 2
    db 8,13,   5,right,5,false ; enemy 3
    db 8,9,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 17,2 ; box 

    ; finished
    incbin "world3/paloma3-8f.pal"
    db 3,15 ; player position
    db 2,11,   4,left,1,true;  enemy 1
    db 19,18,   0,left,1,false ;  enemy 2
    db 4,4,   5,right,7,false ; enemy 3
    db 21,15,   4,down,2,false ; enemy 4
    db 18,2,   4,left,1,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world3/paloma3-9f.pal"
    db 12,2 ; player position
    db 18,14,   3,left,5,false;  enemy 1
    db 7,6,   3,left,5,true ;  enemy 2
    db 10,13,   4,left,1,false ; enemy 3
    db 8,9,   4,right,1,false ; enemy 4
    db 23,2,   3,left,9,true ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    incbin "world3/paloma3-10f.pal"
    db 13,6 ; player position
    db 18,1,  4,left,1,true;  enemy 1
    db 2,1,   4,left,1,true ;  enemy 2
    db 9,18,   1,right,1,true ; enemy 3
    db 5,9,   0,right,7,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 20,1 ; box 


maps_bg_world3:
    incbin "world3/paloma3-1b.pab"
    incbin "world3/paloma3-2b.pab"    
    incbin "world3/paloma3-3b.pab"
    incbin "world3/paloma3-4b.pab"    
    incbin "world3/paloma3-5b.pab"
    incbin "world3/paloma3-6b.pab"    
    incbin "world3/paloma3-7b.pab"
    incbin "world3/paloma3-8b.pab"    
    incbin "world3/paloma3-9b.pab"
    incbin "world3/paloma3-10b.pab"    

texts_world3:
    db "Creepy Caves",255
    db "Saeba for president!",255
    db "Lava waterfalls",255
    db "Manic remin(d)er",255
    db "Crystal mine",255
    db "Skull cave",255
    db "Morgath's hanged man",255
    db "The Batcave",255
    db "Fast alien knights",255
    db "The confusing cave",255
