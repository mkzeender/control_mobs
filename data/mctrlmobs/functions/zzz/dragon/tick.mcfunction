

execute as @e[tag=dragonhost] at @s run fill ~2 ~-5 ~2 ~-2 ~-5 ~-2 air replace minecraft:end_portal


bossbar set mctrlmobs:ender_dragon players @a
execute store result bossbar mctrlmobs:ender_dragon value run data get entity @s Health


scoreboard players add @s dragontick 1
scoreboard players set @s moperator 20
scoreboard players operation @s dragonsecond = @s dragoncountdown
scoreboard players operation @s dragonsecond -= @s dragontick
scoreboard players operation @s dragonsecond /= @s moperator




# CIRCLING STATE
execute if entity @s[tag=circling,scores={dragonsecond=0..}] run title @s actionbar {"text":"You need to perch in ", "extra":[{"score":{"name":"@s","objective":"dragonsecond"}}, " seconds."]}

execute if entity @s[tag=circling,scores={dragonsecond=..0}] run title @s actionbar "You need to perch now!"
execute if entity @s[tag=circling,scores={dragonsecond=1}] run effect give @s poison 100000 0

#transition to perching

execute if entity @s[tag=circling,scores={dragonsecond=..60}] if entity @e[tag=dragonhost,distance=0..5] run tag @s add transitioning
execute if entity @s[tag=transitioning] run scoreboard players set @s dragontick 0
execute if entity @s[tag=transitioning] run scoreboard players set @s dragonsecond 15
execute if entity @s[tag=transitioning] run scoreboard players set @s dragoncountdown 300
execute if entity @s[tag=transitioning] run tag @s add perching
execute if entity @s[tag=transitioning] run tag @s remove circling

tag @s remove transitioning

# PERCHING STATE

tp @s[tag=perching,scores={dragonsecond=0..}] @e[tag=dragonhost,distance=1.1..100,limit=1]
effect clear @s[tag=perching] minecraft:poison

execute if entity @s[tag=perching,scores={dragonsecond=0..}] run title @s actionbar {"text":"Recharging for ", "extra":[{"score":{"name":"@s","objective":"dragonsecond"}}, " more seconds."]}



#transition to charging
execute if entity @s[tag=perching,scores={dragonsecond=..0}] run title @s actionbar "CHARGE!!!"

execute if entity @s[tag=perching,scores={dragonsecond=..0}] if entity @e[tag=dragonhost,distance=1.5..100] run tag @s add transitioning
execute if entity @s[tag=transitioning] run scoreboard players set @s dragontick 0
execute if entity @s[tag=transitioning] run scoreboard players set @s dragonsecond 20
execute if entity @s[tag=transitioning] run scoreboard players set @s dragoncountdown 400
execute if entity @s[tag=transitioning] run tag @s add charging
execute if entity @s[tag=transitioning] run tag @s remove perching

tag @s remove transitioning




# CHARGING STATE

execute if entity @s[tag=charging] run effect give @e[distance=0.1..3] minecraft:levitation 1 35 true
execute if entity @s[tag=charging,scores={dragonsecond=0..}] run title @s actionbar {"text":"Charge attack lasts ", "extra":[{"score":{"name":"@s","objective":"dragonsecond"}}, " more seconds."]}

#transition back to circling

execute if entity @s[tag=charging,scores={dragonsecond=..0}] run tag @s add transitioning
execute if entity @s[tag=transitioning] run tag @s add circling
execute if entity @s[tag=transitioning] run tag @s remove charging
execute if entity @s[tag=transitioning] run scoreboard players set @s dragontick 0
execute if entity @s[tag=transitioning] run scoreboard players set @s dragonsecond 120
execute if entity @s[tag=transitioning] run scoreboard players set @s dragoncountdown 2400
execute if entity @s[tag=transitioning] at @e[type=end_crystal,distance=0..100] run scoreboard players add @s dragoncountdown 400


tag @s remove transitioning



# BLOCK BREAKING

execute positioned ~-1 ~-1 ~-1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air
execute positioned ~-1 ~-1 ~0 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air
execute positioned ~-1 ~-1 ~1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air
execute positioned ~-1 ~0 ~-1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air
execute positioned ~-1 ~0 ~0 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air
execute positioned ~-1 ~0 ~1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air
execute positioned ~-1 ~1 ~-1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air
execute positioned ~-1 ~1 ~0 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air
execute positioned ~-1 ~1 ~1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air
execute positioned ~0 ~-1 ~-1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~0 ~-1 ~0 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~0 ~-1 ~1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~0 ~0 ~-1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~0 ~0 ~0 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~0 ~0 ~1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~0 ~1 ~-1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~0 ~1 ~0 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~0 ~1 ~1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~1 ~-1 ~-1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~1 ~-1 ~0 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~1 ~-1 ~1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~1 ~0 ~-1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~1 ~0 ~0 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~1 ~0 ~1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~1 ~1 ~-1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~1 ~1 ~0 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
execute positioned ~1 ~1 ~1 unless block ~ ~ ~ #minecraft:dragon_immune run setblock ~ ~ ~ air 
