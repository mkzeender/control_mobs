# runs as anyone who caused a vibration near a warden

effect give @s darkness 12
effect give @s glowing 4 0 true

particle minecraft:dust 0.5 0.5 1 1 ^ ^ ^ 1 1 1 10 10 force @a

playsound minecraft:block.sculk_sensor.clicking player @a ~ ~ ~ 1