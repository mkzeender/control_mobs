advancement revoke @s only mctrlmobs:causedvibration

execute unless entity @s[tag=imawarden] unless entity @s[gamemode=spectator] if entity @e[tag=imawarden, distance=0..30] anchored eyes positioned ^ ^ ^ unless entity @s[distance=1..1.5] positioned ~ ~ ~ unless block ~ ~ ~ #minecraft:dampens_vibrations unless block ~ ~-1 ~ #minecraft:dampens_vibrations unless block ~ ~-2 ~ #minecraft:dampens_vibrations run function mctrlmobs:zzz/warden/detected_by
