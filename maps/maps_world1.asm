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

; enemy 
; 0 = skeleton
; 1 = bat
; 2 = monster
; 3 = knight
; 4 = ghost
; 5 = blob

maps_world1:
    ; finished
    incbin "world1/paloma1-1f.pal"
    db 1,10 ; player position
    db 6,18,3,left,1,false;  enemy 1 @todo
    db 19,1,1,left,1,false ;  enemy 2 @todo
    db 0,0,0,up,0,false ; enemy
    db 0,0,1,0,0,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finished
    incbin "world1/paloma1-2f.pal"
    db 2,17 ; player position
    db 15,7,   0,left,5,false;  enemy 1
    db 16,10,   1,left,1,false ;  enemy 2
    db 20,2,   1,down,2,false ; enemy 3
    db 0,0,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world1/paloma1-3f.pal"
    db 4,18 ; player position
    db 29,5,  1,down,10,false;  enemy 1
    db 22,18,   0,left,1,false ;  enemy 2
    db 15,5,   5,right,5,false ; enemy 3
    db 0,0,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world1/paloma1-4f.pal"
    db 1,18 ; player position
    db 16,12,   0,right,5,false;  enemy 1
    db 24,15,   2,left,7,false ;  enemy 2
    db 20,1,   1,right,1,false ; enemy 3
    db 0,0,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 0,0 ; box 

    ; finished
    incbin "world1/paloma1-5f.pal"
    db 2,1 ; player position
    db 6,18,   0,right,9,false;  enemy 1
    db 22,18,  5,left,1,false ;  enemy 2
    db 20,1,   1,right,9,false ; enemy 3
    db 0,0,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 17,4 ; box 

    ; finished
    incbin "world1/paloma1-6f.pal"
    db 15,18 ; player position
    db 1,11,   1,down,2,false;  enemy 1
    db 29,6,   1,down,2,false ;  enemy 2
    db 5,18,   4,right,1,false ; enemy 3
    db 0,0,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 5,3 ; box 

    ; finished
    incbin "world1/paloma1-7f.pal"
    db 5,6 ; player position
    db 21,7,   5,left,5,true;  enemy 1
    db 15,10,   4,left,5,true ;  enemy 2
    db 22,16,   1,right,1,false ; enemy 3
    db 0,0,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 23,1 ; box 

    incbin "world1/paloma1-8f.pal"
    db 1,1 ; player position
    db 5,4,   1,left,1,true;  enemy 1
    db 18,1,   3,left,5,false ;  enemy 2
    db 16,14,   2,right,5,false ; enemy 3
    db 9,18,   4,right,1,false ; enemy 4
    db 0,0,   0,left,0,false ; enemy 5
    db 0,0,   0,right,0,false ; enemy 6
    db 8,1 ; box 

    incbin "world1/paloma1-9f.pal"
    db 20,1 ; player position
    db 8,11,2,left,5,false;  enemy 1
    db 10,18,5,right,1,false ;  enemy 2 
    db 29,5,1,up,2,true ; enemy
    db 0,0,0,up,0,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 18,1 ; box

    ; finished
    incbin "world1/paloma1-10f.pal"
    db 1,18 ; player position
    db 6,4,0,left,5,false;  enemy 1
    db 7,7,1,right,1,false ;  enemy 2 
    db 0,0,0,up,0,false ; enemy
    db 0,0,0,up,0,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box
    
maps_bg_world1:
    incbin "world1/paloma1-1b.pab"
    incbin "world1/paloma1-2b.pab"    
    incbin "world1/paloma1-3b.pab"
    incbin "world1/paloma1-4b.pab"    
    incbin "world1/paloma1-5b.pab"
    incbin "world1/paloma1-6b.pab"    
    incbin "world1/paloma1-7b.pab"
    incbin "world1/paloma1-8b.pab"    
    incbin "world1/paloma1-9b.pab"
    incbin "world1/paloma1-10b.pab"    

texts_world1:
    db "Beginning of a journey!",255
    db "Don't fall in the water",255
    db "Hall with the deadly cactus",255
    db "The Sprint Fiend",255
    db "What does that switch do?",255
    db "The infinite chamber",255
    db "Not too fast to the door!",255
    db "That bat is fast!",255
    db "Think thirst",255
    db "Mind your steps please!",255

