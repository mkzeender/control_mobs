tag @s add imaguardian
function mctrlmobs:zzz/inventory/drop/armor.chest
item replace entity @s armor.chest with leather_chestplate{CustomTags:["mctrlmobs.illegal"],Unbreakable:1b,Enchantments:[{id:"minecraft:thorns",lvl:6},{id:"unbreaking",lvl:3}]}


give @s trident{CustomTags:["mctrlmobs.illegal"],Enchantments:[{id:"loyalty",lvl:3}]}
