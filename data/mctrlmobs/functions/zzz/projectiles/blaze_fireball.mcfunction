# as snowball at self


summon small_fireball ~ ~ ~

tag @e remove selected
tag @e[type=minecraft:small_fireball,limit=1,sort=nearest] add selected
function mctrlmobs:zzz/projectiles/pdata




#set owner of fireball
data modify entity @e[type=minecraft:small_fireball,limit=1,sort=nearest] Owner set from entity @p[tag=imablaze] UUID


playsound minecraft:entity.blaze.shoot hostile @a[distance=0..100] ~ ~ ~ 1 1 1