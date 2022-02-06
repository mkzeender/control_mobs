#test for valid blocks
data modify storage mctrlmobs:vars SuccessLevel set value 0
execute store success storage mctrlmobs:vars SuccessLevel byte 1 if block ~ ~-1 ~ #mctrlmobs:standable_on if block ~ ~ ~ #mctrlmobs:standable_in if block ~ ~1 ~ #mctrlmobs:standable_in if block ~ ~2 ~ #mctrlmobs:standable_in unless block ~ ~ ~ #mctrlmobs:water unless block ~ ~1 ~ #mctrlmobs:water



#tp to center of block, play sound and show particles at source and destingation
execute if data storage mctrlmobs:vars {SuccessLevel:1b} at @s anchored eyes run particle minecraft:portal ^ ^ ^ 0.1 0.1 0.1 0.5 100 force

execute if data storage mctrlmobs:vars {SuccessLevel:1b} align xyz run tp @s ~0.5 ~ ~0.5

execute if data storage mctrlmobs:vars {SuccessLevel:1b} at @s anchored eyes run particle minecraft:portal ^ ^ ^ 0.1 0.1 0.1 0.5 100 force
execute if data storage mctrlmobs:vars {SuccessLevel:1b} run playsound minecraft:entity.enderman.teleport hostile @a ~ ~ ~ 1




#continue raycast otherwise
execute unless data storage mctrlmobs:vars {SuccessLevel:1b} unless entity @s[distance=0..100] positioned ^ ^ ^0.5 run tellraw @s {"color":"red", "text": "Could not find valid teleporting location"}
execute unless data storage mctrlmobs:vars {SuccessLevel:1b} if entity @s[distance=0..100] positioned ^ ^ ^0.5 run function mctrlmobs:zzz/enderman/raycast