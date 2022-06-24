playsound minecraft:entity.warden.heartbeat hostile @a[distance=0..50] ~ ~ ~

execute at @p[tag=!imawarden] if entity @s[distance=0.1..] run scoreboard players add @s mctrlmobs.tick.sound.warden 10
execute at @p[tag=!imawarden] if entity @s[distance=10.. ] run scoreboard players add @s mctrlmobs.tick.sound.warden 10
execute at @p[tag=!imawarden] if entity @s[distance=15.. ] run scoreboard players add @s mctrlmobs.tick.sound.warden 10
execute at @p[tag=!imawarden] if entity @s[distance=20.. ] run scoreboard players add @s mctrlmobs.tick.sound.warden 15
execute at @p[tag=!imawarden] if entity @s[distance=25.. ] run scoreboard players add @s mctrlmobs.tick.sound.warden 20
execute at @p[tag=!imawarden] if entity @s[distance=30.. ] run scoreboard players add @s mctrlmobs.tick.sound.warden 25
execute unless entity @p[tag=!imawarden] run scoreboard players add @s mctrlmobs.tick.sound.warden 100
