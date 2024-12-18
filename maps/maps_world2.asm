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
; 11 = left/right for enemy sprite 2

; 0 = frog
; 1a = owl (ai type 2)
; 1b = bee (ai type 8)
; 2 = hedgerhog
; 3 = caterpillar
; 4 = blob
; 5 = fox
; 6 = mario


maps_world2:
    ; finished
    incbin "world2/paloma2-1f.pal"
    db 17,6 ; player position
    db 4,11,0,left,1,false;  enemy 1 @todo
    db 7,3,2,left,7,false ;  enemy 2 @todo
    db 29,2,1,down,8,false ; enemy
    db 0,0,1,0,0,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; fisnihed
    incbin "world2/paloma2-2f.pal"
    db 6,17 ; player position
    db 23,17,0,left,1,false;  enemy 1 @todo
    db 2,2,2,left,5,false ;  enemy 2 @todo
    db 29,2,1,down,2,false ; enemy
    db 0,0,1,0,0,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finished
    incbin "world2/paloma2-3f.pal"
    db 29,15 ; player position
    db 2,8,5,left,5,false;  enemy 1 @todo
    db 7,8,4,left,5,false ;  enemy 2 @todo
    db 1,1,1,right,11,false ; enemy
    db 0,0,1,0,0,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 21,18 ; box

    ; finished
    incbin "world2/paloma2-4f.pal"
    db 28,15 ; player position
    db 2,18,3,left,1,true;  enemy 1 @todo
    db 1,1,1,left,11,false ;  enemy 2 @todo
    db 19,9,1,down,2,false ; enemy
    db 2,9,6,right,1,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finsished
    incbin "world2/paloma2-5f.pal"
    db 6,9 ; player position
    db 26,14,6,right,9,true;  enemy 1 @todo
    db 24,11,4,left,5,false ;  enemy 2 @todo
    db 15,2,1,up,2,false ; enemy
    db 12,1,6,right,1,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 6,11 ; box

    ; finished
    incbin "world2/paloma2-6f.pal"
    db 3,18 ; player position
    db 4,9,5,left,1,false;  enemy 1 @todo
    db 9,4,4,left,7,false ;  enemy 2 @todo
    db 28,18,2,left,7,false ; enemy
    db 0,0,1,0,0,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finished
    incbin "world2/paloma2-7f.pal"
    db 28,18 ; player position
    db 24,9,0,left,5,false;  enemy 1 @todo
    db 23,6,6,right,1,false ;  enemy 2 @todo
    db 10,13,6,left,1,true ; enemy
    db 5,4,6,right,1,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 14,1 ; box

    incbin "world2/paloma2-8f.pal"
    db 2,6 ; player position
    db 15,4,1,down,4,false;  enemy 1 @todo
    db 1,9,6,left,1,false ;  enemy 2 @todo
    db 19,9,6,right,1,false ; enemy
    db 0,0,1,0,0,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    incbin "world2/paloma2-9f.pal"
    db 14,18 ; player position
    db 12,12,4,left,5,false;  enemy 1 @todo
    db 3,18,3,left,9,false ;  enemy 2 @todo
    db 1,6,1,down,8,false ; enemy
    db 1,1,6,right,1,true ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    incbin "world2/paloma2-10f.pal"
    db 28,15 ; player position
    db 6,18,5,left,1,true;  enemy 1 @todo
    db 20,7,1,down,2,false ;  enemy 2 @todo
    db 10,7,1,down,2,false ; enemy
    db 6,18,5,right,1,true ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

maps_bg_world2:
    incbin "world2/paloma2-1b.pab"
    incbin "world2/paloma2-2b.pab"    
    incbin "world2/paloma2-3b.pab"
    incbin "world2/paloma2-4b.pab"    
    incbin "world2/paloma2-5b.pab"
    incbin "world2/paloma2-6b.pab"    
    incbin "world2/paloma2-7b.pab"
    incbin "world2/paloma2-8b.pab"    
    incbin "world2/paloma2-9b.pab"
    incbin "world2/paloma2-10b.pab"    

texts_world2:
    db "Welcome to the jungle",255
    db "King of the Jungle",255
    db "Timing is important!",255
    db "Watch out for the skulls",255
    db "Can the box kill the blob?",255
    db "I can buy myself flowers",255
    db "Move the box (not too) fast!",255
    db "Mushroom fantasy",255
    db "Switch off the caterpillar",255
    db "Are you not afraid of heights?",255
