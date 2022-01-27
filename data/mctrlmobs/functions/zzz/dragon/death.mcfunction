

execute as @e[tag=dragonhost] at @s run fill ~-2 ~-5 ~-2 ~2 ~-5 ~2 minecraft:end_portal
execute as @e[tag=dragonhost] at @s run setblock ~-2 ~-5 ~-2 bedrock
execute as @e[tag=dragonhost] at @s run setblock ~-2 ~-5 ~02 bedrock
execute as @e[tag=dragonhost] at @s run setblock ~02 ~-5 ~-2 bedrock
execute as @e[tag=dragonhost] at @s run setblock ~02 ~-5 ~02 bedrock
execute as @e[tag=dragonhost] at @s run setblock ~00 ~-5 ~00 bedrock

playsound minecraft:entity.ender_dragon.death hostile @a[distance=0..200] ~ ~ ~ 1 1 1