recipe take @s mctrlmobs:hypno_stick
advancement revoke @s only mctrlmobs:craft_hypno_stick
clear @s knowledge_book

#conditional crafting
execute if data storage mctrlmobs:options {craft:1b} run function mctrlmobs:get_hypno_item

execute unless data storage mctrlmobs:options {craft:1b} run give @s clock
execute unless data storage mctrlmobs:options {craft:1b} run give @s string

execute unless data storage mctrlmobs:options {craft:1b} run tellraw @s {"color":"red", "text":"You are not permitted to craft that"}