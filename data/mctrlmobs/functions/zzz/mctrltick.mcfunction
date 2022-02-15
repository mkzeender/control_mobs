function mctrlmobs:zzz/select_controlled_mob

# Exit Button
execute unless entity @s[nbt={Inventory:[{Slot:8b,id:"minecraft:warped_fungus_on_a_stick"}]}] unless entity @s[tag=imadragon] run function mctrlmobs:zzz/inventory/drop/hotbar.8
execute unless entity @s[nbt={Inventory:[{Slot:8b,id:"minecraft:warped_fungus_on_a_stick"}]}] unless entity @s[tag=imadragon] run item replace entity @s hotbar.8 with minecraft:warped_fungus_on_a_stick{display:{Name:'[{"text":"Exit Mob","bold":true}]'},CustomTags:["mctrlmobs.illegal"]} 1


# Mainhand weapon
execute unless entity @s[nbt={Inventory:[{Slot:0b,tag:{CustomTags:["mctrlmobs.weapon.mainhand"]}}]}] if entity @e[tag=iscontrolled,nbt={HandItems:[{Count:1b},{}]}] run function mctrlmobs:zzz/inventory/drop/hotbar.0
execute unless entity @s[nbt={Inventory:[{Slot:0b,tag:{CustomTags:["mctrlmobs.weapon.mainhand"]}}]}] if entity @e[tag=iscontrolled,nbt={HandItems:[{Count:1b},{}]}] run item replace entity @s hotbar.0 from entity @e[tag=iscontrolled,limit=1] weapon.mainhand mctrlmobs:set_weapon_data


#Armor (except for helmet unfortunately)
execute unless entity @s[nbt={Inventory:[{Slot:100b}]}] run item replace entity @s armor.feet from entity @e[tag=iscontrolled,limit=1] armor.feet mctrlmobs:set_armor_data
execute unless entity @s[nbt={Inventory:[{Slot:101b}]}] run item replace entity @s armor.legs from entity @e[tag=iscontrolled,limit=1] armor.legs mctrlmobs:set_armor_data
execute unless entity @s[nbt={Inventory:[{Slot:102b}]}] run item replace entity @s armor.chest from entity @e[tag=iscontrolled,limit=1] armor.chest mctrlmobs:set_armor_data


# Arrows
execute if entity @s[nbt={SelectedItem:{id:"minecraft:bow"}}     ] unless entity @s[nbt={Inventory:[{Slot:17b,id:"minecraft:arrow"}]}] run function mctrlmobs:zzz/inventory/drop/inventory.8
execute if entity @s[nbt={SelectedItem:{id:"minecraft:crossbow"}}] unless entity @s[nbt={Inventory:[{Slot:17b,id:"minecraft:arrow"}]}] run function mctrlmobs:zzz/inventory/drop/inventory.8

execute if entity @s[nbt={SelectedItem:{id:"minecraft:bow"}}     ] unless entity @s[nbt={Inventory:[{Slot:17b,id:"minecraft:arrow"}]}] run item replace entity @s inventory.8 with arrow{Unbreakable:1b,CustomTags:["mctrlmobs.illegal"]}
execute if entity @s[nbt={SelectedItem:{id:"minecraft:crossbow"}}] unless entity @s[nbt={Inventory:[{Slot:17b,id:"minecraft:arrow"}]}] run item replace entity @s inventory.8 with arrow{Unbreakable:1b,CustomTags:["mctrlmobs.illegal"]}


# Burning (for fire-aspect looting)
#set certain mob properties
data modify entity @e[tag=iscontrolled,limit=1] Fire set from entity @s Fire


#--------------------------depending on what entity the player is controlling, do these things each tick----------------------

#convert arrows to infinity arrows
execute as @e[type=#minecraft:arrows,distance=0..2] run data merge entity @s {pickup:0b}
#convert tridents to infinity tridents
execute as @e[type=minecraft:trident,nbt={Trident:{tag:{CustomTags:["mctrlmobs.illegal"]}}}] run data merge entity @s {pickup:0b}



#blaze fireball cooldown of 5 seconds
execute if entity @e[tag=iscontrolled,type=blaze] if entity @s[scores={mctrlmobs.itemcooldown=0}] unless entity @s[nbt={Inventory:[{id:"minecraft:snowball"}]}] run scoreboard players set @s mctrlmobs.itemcooldown 200
execute if entity @e[tag=iscontrolled,type=blaze] if entity @s[scores={mctrlmobs.itemcooldown=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:snowball"}]}] run function mctrlmobs:zzz/inventory/drop/hotbar.0
execute if entity @e[tag=iscontrolled,type=blaze] if entity @s[scores={mctrlmobs.itemcooldown=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:snowball"}]}] run item replace entity @s hotbar.0 with minecraft:snowball{display:{Name:'[{"text":"Blaze Fireball","italic":false}]'},CustomTags:["mctrlmobs.illegal"]} 3

#dolphin
execute if entity @e[tag=iscontrolled,type=minecraft:dolphin] run effect give @a[distance=0.1..10] minecraft:dolphins_grace 5 0

#evoker tick
execute unless entity @s[nbt={Inventory:[{Slot:1b,id:"minecraft:carrot_on_a_stick"}]}] if entity @e[tag=iscontrolled,type=minecraft:evoker] run function mctrlmobs:zzz/inventory/drop/hotbar.1
execute unless entity @s[nbt={Inventory:[{Slot:1b,id:"minecraft:carrot_on_a_stick"}]}] if entity @e[tag=iscontrolled,type=minecraft:evoker] run item replace entity @s hotbar.1 with minecraft:carrot_on_a_stick{display:{Name:'[{"text":"Evoker Fangs"}]'},CustomTags:["mctrlmobs.illegal"]} 1


#llama tick
execute if entity @s[tag=imallama] unless entity @s[nbt={Inventory:[{id:"minecraft:snowball"}]}] run give @s minecraft:snowball{display:{Name:'[{"text":"Llama Spit","italic":false}]'},CustomTags:["mctrlmobs.illegal"]}


#piglin
execute if entity @e[tag=iscontrolled,type=piglin] run function mctrlmobs:zzz/piglin/tick

#pillager

execute unless entity @s[nbt={Inventory:[{Slot:7b,id:"minecraft:arrow"}]}] if entity @e[tag=iscontrolled,type=minecraft:pillager] run function mctrlmobs:zzz/inventory/drop/hotbar.7
execute unless entity @s[nbt={Inventory:[{Slot:7b,id:"minecraft:arrow"}]}] if entity @e[tag=iscontrolled,type=minecraft:pillager] run item replace entity @s hotbar.7 with arrow{Unbreakable:1b,CustomTags:["mctrlmobs.illegal"]}

# reset wither invulnerability
execute if entity @s[tag=witherstarted] run data merge entity @e[type=wither,tag=iscontrolled,limit=1] {Invul:0}

#ghast tick
execute if entity @e[tag=iscontrolled,type=ghast] if entity @e[type=fireball,distance=0..2] run summon minecraft:creeper ~ ~ ~ {Fuse:0,ignited:1,CustomName:'"Ghast"'}
execute if entity @e[tag=iscontrolled,type=ghast] run kill @e[type=fireball,distance=0..2]
#ghast fireball cooldown of 5 seconds
execute if entity @e[tag=iscontrolled,type=ghast] if entity @s[scores={mctrlmobs.itemcooldown=0}] unless entity @s[nbt={Inventory:[{id:"minecraft:snowball"}]}] run scoreboard players set @s mctrlmobs.itemcooldown 100
execute if entity @e[tag=iscontrolled,type=ghast] if entity @s[scores={mctrlmobs.itemcooldown=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:snowball"}]}] run function mctrlmobs:zzz/inventory/drop/hotbar.0
execute if entity @e[tag=iscontrolled,type=ghast] if entity @s[scores={mctrlmobs.itemcooldown=1}] unless entity @s[nbt={Inventory:[{id:"minecraft:snowball"}]}] run item replace entity @s hotbar.0 with minecraft:snowball{display:{Name:'[{"text":"Ghast Fireball","italic":false}]'},CustomTags:["mctrlmobs.illegal"]}

#strays
execute if entity @e[tag=iscontrolled,type=stray] unless entity @s[nbt={Inventory:[{id:"minecraft:tipped_arrow"}]}] run function mctrlmobs:zzz/inventory/drop/inventory.7
execute if entity @e[tag=iscontrolled,type=stray] unless entity @s[nbt={Inventory:[{id:"minecraft:tipped_arrow"}]}] run item replace entity @s inventory.7 with tipped_arrow{CustomTags:["mctrlmobs.illegal"],CustomPotionColor:11594239,display:{Name:'[{"text":"Arrow of Slowness","italic":false}]'},CustomPotionEffects:[{Id:2,Duration:140,Amplifier:0}]}
