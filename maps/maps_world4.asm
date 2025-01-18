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


; 0 = snowbal
; 1 = snowman
; 2 = red pengi
; 3 = snow monster
; 4 = wolf
; 5 = bird
; 6 = owl

maps_world4:
    ; finished
    incbin "world4/paloma4-1f.pal"
    db 1,18 ; player position
    db 22,18, 4,left,1,false    ;  enemy 1
    db 22,2,   3,right,7,false ; enemy 3
    db 8,11,   4,left,7,false ;  enemy 2    
    db 0,0,   0,down,0,false ; enemy 4
    db 0,0,   0,right,0,false ; enemy 3
    db 0,0,   0,right,0,false ; enemy 6
    db 11,5 ; box 

    ; finished
    incbin "world4/paloma4-2f.pal"
    db 1,18 ; player position
    db 8,4,   2,left,5,true;  enemy 1
    db 12,8,   2,left,7,true ;  enemy 2
    db 10,14,   4,right,5,false ; enemy 3
    db 8,1,   5,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world4/paloma4-3f.pal"
    db 15,16 ; player position
    db 13,12,   5,left,1,false;  enemy 1
    db 12,2,   5,left,1,false ;  enemy 2
    db 12,6,   3,right,5,false ; enemy 3
    db 6,7,   6,down,2,false ; enemy 4
    db 24,7,   6,down,2,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world4/paloma4-4f.pal"
    db 9,15 ; player position
    db 2,5,   3,left,5,false;  enemy 1
    db 24,5,   3,left,5,false ;  enemy 2
    db 1,1,   5,right,1,false ; enemy 3
    db 8,8,   4,right,7,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world4/paloma4-5f.pal"
    db 1,2 ; player position
    db 15,11,   1,left,5,false;  enemy 1
    db 25,5,   0,left,5,false ;  enemy 2
    db 5,5,   0,right,1,false ; enemy 3
    db 0,0,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world4/paloma4-6f.pal"
    db 27,2 ; player position
    db 22,18,   3,left,7,true;  enemy 1
    db 3,5,   5,left,1,true ;  enemy 2
    db 19,12,   1,right,5,false ; enemy 3
    db 5,11,   4,right,5,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world4/paloma4-7f.pal"
    db 5,2 ; player position
    db 26,1,   5,left,1,true;  enemy 1
    db 12,7,   0,left,5,false ;  enemy 2
    db 29,9,   6,down,2,false ; enemy 3
    db 11,15,   4,right,5,false ; enemy 4
    db 18,16,   6,down,2,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 3,12 ; box 

    ; finished
    incbin "world4/paloma4-8f.pal"
    db 26,1 ; player position
    db 6,1,   5,right,9,true;  enemy 1
    db 13,18,   4,left,7,false ;  enemy 2
    db 18,13,   5,right,1,false ; enemy 3
    db 3,7,   4,right,7,false ; enemy 4
    db 25,7,   4,left,7,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    incbin "world4/paloma4-9f.pal"
    db 1,4 ; player position
    db 4,18,   3,left,1,false;  enemy 1
    db 20,4,   4,left,5,false ;  enemy 2
    db 25,7,   4,right,5,false ; enemy 3
    db 21,10,   4,right,7,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    incbin "world4/paloma4-10f.pal"
    db 4,1 ; player position
    db 4,18,   2,left,7,false;  enemy 1
    db 22,18,   2,left,7,false ;  enemy 2
    db 13,14,   1,right,7,false ; enemy 3
    db 20,4,   5,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

maps_bg_world4:
    incbin "world4/paloma4-1b.pab"
    incbin "world4/paloma4-2b.pab"    
    incbin "world4/paloma4-3b.pab"
    incbin "world4/paloma4-4b.pab"    
    incbin "world4/paloma4-5b.pab"
    incbin "world4/paloma4-6b.pab"    
    incbin "world4/paloma4-7b.pab"
    incbin "world4/paloma4-8b.pab"    
    incbin "world4/paloma4-9b.pab"
    incbin "world4/paloma4-10b.pab"    

texts_world4:
    db "Watch out, it's slippery!",255
    db "The angry snowman",255
    db "Whispering Winter Falls",255
    db "Skulls in Winter's Silence",255
    db "Snowy platforms",255
    db "Winter's Realm",255
    db "Dive for the bird",255
    db "What to do first?",255
    db "Subterranean falls",255
    db "Dive into the deep",255
