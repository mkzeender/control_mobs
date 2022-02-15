scoreboard players set @s pressedleave 0



#drop inventory onto ground
execute at @s[tag=!imahypnotizer] run function mctrlmobs:zzz/inventory/drop/all


# go back into spectator
gamemode spectator

team leave @s

function mctrlmobs:zzz/select_controlled_mob

# move the old entity back here

tp @e[tag=iscontrolled] @s
execute as @e[tag=iscontrolled] run data merge entity @s {PersistenceRequired:false,NoAI:false,Invulnerable:false}

# set the mob's health to your health, as long as it's properly set
data modify entity @e[tag=iscontrolled,limit=1] Health set from entity @s[scores={mhealed=1}] Health




tag @e[tag=iscontrolled] remove savedforlater



# move so as to not accidentally enter the entity again
tp ~ ~0.5 ~

effect clear @s


#if you entered from survival mode:
gamemode survival @s[tag=imahypnotizer]
execute if entity @s[tag=imahypnotizer] run function mctrlmobs:zzz/reset_attributes
execute if entity @s[tag=imahypnotizer] at @s run function mctrlmobs:zzz/inventory/clear_illegal_items
execute if entity @s[tag=imahypnotizer] run effect give @s resistance 1 4 true


#end certain special abilities
function mctrlmobs:zzz/removetags