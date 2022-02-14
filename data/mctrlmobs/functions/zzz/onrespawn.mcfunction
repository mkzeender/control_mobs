scoreboard players reset @s mctrdeathcounter
scoreboard players set @s mctrdeathtick 0


tp @s[tag=ctrlmobs] @p[tag=!ctrlmobs]

# if keepinventory is on, still clear player's illegal items
function mctrlmobs:zzz/inventory/clear_illegal_items