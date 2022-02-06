execute store result entity @e[tag=selected,limit=1,sort=nearest] power[0] double 0.000003 run data get entity @s Motion[0] 10000
execute store result entity @e[tag=selected,limit=1,sort=nearest] power[1] double 0.000003 run data get entity @s Motion[1] 10000
execute store result entity @e[tag=selected,limit=1,sort=nearest] power[2] double 0.000003 run data get entity @s Motion[2] 10000


execute store result entity @e[tag=selected,limit=1,sort=nearest] Motion[0] double 0.00003 run data get entity @s Motion[0] 10000
execute store result entity @e[tag=selected,limit=1,sort=nearest] Motion[1] double 0.00003 run data get entity @s Motion[1] 10000
execute store result entity @e[tag=selected,limit=1,sort=nearest] Motion[2] double 0.00003 run data get entity @s Motion[2] 10000

#set owner of fireball
data modify entity @e[tag=selected,limit=1,sort=nearest] Owner set from entity @p UUID


tag @e[tag=selected,limit=1,sort=nearest] remove selected

# remove snowball
kill @s