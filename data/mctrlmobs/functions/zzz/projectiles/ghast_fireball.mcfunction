# as snowball at self

advancement grant @p[tag=imaghast] only mctrlmobs:challenges/shootprojectile

summon fireball ~ ~ ~

tag @e remove selected
tag @e[type=minecraft:fireball,limit=1,sort=nearest] add selected
function mctrlmobs:zzz/projectiles/pdata




#set owner of fireball
data modify entity @e[type=minecraft:fireball,limit=1,sort=nearest] Owner set from entity @p[tag=imaghast] UUID


playsound minecraft:entity.ghast.warn hostile @a[distance=0..100] ~ ~ ~ 1 1 1