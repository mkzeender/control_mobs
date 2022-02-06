scoreboard players set @s pressedleave 0



#drop inventory onto ground
clear @s player_head
execute at @s run function mctrlmobs:zzz/inventory/dropinventory
clear

# go back into spectator
gamemode spectator

team leave @s

tag @e[tag=mselected] remove mselected
tag @e[tag=zselected] remove zselected

tag @s add zselected


# move the old entity back here
execute as @e[tag=savedforlater] if score @p[tag=zselected] muserid = @s muserid run tag @s add mselected
tp @e[tag=mselected] @s
execute as @e[tag=mselected] run data merge entity @s {PersistenceRequired:false,NoAI:false,Invulnerable:false}

# set the mob's health to your health, as long as it's properly set
data modify entity @e[tag=mselected,limit=1] Health set from entity @s[scores={mhealed=1}] Health


#set certain mob properties
data modify entity @e[tag=mselected,limit=1] Fire set from entity @s[scores={mhealed=1}] Fire



tag @e[tag=mselected] remove savedforlater



# move so as to not accidentally enter the entity again
tp ~ ~0.5 ~

effect clear @s


#if you entered from survival mode:
gamemode survival @s[tag=imahypnotizer]
execute if entity @s[tag=imahypnotizer] run attribute @s minecraft:generic.max_health base set 20

#end certain special abilities
function mctrlmobs:zzz/removetags