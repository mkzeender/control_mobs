function mctrlmobs:zzz/select_controlled_mob

#don't update the mob's health
#execute store result score @s mmobhealth run data get entity @e[tag=iscontrolled,limit=1] Health
scoreboard players reset @s mhealed

function mctrlmobs:zzz/leave

# re-enter the mob
execute if entity @s[gamemode=spectator] if entity @e[tag=iscontrolled,distance=0..5,limit=1] run tellraw @s {"color": "yellow", "text": "Re-entering the mob..."}
execute if entity @s[gamemode=spectator] unless entity @e[tag=iscontrolled,distance=0..5,limit=1] run tellraw @s {"color": "red", "text": "Failed to re-enter mob"}
execute if entity @s[gamemode=spectator] run spectate @e[tag=iscontrolled,distance=0..5,limit=1]
