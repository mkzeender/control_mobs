
execute unless entity @e[tag=dragonhost] run function mctrlmobs:zzz/dragon/createhost


spectate
gamemode survival

data merge entity @e[tag=iscontrolled,limit=1] {NoAI:false}
tag @e[tag=iscontrolled] remove mctrlmobs.firsttick
tag @e[tag=iscontrolled] remove mctrlmobs.secondtick
tp @e[tag=iscontrolled] 0 -64 0


bossbar set mctrlmobs:ender_dragon name {"selector":"@s"}




effect give @s minecraft:slowness 100000 3 true
effect give @s minecraft:strength 10000 1 true
effect give @s minecraft:slow_falling 100000 0 true
effect give @s minecraft:instant_health 100 100 true
effect give @s minecraft:fire_resistance 100000 0 true

function mctrlmobs:zzz/reset_attributes
attribute @s minecraft:generic.max_health base set 200
scoreboard players set @s mmaxhealth 200


# start in circling mode
scoreboard players set @s dragoncountdown 2400
scoreboard players set @s dragonsecond 120
scoreboard players set @s dragontick 0
scoreboard players set @s mctrlmobs.itemcooldown 200

tag @s add circling






tag @s add imamob
tag @s add imadragon