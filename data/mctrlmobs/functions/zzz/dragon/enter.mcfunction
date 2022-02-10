
execute unless entity @e[tag=dragonhost] run function mctrlmobs:zzz/dragon/createhost


spectate
gamemode survival

tp @e[type=ender_dragon] 0 -64 0
kill @e[type=ender_dragon]



bossbar set mctrlmobs:ender_dragon name {"selector":"@s"}




effect give @s minecraft:slowness 100000 3 true
effect give @s minecraft:strength 10000 1 true
effect give @s minecraft:slow_falling 100000 0 true
effect give @s minecraft:instant_health 100 100 true
effect give @s minecraft:fire_resistance 100000 0 true


attribute @s minecraft:generic.max_health base set 200
scoreboard players set @s mmaxhealth 200


# start in circling mode
scoreboard players set @s dragoncountdown 2400
scoreboard players set @s dragonsecond 120
scoreboard players set @s dragontick 0
scoreboard players set @s mctrlmobs.itemcooldown 200

tag @s add circling







tag @s add dragontick
tag @s add imadragon