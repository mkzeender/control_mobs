scoreboard players set @s pressedleave 0

# go back into spectator
gamemode spectator
clear

team leave @s

tag @e[tag=mselected] remove mselected
tag @e[tag=zselected] remove zselected

tag @s add zselected


# move the old entity back here
execute as @e[tag=savedforlater] if score @p[tag=zselected] muserid = @s muserid run tag @s add mselected
tp @e[tag=mselected] @s
execute as @e[tag=mselected] run data merge entity @s {PersistenceRequired:false,NoAI:false,Invulnerable:false}

# set the mob's health to your health
data modify entity @e[tag=mselected,limit=1] Health set from entity @s Health


tag @e[tag=mselected] remove savedforlater



# move so as to not accidentally enter the entity again
tp ~ ~0.5 ~

effect clear @s

#end certain special abilities
function mctrlmobs:zzz/removetags