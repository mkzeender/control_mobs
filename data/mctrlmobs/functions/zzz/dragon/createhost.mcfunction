summon marker 0 100 0
execute positioned 0 100 0 run tag @e[type=marker,limit=1,sort=nearest] add dragonhost

execute as @e[tag=dragonhost] at @s run function mctrlmobs:zzz/dragon/placehost