execute if score @s mmobhealth > @s mhealth unless entity @s[nbt={ActiveEffects:[{Id:10b,Amplifier:5b}]}] run effect give @s regeneration 100000 5 true
execute if score @s mmobhealth <= @s mhealth run effect clear @s minecraft:regeneration

execute if score @s mmobhealth < @s mhealth run effect give @s poison 1 4 true
execute if score @s mmobhealth >= @s mhealth run effect clear @s poison
execute if score @s mmobhealth = @s mhealth run scoreboard players set @s mhealed 1

scoreboard players operation @s moperand = @s mmobhealth
scoreboard players operation @s moperand -= @s mhealth
execute if score @s[tag=!imawither] moperand matches 17.. run effect give @s instant_health 1 2 true