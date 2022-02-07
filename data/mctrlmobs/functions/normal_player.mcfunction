function mctrlmobs:zzz/leave
gamemode survival
tag @s remove ctrlmobs
attribute @s minecraft:generic.max_health base set 20
attribute @s minecraft:generic.attack_damage base set 1
effect give @s instant_health 5 100 true
effect give @s saturation 5 100 true