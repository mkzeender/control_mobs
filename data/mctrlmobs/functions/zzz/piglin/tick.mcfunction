execute if entity @e[tag=iscontrolled,limit=1,nbt={HandItems:[{}, {id:"minecraft:gold_ingot"}]}] run give @s gold_ingot
item replace entity @e[tag=iscontrolled,limit=1,nbt={HandItems:[{}, {id:"minecraft:gold_ingot"}]}] weapon.offhand with air



execute if entity @s[scores={mctrlmobs.itemcooldown=0},nbt={Inventory:[{id:"minecraft:gold_ingot"}]}] if entity @p[tag=!imamob,gamemode=!spectator,distance=0..15] run function mctrlmobs:zzz/piglin/trade_item

