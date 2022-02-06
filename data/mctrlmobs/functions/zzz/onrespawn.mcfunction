scoreboard players reset @s mctrdeathcounter
scoreboard players set @s mctrdeathtick 0


tp @s[tag=ctrlmobs] @p[tag=!ctrlmobs]

# if keepinventory is on, still clear player's illegal items
execute as @s[tag=wasamob] run clear @s player_head
execute as @s[tag=wasamob] run function mctrlmobs:zzz/inventory/dropinventory
execute as @s[tag=wasamob] run tag @s remove wasamob