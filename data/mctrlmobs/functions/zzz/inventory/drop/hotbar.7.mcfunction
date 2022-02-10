
tag @e remove mselected
execute if entity @s[nbt={Inventory:[{Slot:7b}]}] unless entity @s[nbt={Inventory:[{Slot:7b,tag:{CustomTags:["mctrlmobs.illegal"]}}]}] run summon item ~ ~ ~ {Tags:["mselected"],Item:{Count:1b,id:"minecraft:bedrock"}}
data modify entity @e[tag=mselected,limit=1] Item set from entity @s Inventory[{Slot:7b}]
item replace entity @s hotbar.7 with minecraft:air
