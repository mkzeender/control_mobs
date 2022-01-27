scoreboard players reset @s mctrdeathcounter
scoreboard players set @s mctrdeathtick 0


tp @s[tag=ctrlmobs] @p[tag=!ctrlmobs]

execute as @s[tag=ctrlmobs] run kill @e[x=0,y=-74,z=0,dx=1,dy=1,dz=1]
execute as @s[tag=ctrlmobs] run gamemode spectator