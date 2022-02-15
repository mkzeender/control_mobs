
#advancements
advancement grant @s only mctrlmobs:challenges/root



tag @e[tag=iscontrolled] remove iscontrolled

tag @e[distance=0,limit=1,type=#mctrlmobs:allmobs,type=!ender_dragon] add iscontrolled
tag @e[tag=iscontrolled] add savedforlater

scoreboard players operation @e[tag=iscontrolled] muserid = @s muserid






tag @s add imamob


gamemode adventure



data merge entity @e[tag=iscontrolled,limit=1] {PersistenceRequired:true,NoAI:true,Invulnerable:true}
tp @e[tag=iscontrolled] 0 500 0



# setting health
execute store result score @s mmobhealth run data get entity @e[tag=iscontrolled,limit=1] Health
execute store result score @s mmaxhealth run attribute @e[tag=iscontrolled,limit=1] minecraft:generic.max_health get
scoreboard players reset @s mhealed


# -----------------------------------------------creating mob-head------------------------------------------------------------
setblock 1 0 1 chest
item replace block 1 0 1 container.0 with minecraft:player_head
function mctrlmobs:zzz/aesthetic/set_head

data modify block 1 0 1 Items[{Slot:0b}].tag merge value {AttributeModifiers:[],display:{Name:'{"color":"light_purple","text":"Mob Head of Life"}'},CustomTags:["mctrlmobs.illegal"],Enchantments:[{id:"minecraft:binding_curse",lvl:1}]}


# copy max health from mob to mob-head
data modify block 1 0 1 Items[{Slot:0b}].tag.AttributeModifiers append value {AttributeName:"generic.max_health",Amount:1.0,Operation:0,Slot:head,Name:"generic.max_health",UUID:[I;-122025,16485,20217,-32970]}
execute store result block 1 0 1 Items[{Slot:0b}].tag.AttributeModifiers[{UUID:[I;-122025,16485,20217,-32970]}].Amount double 1 run attribute @e[tag=iscontrolled,limit=1] minecraft:generic.max_health get

# copy attack strength
data modify block 1 0 1 Items[{Slot:0b}].tag.AttributeModifiers append value {AttributeName:"generic.attack_damage",Amount:1.0,Operation:0,Slot:head,Name:"generic.attack_damage",UUID:[I;-122025,16485,20218,-32970]}
execute store result block 1 0 1 Items[{Slot:0b}].tag.AttributeModifiers[{UUID:[I;-122025,16485,20218,-32970]}].Amount double 0.5 run attribute @e[tag=iscontrolled,limit=1] minecraft:generic.attack_damage base get

# copy inherent_armor
data modify block 1 0 1 Items[{Slot:0b}].tag.AttributeModifiers append value {AttributeName:"generic.armor",Amount:1.0,Operation:0,Slot:head,Name:"generic.attack_damage",UUID:[I;-122025,16485,20219,-32970]}
execute store result block 1 0 1 Items[{Slot:0b}].tag.AttributeModifiers[{UUID:[I;-122025,16485,20219,-32970]}].Amount double 1.0 run attribute @e[tag=iscontrolled,limit=1] minecraft:generic.armor base get


function mctrlmobs:zzz/inventory/drop/armor.head
item replace entity @s armor.head from block 1 0 1 container.0
data remove block 1 0 1 Items[{Slot:0b}]
setblock 1 0 1 bedrock
attribute @s minecraft:generic.max_health base set 0





#----------------------------------------------- categories of entities----------------------------------------------

execute if entity @e[tag=iscontrolled,type=#mctrlmobs:allmonsters] run tag @s add imamonster

execute if entity @e[tag=iscontrolled,type=#mctrlmobs:sunburned] run tag @s add imsunburned
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:floating] run function mctrlmobs:zzz/floating/enter
execute if entity @e[tag=iscontrolled,type=!#mctrlmobs:melee] run effect give @s weakness 100000 2 true
#execute if entity @e[tag=iscontrolled,type=!#mctrlmobs:melee_strong] run attribute @s minecraft:generic.attack_damage base set 1
#execute if entity @e[tag=iscontrolled,type=#mctrlmobs:melee_strong] run attribute @s minecraft:generic.attack_damage base set 3
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:fire_resistant] run effect give @s fire_resistance 100000 0 true
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:aquatic] run effect give @s minecraft:conduit_power 100000 0 true
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:aquatic] run tag @s add imaquatic
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:hydrophobic] run tag @s add imhydrophobic
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:wither_immune] run tag @s add idontwither
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:overworldophobic] run tag @s add imoverworldophobic
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:nocturnal] run effect give @s night_vision 100000 0 true
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:poisonous] run tag @s add impoisonous
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:witherers] run tag @s add imawitherer

# slime and magma_cube
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:cube_mobs,nbt={Size:0}] run effect give @s weakness 100000 0 true

execute if entity @e[tag=iscontrolled,type=#mctrlmobs:cube_mobs,nbt={Size:3}] run effect give @s strength 100000 0 true
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:cube_mobs,nbt={Size:3}] run effect give @s jump_boost 100000 3 true
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:cube_mobs] run effect give @s slowness 100000 3 true





# mobs dont attack their own team
team leave @s
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:ignored_by_hostiles] run team join ctrlmobs
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:piglinteam] run team join ctrlpiglins



# pillagers

execute if entity @e[tag=iscontrolled,type=minecraft:evoker] run gamemode survival
execute if entity @e[tag=iscontrolled,type=minecraft:evoker] run tag @s add imanevoker



execute if entity @e[tag=iscontrolled,type=minecraft:ravager] run effect give @s minecraft:slowness 100000 0 true
execute if entity @e[tag=iscontrolled,type=minecraft:ravager] run give @s stick{CustomTags:["mctrlmobs.illegal"],display:{Name:'[{"text":"Ravager Horn","italic":false}]'},Enchantments:[{id:knockback,lvl:2}]} 1







# ----------------------------------------------individual entities----------------------------------------------------------

execute if entity @e[tag=iscontrolled,type=minecraft:blaze] run scoreboard players set @s mctrlmobs.itemcooldown 75
execute if entity @e[tag=iscontrolled,type=minecraft:blaze] run tag @s add imablaze

execute if entity @e[tag=iscontrolled,type=minecraft:chicken] run effect give @s slow_falling 100000 0 true


execute if entity @e[tag=iscontrolled,type=minecraft:creeper] run function mctrlmobs:zzz/inventory/drop/hotbar.1
execute if entity @e[tag=iscontrolled,type=minecraft:creeper] run item replace entity @s hotbar.1 with minecraft:carrot_on_a_stick{CustomTags:["mctrlmobs.illegal"],display:{Name:'[{"text":"BOOM! (or cancel boom)"}]'}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:creeper] run tag @s add imacreeper

execute if entity @e[tag=iscontrolled,type=minecraft:dolphin] run effect give @s minecraft:dolphins_grace 1000000 0 true





execute if entity @e[tag=iscontrolled,type=minecraft:guardian      ] run function mctrlmobs:zzz/guardian/enter
execute if entity @e[tag=iscontrolled,type=minecraft:elder_guardian] run function mctrlmobs:zzz/guardian/enter
execute if entity @e[tag=iscontrolled,type=minecraft:elder_guardian] run tag @s add imanelder


execute if entity @e[tag=iscontrolled,type=minecraft:goat] run give @s stick{Enchantments:[{id:"knockback",lvl:4}],display:{Name:'{"text":"Super Goat Knockback Stick"}'},CustomTags:["mctrlmobs.illegal"]}

execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run give @s stick{display:{Name:'[{"text":"Hoglin Tusk","italic":false}]'},CustomTags:["mctrlmobs.illegal"],Enchantments:[{id:knockback,lvl:2}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run effect give @s minecraft:mining_fatigue 100000 7 true


execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run effect give @s minecraft:slowness 100000 1 true
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run effect give @s minecraft:mining_fatigue 100000 8 true
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run give @s stick{display:{Name:'[{"text":"Super Golem Knockback Stick","italic":false}]'},CustomTags:["mctrlmobs.illegal"],Enchantments:[{id:knockback,lvl:4}]} 1


execute if entity @e[tag=iscontrolled,type=minecraft:llama       ] run tag @s add imallama
execute if entity @e[tag=iscontrolled,type=minecraft:trader_llama] run tag @s add imallama


execute if entity @e[tag=iscontrolled,type=minecraft:piglin      ] run tag @s add imapiglin
execute if entity @e[tag=iscontrolled,type=minecraft:piglin_brute] run tag @s add imapiglin


execute if entity @e[tag=iscontrolled,type=minecraft:spider     ] run tag @s add imaspider
execute if entity @e[tag=iscontrolled,type=minecraft:cave_spider] run tag @s add imaspider




execute if entity @e[tag=iscontrolled,type=minecraft:zombified_piglin] run tag @s add imazpiglin



execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run scoreboard players set @s mctrlmobs.itemcooldown 1
execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run tag @s add imaghast





execute if entity @e[tag=iscontrolled,type=minecraft:enderman] run give @s minecraft:carrot_on_a_stick{display:{Name:'[{"text":"Teleport"}]'},CustomTags:["mctrlmobs.illegal"]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:enderman] run gamemode survival
execute if entity @e[tag=iscontrolled,type=minecraft:enderman] run tag @s add imanenderman


execute if entity @e[tag=iscontrolled,type=minecraft:witch       ] run give @s minecraft:potion{CustomTags:["mctrlmobs.illegal"],Potion:"minecraft:water",CustomPotionEffects:[{Id:10,Amplifier:1,Duration:1200}],display:{Name:"\"Regeneration\""}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:witch] run give @s minecraft:splash_potion{CustomTags:["mctrlmobs.illegal"],Potion:"minecraft:water",CustomPotionEffects:[{Id:18,Duration:1200}],display:{Name:"\"Weakness\""}} 2
execute if entity @e[tag=iscontrolled,type=minecraft:witch] run give @s minecraft:splash_potion{CustomTags:["mctrlmobs.illegal"],Potion:"minecraft:water",CustomPotionEffects:[{Id:7}],display:{Name:"\"Instant Damage\""}} 2
execute if entity @e[tag=iscontrolled,type=minecraft:witch] run give @s minecraft:splash_potion{CustomTags:["mctrlmobs.illegal"],Potion:"minecraft:water",CustomPotionEffects:[{Id:19,Duration:1200}],display:{Name:"\"Poison\""}} 10


execute if entity @e[tag=iscontrolled,type=minecraft:wither] run function mctrlmobs:zzz/wither/enter


# 1-second invulnerability if needed to fill up the player's health
execute if score @s mmobhealth > @s mhealth run effect give @s minecraft:resistance 1 4 true

# announce the player's transition
title @a actionbar [{"selector":"@s"}, {"color":"yellow", "text":" is now a "}, {"selector":"@e[tag=iscontrolled]"}]
tellraw @a [{"selector":"@s"}, {"color":"yellow", "text":" is now a "}, {"selector":"@e[tag=iscontrolled]"}]


