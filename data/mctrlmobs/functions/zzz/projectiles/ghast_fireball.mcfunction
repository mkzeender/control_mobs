# as snowball at self


summon fireball ~ ~ ~


tag @e[type=minecraft:fireball,limit=1,sort=nearest] add selected
function mctrlmobs:zzz/projectiles/pdata


#data modify entity @e[type=minecraft:fireball,limit=1,sort=nearest] Motion set from entity @s Motion
#data modify entity @e[type=minecraft:fireball,limit=1,sort=nearest] power set from entity @s Motion

#execute store result entity @e[type=minecraft:fireball,limit=1,sort=nearest] Motion[0] double 2 run data get entity @s Motion[0]
#execute store result entity @e[type=minecraft:fireball,limit=1,sort=nearest] Motion[1] double 2 run data get entity @s Motion[1]
#execute store result entity @e[type=minecraft:fireball,limit=1,sort=nearest] Motion[2] double 2 run data get entity @s Motion[2]



#execute store result entity @e[type=minecraft:fireball,limit=1,sort=nearest] power[0] double 0.000003 run data get entity @s Motion[0] 10000
#execute store result entity @e[type=minecraft:fireball,limit=1,sort=nearest] power[1] double 0.000003 run data get entity @s Motion[1] 10000
#execute store result entity @e[type=minecraft:fireball,limit=1,sort=nearest] power[2] double 0.000003 run data get entity @s Motion[2] 10000


#set owner of fireball
data modify entity @e[type=minecraft:fireball,limit=1,sort=nearest] Owner set from entity @p[tag=imaghast] UUID


playsound minecraft:entity.ghast.warn hostile @a[distance=0..100] ~ ~ ~ 1 1 1