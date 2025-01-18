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

; 0 = magician
; 1a = block
; 1b = bullet
; 2 = princess
; 3 = skeleton
; 4 = mushroom
; 5 = bat
; 6 = frog

maps_world5:
    ; finished
    incbin "world5/paloma5-1f.pal"
    db 2,11 ; player position
    db 24,3,3,left,5,false;  enemy 1 @todo
    db 6,18,3,left,7,false ;  enemy 2 @todo
    db 19,6,5,up,2,false ; enemy
    db 7,5,6,right,7,false ; enemy
    db 29,3,5,down,2,true ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finished
    incbin "world5/paloma5-2f.pal"
    db 8,7 ; player position
    db 3,14,5,down,2,false;  enemy 1 @todo
    db 14,1,5,left,1,false ;  enemy 2 @todo
    db 25,7,1,up,2,false ; enemy
    db 22,18,6,right,1,false ; enemy
    db 29,3,1,down,2,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finished
    incbin "world5/paloma5-3f.pal"
    db 2,1 ; player position
    db 24,2,3,left,7,false;  enemy 1 @todo
    db 21,18,6,left,1,true ;  enemy 2 @todo
    db 4,18,3,right,1,true ; enemy
    db 19,12,6,right,1,false ; enemy
    db 4,8,5,left,1,true ; enemy
    db 0,0,0,right,0,false ; enemy
    db 7,11 ; box

    ; finished
    incbin "world5/paloma5-4f.pal"
    db 3,4 ; player position
    db 10,10,1,up,10,false;  enemy 1 @todo
    db 20,1,4,left,7,false ;  enemy 2 @todo
    db 11,17,1,up,10,false ; enemy
    db 27,10,1,up,10,false ; enemy
    db 17,4,4,left,7,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finished
    incbin "world5/paloma5-5f.pal"
    db 29,4 ; player position
    db 13,1,5,left,1,true;  enemy 1 @todo
    db 2,4,5,left,1,false ;  enemy 2 @todo
    db 14,5,1,down,2,true ; enemy
    db 27,9,1,down,2,false ; enemy
    db 4,14,4,left,5,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finished
    incbin "world5/paloma5-6f.pal"
    db 24,1 ; player position
    db 4,2,1,down,2,false;  enemy 1 @todo
    db 13,18,3,left,1,true ;  enemy 2 @todo
    db 18,18,3,right,1,false ; enemy
    db 23,5,6,left,7,false ; enemy
    db 26,9,5,down,2,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finished
    incbin "world5/paloma5-7f.pal"
    db 1,18 ; player position
    db 4,4,4,left,5,true;  enemy 1 @todo
    db 4,8,4,left,5,false ;  enemy 2 @todo
    db 4,12,4,left,5,false ; enemy
    db 19,18,4,right,1,false ; enemy
    db 0,0,0,left,0,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    incbin "world5/paloma5-8f.pal"
    db 28,6 ; player position
    db 8,2,1,down,2,false;  enemy 1 @todo
    db 6,18,6,left,9,false ;  enemy 2 @todo
    db 20,10,5,right,1,false ; enemy
    db 3,6,5,right,1,false ; enemy
    db 12,14,6,right,7,false ; enemy
    db 25,18,6,right,7,false ; enemy
    db 0,0 ; box

    incbin "world5/paloma5-9f.pal"
    db 29,14 ; player position
    db 24,18,4,left,1,false;  enemy 1 @todo
    db 15,2,1,down,2,true ;  enemy 2 @todo
    db 12,18,3,left,7,false ; enemy
    db 25,10,3,right,1,false ; enemy
    db 11,12,5,left,1,false ; enemy
    db 0,0,0,right,0,false ; enemy
    db 0,0 ; box

    ; finished
    incbin "world5/paloma5-10f.pal"
    db 1,18 ; player position
    db 26,16,0,left,98,false;  enemy 1 @todo
    db 0,0,1,up,0,false ; enemy
    db 0,0,1,0,0,false ; enemy
    db 0,0,1,left,0,false ; enemy
    db 0,0,1,right,0,false ; enemy
    db 26,8,2,left,6,false ;  enemy 2 @todo    
    db 0,0 ; box

maps_bg_world5:
    incbin "world5/paloma5-1b.pab"
    incbin "world5/paloma5-2b.pab"    
    incbin "world5/paloma5-3b.pab"
    incbin "world5/paloma5-4b.pab"    
    incbin "world5/paloma5-5b.pab"
    incbin "world5/paloma5-6b.pab"    
    incbin "world5/paloma5-7b.pab"
    incbin "world5/paloma5-8b.pab"    
    incbin "world5/paloma5-9b.pab"
    incbin "world5/paloma5-10b.pab"    

texts_world5:
    db "Morgaths dungeon",255
    db "The Catacombs",255
    db "Forbidden Depths",255
    db "Dangerous vaults",255
    db "Twilight Chambers",255
    db "Skeletons in the darkness",255
    db "The Lava Labyrinth",255
    db "Echoes of bats",255
    db "Stairway to hell",255
    db "The final battle",255
