execute if entity @s[scores={mhealth=0..150},tag=witherstarted] run function mctrlmobs:zzz/wither/halfhealthtick

#make sure to charge health before doing half-health tick
tag @s[scores={mhealth=151..}] add witherstarted


# bossbar
bossbar set mctrlmobs:wither name {"selector":"@s"}
bossbar set mctrlmobs:wither players @a
execute store result bossbar mctrlmobs:wither value run data get entity @s Health


# two second block attack
scoreboard players add @s withertick 1
execute if entity @s[scores={withertick=60..}] positioned ~ ~1 ~ run function mctrlmobs:zzz/wither/break_blocks
execute if entity @s[scores={withertick=60..}] run scoreboard players set @s withertick 0