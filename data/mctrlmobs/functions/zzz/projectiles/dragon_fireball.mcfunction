# as snowball at self


summon dragon_fireball ~ ~ ~

tag @e[type=minecraft:dragon_fireball,limit=1,sort=nearest] add selected
function mctrlmobs:zzz/projectiles/pdata



#set owner of fireball
#data modify entity @e[type=minecraft:fireball,limit=1,sort=nearest] Owner set from entity @p[tag=imadragon] UUID




playsound minecraft:entity.ender_dragon.shoot hostile @a[distance=0..200] ~ ~ ~ 1 1 1