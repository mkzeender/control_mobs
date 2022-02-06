function mctrlmobs:zzz/leave
gamemode survival
tag @s remove ctrlmobs
attribute @s minecraft:generic.max_health base set 20
effect give @s instant_health 5 100 true
effect give @s saturation 5 100 true