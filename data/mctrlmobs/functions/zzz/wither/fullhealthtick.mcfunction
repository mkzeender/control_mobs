execute unless entity @s[nbt={Inventory:[{Slot:102b,id:"minecraft:leather_chestplate"}]}] run function mctrlmobs:zzz/inventory/drop/armor.chest
execute unless entity @s[nbt={Inventory:[{Slot:102b,id:"minecraft:leather_chestplate"}]}] run item replace entity @s armor.chest with leather_chestplate{Unbreakable:1b,CustomTags:["mctrlmobs.illegal"],Enchantments:[{id:"blast_protection",lvl:20}],AttributeModifiers:[{AttributeName:"generic.armor",Slot:"chest",Amount:-20,Name:"generic.armor",UUID:[I;-122022,4608,14262,-9216]}]}

tag @s add imfloating