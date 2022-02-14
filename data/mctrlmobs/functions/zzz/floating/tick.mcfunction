#if the player crouches, go down
execute anchored eyes positioned ^ ^ ^ if entity @s[distance=1..1.5] run effect clear @s levitation




# Ascend Button
execute unless entity @s[nbt={Inventory:[{Slot:1b,id:"minecraft:carrot_on_a_stick"}]}] run function mctrlmobs:zzz/inventory/drop/hotbar.1
execute unless entity @s[nbt={Inventory:[{Slot:1b,id:"minecraft:carrot_on_a_stick"}]}] run item replace entity @s hotbar.1 with minecraft:carrot_on_a_stick{display:{Name:'[{"text":"Ascend","bold":true}]'},CustomTags:["mctrlmobs.illegal"]}
