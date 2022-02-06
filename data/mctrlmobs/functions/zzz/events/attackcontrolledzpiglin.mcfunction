advancement revoke @s only mctrlmobs:attackcontrolledzpiglin

tag @e remove zselected

tag @s add zselected

execute as @e[type=minecraft:zombified_piglin] at @s run data modify entity @s AngryAt set from entity @p[distance=0..30,tag=zselected] UUID
execute as @e[type=minecraft:zombified_piglin] at @s if entity @p[distance=0..30,tag=zselected] run data merge entity @s {AngerTime:500} 
