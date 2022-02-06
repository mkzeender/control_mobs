execute as @s[tag=imamob] at @s run function mctrlmobs:zzz/leave

tp ~ ~ ~

execute at @s run function mctrlmobs:zzz/inventory/dropinventory
clear
tag @s[tag=!ctrlmobs] add imahypnotizer
function mctrlmobs:zzz/enter