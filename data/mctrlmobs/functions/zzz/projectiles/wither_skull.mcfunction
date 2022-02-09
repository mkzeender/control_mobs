# as snowball at self


summon wither_skull ~ ~-.5 ~


tag @e[type=minecraft:wither_skull,limit=1,sort=nearest] add selected
function mctrlmobs:zzz/projectiles/pdata




#set owner of fireball
data modify entity @e[type=minecraft:wither_skull,limit=1,sort=nearest] Owner set from entity @p[tag=imawither] UUID


playsound minecraft:entity.wither.shoot hostile @a[distance=0..50] ~ ~ ~ 1 1 1