execute unless entity @s[nbt={Inventory:[{Slot:102b,id:"minecraft:diamond_chestplate"}]}] run item replace entity @s armor.chest with diamond_chestplate{Unbreakable:1b,CustomTags:["mctrlmobs.illegal"],Enchantments:[{id:"projectile_protection",lvl:20},{id:"blast_protection",lvl:20}],AttributeModifiers:[{AttributeName:"generic.knockback_resistance",Slot:"chest",Amount:1000,Name:"generic.knockback_resistance",UUID:[I;-122022,4608,14261,-9216]},{AttributeName:"generic.armor",Slot:"chest",Amount:-20,Name:"generic.armor",UUID:[I;-122022,4608,14262,-9216]}]}

clear @s minecraft:carrot_on_a_stick
effect clear @s levitation

tag @s remove imfloating
