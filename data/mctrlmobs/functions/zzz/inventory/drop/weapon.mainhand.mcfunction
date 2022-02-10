
tag @e remove mselected
execute if entity @s[nbt={SelectedItem:{}}] unless entity @s[nbt={SelectedItem:{tag:{CustomTags:["mctrlmobs.illegal"]}}}] run summon item ~ ~ ~ {Tags:["mselected"],Item:{Count:1b,id:"minecraft:bedrock"}}
data modify entity @e[tag=mselected,limit=1] Item set from entity @s SelectedItem
item replace entity @s weapon.mainhand with minecraft:air
    