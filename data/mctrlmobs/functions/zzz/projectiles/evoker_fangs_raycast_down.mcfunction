execute unless block ~ ~-1 ~ minecraft:void_air if block ~ ~ ~ #mctrlmobs:standable_on positioned ~ ~1 ~ run function mctrlmobs:zzz/projectiles/evoker_fangs_raycast
execute unless block ~ ~-1 ~ minecraft:void_air unless block ~ ~ ~ #mctrlmobs:standable_on positioned ~ ~-1 ~ unless block ~ ~ ~ #mctrlmobs:standable_on run function mctrlmobs:zzz/projectiles/evoker_fangs_raycast

execute if block ~ ~-1 ~ #mctrlmobs:standable_on unless block ~ ~ ~ #mctrlmobs:standable_on run 