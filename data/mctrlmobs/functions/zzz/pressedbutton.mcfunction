scoreboard players set @s pressedbutton 0

function mctrlmobs:zzz/select_controlled_mob

#--------------------------------- RUNS WHEN THE PLAYER RIGHT CLICKS THE CARROT ON A STICK

execute if entity @s[tag=imfloating] run effect give @s minecraft:levitation 1 4 true
execute if entity @s[tag=imfloating] run effect give @s minecraft:levitation 20 0 true

execute if entity @s[tag=imanenderman] at @s anchored eyes positioned ^ ^ ^5 run function mctrlmobs:zzz/enderman/raycast



tag @s[tag=imacreeper] add imablow
tag @s[tag=imacreeper,scores={creepertick=..-1}] remove imablow
scoreboard players set @s[tag=imacreeper,tag=!imablow] creepertick 0
scoreboard players set @s[tag=imacreeper,tag=imablow] creepertick -30
execute if entity @s[tag=imacreeper,tag=imablow] run playsound minecraft:entity.creeper.primed hostile @a ~ ~ ~

effect give @s[tag=imablow] minecraft:slowness 2 3 true



execute if entity @s[tag=imanevoker] rotated as @s rotated ~ 0 run summon minecraft:evoker_fangs ^ ^ ^2
execute if entity @s[tag=imanevoker] rotated as @s rotated ~ 0 run summon minecraft:evoker_fangs ^ ^ ^3
execute if entity @s[tag=imanevoker] rotated as @s rotated ~ 0 run summon minecraft:evoker_fangs ^ ^ ^4
execute if entity @s[tag=imanevoker] rotated as @s rotated ~ 0 run summon minecraft:evoker_fangs ^ ^ ^5
execute if entity @s[tag=imanevoker] rotated as @s rotated ~ 0 run summon minecraft:evoker_fangs ^ ^ ^6