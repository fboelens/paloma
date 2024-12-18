dataStart: #0

; title and options
wavePointer: #2
menuStatus: #1
option_dif: #1
option_freq: #1
option_fm_bal: #1
option_psg_bal: #1
option_sfx_vol: #1
exitDemo: #1

;-------------------------------------
; Map data
;-------------------------------------
map: #mapLength ; 

mapPointer: #2
mapBGPointer: #2
songPointer: #2
spriteDataEnemyPointer: #2
spriteColorsEnemyPointer: #2
textWorldPointer: #2
colorSetPointer: #2

level_switch: #1
level_switch_time: #1

spikesx2: #1              ; backup
spikesy2: #1

copys: #0
wipeLine:  #0
wpsx:	#2
wpsy:	#2
wpdx:	#2
wpdy:	#9

maptiles: #0			; data voor blokjes copy tijdens scroll
mapsx:	#2
mapsy:	#2
mapdx:	#2
mapdy:	#9

spiketiles: #0			; data voor blokjes copy tijdens scroll
spikesx:	#2
spikesy:	#2
spikedx:	#2
spikedy:	#9

animtiles: #0			; data voor blokjes copy tijdens scroll
animsx:	#2
animsy:	#2
animdx:	#2
animdy:	#9

mapTilesBG: #0			; data voor blokjes copy tijdens scroll
mapbgsx:	#2
mapbgsy:	#2
mapbgdx:	#2
mapbgdy:	#9

backupScreen: #0
busx:   #2
busy:	#2
budx:	#2
budy:	#2
bunx:	#2
buny:	#5

repairScreen: #0
rpsx:   #2
rpsy:	#2
rpdx:	#2
rpdy:	#2
rpnx:	#2
rpny:	#5

letters: #0
lesx:	#2
lesy:	#2
ledx:	#2
ledy:	#9

lettersDemo: #0
ledsx:	#2
ledsy:	#2
leddx:	#2
leddy:	#9

clearLine: #0
clsx:	#2
clsy:	#2
cldx:	#2
cldy:	#9

doortiles: #0			; data voor blokjes copy tijdens scroll
doorsx:	#2
doorsy:	#2
doordx:	#2
doordy:	#9

platform1: #4
pf1dx:	#2
pf1dy:	#2
pf1nx:	#2
pf1ny:	#5

platform2: #0
pf2sx:  #2
pf2sy:	#2
pf2dx:	#2
pf2dy:	#2
pf2nx:	#2
pf2ny:	#5

platform1Recover: #0
p1rsx:  #2
p1rsy:	#2
p1rdx:	#2
p1rdy:	#2
p1rnx:	#2
p1rny:	#5

platform2Recover: #0
p2rsx:   #2
p2rsy:	#2
p2rdx:	#2
p2rdy:	#2
p2rnx:	#2
p2rny:	#5

cage: #0
casx:   #2
casy:	#2
cadx:	#2
cady:	#2
canx:	#2
cany:	#5

cageClean: #0
cacsx:   #2
cacsy:	#2
cacdx:	#2
cacdy:	#2
cacnx:	#2
cacny:	#5

statusTiles: #0
stsx:   #2
stsy:	#2
stdx:	#2
stdy:	#2
stnx:	#2
stny:	#5

leddx2: #1
leddy2: #1

textBarX: #1
textBarY: #1

mapBuildPointer: #2

dataPalette: #32

currentTileX: #1
currentTileY: #1
breakDownFloorCounter #1

animationPos: #2

spikePos: #2
spikeSpace: #64
spikeCounter: #1

keysInMap: #1
keysLeft: #1
levelCompleted: #1

boxmove: #1
boxmoveCounter: #1
boxTilePos: #2
;-------------------------------------
; Program variables
;-------------------------------------

isrTimer: #1
isrCurrent: #10
isrSplitCurrent: #10
isrCounter: #1
isrReverse: #1
isrInvincible: #1
CRVLastOut: #1
mainCounter: #1

joyStickValueY:	#1
joyStickValueX:	#1

;-------------------------------------
; Player variables
;-------------------------------------
playerIsDead: #1
playerJumpBoolean: #1
playerJumpPosition: #2
playerSpaceTriggered: #1
playerOnPlatform: #1
playerOnPlatform2: #1
platform1Wait: #1
platform2Wait: #1
playerFall: #1

; is a way blocking for the player?
leftBlocked: #1
rightBlocked: #1
upBlocked: #1
downBlocked: #1

playerDirection: #1 ; left or right

playerMovePointer: #2

playerInvincible: #1;
playerReverse: #1;
playerWorld: #1;
playerStage: #1;
playerMoveCounter: #1;

defaultLives: #1; depending on difficulty
defaultTime: #2; depending on difficulty
playerLives: #1;
playerLivesAsc: #5;

playerScore: #2;
playerScoreAsc: #5;
playerHighScore: #2;
playerHighScoreAsc: #5;


playerTime: #2;
playerTimeAsc: #5

playerIceLeft: #1
playerIceRight: #1
onIce: #1

pmcounter: #1;
cageFall: #1;
;-------------------------------------
; Enemy variables
;-------------------------------------
; 0000URDL up right down left
enemy1Number: #2
enemy1Direction: #1
enemy1AI: #1
enemy1Dead: #1
enemy1AIState: #1
enemy1DoubleSpeed: #1
enemy1MoveCounter: #1

enemy2Number: #2
enemy2Direction: #1
enemy2AI: #1
enemy2Dead: #1
enemy2AIState: #1
enemy2DoubleSpeed: #1
enemy2MoveCounter: #1

enemy3Number: #2
enemy3Direction: #1
enemy3AI: #1
enemy3Dead: #1
enemy3AIState: #1
enemy3DoubleSpeed: #1
enemy3MoveCounter: #1

enemy4Number: #2
enemy4Direction: #1
enemy4AI: #1
enemy4Dead: #1
enemy4AIState: #1
enemy4DoubleSpeed: #1
enemy4MoveCounter: #1

enemy5Number: #2
enemy5Direction: #1
enemy5AI: #1
enemy5Dead: #1
enemy5AIState: #1
enemy5DoubleSpeed: #1
enemy5MoveCounter: #1

enemy6Number: #2
enemy6Direction: #1
enemy6AI: #1
enemy6Dead: #1
enemy6AIState: #1
enemy6DoubleSpeed: #1
enemy6MoveCounter: #1

enemyMovePointer: #2
enemyJumpPosition: #2
bossMovePointer: #2
bossMoveCounter: #1

bubbleDIV: #5
bubbleDIV2: #5

platform1Y: #1
platform1X: #1
platform1Move: #1

platform2Y: #1
platform2X: #1
platform2Move: #1

;-------------------------------------
; Sprite variables
;-------------------------------------
spriteColorsSource: #2
spriteDataSource: #2

spritePositionPlayer: #0
py:	#1
px: #7

spritePositionEnemy1: #8
spritePositionEnemy2: #8
spritePositionEnemy3: #8
spritePositionEnemy4: #8
spritePositionEnemy5: #8
spritePositionEnemy6: #8 
spritePositionBox: #8
spritePositionHelp: #16
spriteData: #64
spriteDataEnemie: #384
spriteColors: #32
spriteColorsEnemie: #192
spritePositionHand: #8

txt_pass: #7
txt_pass_position: #1
txt_pass_input: #4

textbar: #72

decompressSpace: #0
animationSpace: #1024

sfxbank: #(sfx_end - sfx_org)
dataEnd: #0

