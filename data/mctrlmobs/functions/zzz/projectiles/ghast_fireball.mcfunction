# as snowball at self


summon fireball ~ ~ ~


tag @e[type=minecraft:fireball,limit=1,sort=nearest] add selected
function mctrlmobs:zzz/projectiles/pdata




#set owner of fireball
data modify entity @e[type=minecraft:fireball,limit=1,sort=nearest] Owner set from entity @p[tag=imaghast] UUID


playsound minecraft:entity.ghast.warn hostile @a[distance=0..100] ~ ~ ~ 1 1 1