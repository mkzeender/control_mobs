execute as @s[tag=imamob] at @s run function mctrlmobs:zzz/leave

tp ~ ~ ~


tag @s[tag=!ctrlmobs] add imahypnotizer
function mctrlmobs:zzz/enter

# give slight health boost
scoreboard players add @s mmobhealth 1
scoreboard players operation @s mmobhealth < @s mmaxhealth