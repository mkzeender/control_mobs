
tag @e[tag=iscontrolled] remove iscontrolled

tag @e[distance=0,limit=1,type=#mctrlmobs:allmobs,type=!ender_dragon] add iscontrolled
tag @e[tag=iscontrolled] add savedforlater

scoreboard players operation @e[tag=iscontrolled] muserid = @s muserid






tag @s add imamob


gamemode adventure
clear



data merge entity @e[tag=iscontrolled,limit=1] {PersistenceRequired:true,NoAI:true,Invulnerable:true}
tp @e[tag=iscontrolled] 0 500 0




execute store result score @s mmobhealth run data get entity @e[tag=iscontrolled,limit=1] Health
scoreboard players reset @s mhealed


# set player's max health using a chest!
setblock 1 0 1 chest
data merge block 1 0 1 {Items:[{Slot:0b,Count:1b,id:"minecraft:leather_leggings",tag:{display:{Name:'[{"text":"Leggings of Life","italic":false,"color":"light_purple"}]',Lore:['[{"text":"Yes, your life is tied to these","italic":false}]']},Unbreakable:1b,Enchantments:[{id:"binding_curse",lvl:1},{id:"minecraft:vanishing_curse",lvl:1}],AttributeModifiers:[{AttributeName:"generic.max_health",Amount:1.0,Operation:0,Slot:legs,Name:"generic.max_health",UUID:[I;-122025,16485,20216,-32970]},{AttributeName:"generic.armor",Amount:-5.0,Name:"generic.armor"}]}}]}
execute store result block 1 0 1 Items[{Slot:0b}].tag.AttributeModifiers[0].Amount double 1 run attribute @e[tag=iscontrolled,limit=1] minecraft:generic.max_health get
item replace entity @s armor.legs from block 1 0 1 container.0
data remove block 1 0 1 Items[{Slot:0b}]
setblock 1 0 1 bedrock
attribute @s minecraft:generic.max_health base set 0
#effect give @s resistance 1 4 true


# Exit Button
item replace entity @s hotbar.8 with minecraft:warped_fungus_on_a_stick{display:{Name:'[{"text":"Exit Mob","bold":true}]'},Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]} 1



# categories of entities
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:allmonsters] run tag @s add imamonster
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:inherent_armor] run item replace entity @s armor.feet with iron_boots{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:sunburned] run tag @s add imsunburned
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:floating] run function mctrlmobs:zzz/floating/enter
execute if entity @e[tag=iscontrolled,type=!#mctrlmobs:melee] run effect give @s weakness 100000 2 true
execute if entity @e[tag=iscontrolled,type=!#mctrlmobs:melee_strong] run attribute @s minecraft:generic.attack_damage base set 1
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:melee_strong] run attribute @s minecraft:generic.attack_damage base set 3
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
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:cube_mobs,nbt={Size:3}] run effect give @s slowness 100000 3 true





# mobs dont attack their own team
team leave @s
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:ignored_by_hostiles] run team join ctrlmobs
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:piglinteam] run team join ctrlpiglins



# pillagers

execute if entity @e[tag=iscontrolled,type=minecraft:evoker] run give @s minecraft:carrot_on_a_stick{display:{Name:'[{"text":"Evoker Fangs"}]'},Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:evoker] run gamemode survival
execute if entity @e[tag=iscontrolled,type=minecraft:evoker] run tag @s add imanevoker

execute if entity @e[tag=iscontrolled,type=minecraft:pillager] run give @s crossbow{Enchantments:[{id:vanishing_curse,lvl:1},{id:infinity,lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:pillager] run give @s arrow{Enchantments:[{id:vanishing_curse,lvl:1}]} 256

#execute if entity @e[tag=iscontrolled,type=minecraft:ravager] run effect give @s minecraft:health_boost 100000 19 true
#execute if entity @e[tag=iscontrolled,type=minecraft:ravager] run effect give @s minecraft:instant_health 10 100 true
execute if entity @e[tag=iscontrolled,type=minecraft:ravager] run effect give @s minecraft:slowness 100000 0 true
execute if entity @e[tag=iscontrolled,type=minecraft:ravager] run give @s iron_sword{display:{Name:'[{"text":"Ravager Horn","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1},{id:knockback,lvl:2},{id:sharpness,lvl:3}]} 1


execute if entity @e[tag=iscontrolled,type=vex] run give @s iron_sword{Enchantments:[{id:vanishing_curse,lvl:1},{id:knockback,lvl:2},{id:sharpness,lvl:1}]}
execute if entity @e[tag=iscontrolled,type=vindicator] run give @s iron_axe{Enchantments:[{id:vanishing_curse,lvl:1},{id:sharpness,lvl:1}]}





# individual entities

execute if entity @e[tag=iscontrolled,type=minecraft:chicken] run effect give @s slow_falling 100000 0 true


execute if entity @e[tag=iscontrolled,type=minecraft:creeper] run give @s minecraft:carrot_on_a_stick{display:{Name:'[{"text":"BOOM! (or cancel boom)"}]'},Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:creeper] run tag @s add imacreeper

execute if entity @e[tag=iscontrolled,type=minecraft:dolphin] run effect give @s minecraft:dolphins_grace 1000000 0 true


execute if entity @e[tag=iscontrolled,type=minecraft:drowned,nbt={HandItems:[{id:"minecraft:trident"}]}] run give @s trident{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1},{id:"loyalty",lvl:3}]}



execute if entity @e[tag=iscontrolled,type=minecraft:guardian      ] run function mctrlmobs:zzz/guardian/enter
execute if entity @e[tag=iscontrolled,type=minecraft:elder_guardian] run function mctrlmobs:zzz/guardian/enter
execute if entity @e[tag=iscontrolled,type=minecraft:elder_guardian] run tag @s add imanelder


execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run effect give @s minecraft:slowness 100000 1 true
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run give @s iron_sword{display:{Name:'[{"text":"Golem Arm","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1},{id:knockback,lvl:2},{id:sharpness,lvl:3}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run item replace entity @s armor.head with iron_helmet{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run item replace entity @s armor.chest with iron_chestplate{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run item replace entity @s armor.feet with iron_boots{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}


execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run give @s iron_sword{display:{Name:'[{"text":"Hoglin Tusk","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1},{id:knockback,lvl:2},{id:sharpness,lvl:1}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run item replace entity @s armor.head with leather_helmet{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run item replace entity @s armor.chest with leather_chestplate{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run item replace entity @s armor.feet with leather_boots{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}




execute if entity @e[tag=iscontrolled,type=#minecraft:skeletons,type=!wither_skeleton] run give @s bow{Enchantments:[{id:vanishing_curse,lvl:1},{id:infinity,lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:skeleton] run give @s arrow{Enchantments:[{id:vanishing_curse,lvl:1}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:stray] run give @s tipped_arrow{CustomPotionColor:11594239,display:{Name:'[{"text":"Arrow of Slowness","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}],CustomPotionEffects:[{Id:2,Duration:140,Amplifier:0}]} 256


execute if entity @e[tag=iscontrolled,type=minecraft:spider     ] run tag @s add imaspider
execute if entity @e[tag=iscontrolled,type=minecraft:cave_spider] run tag @s add imaspider


execute if entity @e[tag=iscontrolled,type=minecraft:piglin] unless entity @e[tag=iscontrolled,type=piglin,nbt={HandItems:[{id:"minecraft:golden_sword"}]}] run give @s crossbow{Enchantments:[{id:vanishing_curse,lvl:1},{id:infinity,lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:piglin] unless entity @e[tag=iscontrolled,type=piglin,nbt={HandItems:[{id:"minecraft:golden_sword"}]}] run give @s arrow{Enchantments:[{id:vanishing_curse,lvl:1}]} 256
execute if entity @e[tag=iscontrolled,type=minecraft:piglin,nbt={HandItems:[{id:"minecraft:golden_sword"}]}] run give @s golden_sword{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}

execute if entity @e[tag=iscontrolled,type=minecraft:piglin_brute] run give @s golden_axe{Unbreakable:1b,Enchantments:[{id:sharpness,lvl:7},{id:vanishing_curse,lvl:1}]}

execute if entity @e[tag=iscontrolled,type=minecraft:zombified_piglin] run give @s golden_sword{Unbreakable:1b,Enchantments:[{id:vanishing_curse,lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:zombified_piglin] run tag @s add imazpiglin



execute if entity @e[tag=iscontrolled,type=minecraft:blaze] run give @s bow{Enchantments:[{id:flame,lvl:1},{id:vanishing_curse,lvl:1},{id:infinity,lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:blaze] run give @s arrow{Enchantments:[{id:vanishing_curse,lvl:1}]} 1




execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Ghast Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Ghast Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Ghast Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Ghast Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Ghast Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Ghast Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run tag @s add imaghast



execute if entity @e[tag=iscontrolled,type=minecraft:wither_skeleton] run give @s stone_sword{Enchantments:[{id:vanishing_curse,lvl:1}]}


execute if entity @e[tag=iscontrolled,type=minecraft:enderman] run give @s minecraft:carrot_on_a_stick{display:{Name:'[{"text":"Teleport"}]'},Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:enderman] run gamemode survival
execute if entity @e[tag=iscontrolled,type=minecraft:enderman] run tag @s add imanenderman


execute if entity @e[tag=iscontrolled,type=minecraft:witch] run give @s minecraft:potion{Enchantments:[{id:vanishing_curse,lvl:1}],Potion:"minecraft:water",CustomPotionEffects:[{Id:10,Amplifier:1,Duration:1200}],display:{Name:"\"Regeneration\""}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:witch] run give @s minecraft:splash_potion{Enchantments:[{id:vanishing_curse,lvl:1}],Potion:"minecraft:water",CustomPotionEffects:[{Id:18,Duration:1200}],display:{Name:"\"Weakness\""}} 2
execute if entity @e[tag=iscontrolled,type=minecraft:witch] run give @s minecraft:splash_potion{Enchantments:[{id:vanishing_curse,lvl:1}],Potion:"minecraft:water",CustomPotionEffects:[{Id:7}],display:{Name:"\"Instant Damage\""}} 2
execute if entity @e[tag=iscontrolled,type=minecraft:witch] run give @s minecraft:splash_potion{Enchantments:[{id:vanishing_curse,lvl:1}],Potion:"minecraft:water",CustomPotionEffects:[{Id:19,Duration:1200}],display:{Name:"\"Poison\""}} 10


execute if entity @e[tag=iscontrolled,type=minecraft:wither] run function mctrlmobs:zzz/wither/enter


# 1-second invulnerability if needed to fill up the player's health
execute if score @s mmobhealth > @s mhealth run effect give @s minecraft:resistance 1 4 true

# announce the player's transition
title @a actionbar [{"selector":"@s"}, {"color":"yellow", "text":" is now a "}, {"selector":"@e[tag=iscontrolled]"}]
tellraw @a [{"selector":"@s"}, {"color":"yellow", "text":" is now a "}, {"selector":"@e[tag=iscontrolled]"}]



#custom heads

execute if entity @e[tag=iscontrolled,type=minecraft:axolotl] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"axolotl"}
execute if entity @e[tag=iscontrolled,type=minecraft:bee] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Bee"}
execute if entity @e[tag=iscontrolled,type=minecraft:cave_spider] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_CaveSpider"}
execute if entity @e[tag=iscontrolled,type=minecraft:blaze] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Blaze"}
execute if entity @e[tag=iscontrolled,type=minecraft:cave_spider] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_CaveSpider"}
execute if entity @e[tag=iscontrolled,type=minecraft:chicken] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Chicken"}
execute if entity @e[tag=iscontrolled,type=minecraft:cow] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Cow"}
execute if entity @e[tag=iscontrolled,type=minecraft:creeper] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Creeper"}
execute if entity @e[tag=iscontrolled,type=minecraft:elder_guardian] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_EGuardian"}
execute if entity @e[tag=iscontrolled,type=minecraft:enderman] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Enderman"}
execute if entity @e[tag=iscontrolled,type=minecraft:endermite] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Endermite"}
execute if entity @e[tag=iscontrolled,type=minecraft:evoker] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Evoker"}
execute if entity @e[tag=iscontrolled,type=minecraft:pillager] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Evoker"}
execute if entity @e[tag=iscontrolled,type=minecraft:vindicator] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Evoker"}
execute if entity @e[tag=iscontrolled,type=minecraft:fox] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Fox"}
execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Ghast"}
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Golem"}
execute if entity @e[tag=iscontrolled,type=minecraft:guardian] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Guardian"}
execute if entity @e[tag=iscontrolled,type=minecraft:magma_cube] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_LavaSlime"}
execute if entity @e[tag=iscontrolled,type=minecraft:mooshroom] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_MushroomCow"}
execute if entity @e[tag=iscontrolled,type=minecraft:ocelot] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Ocelot"}
execute if entity @e[tag=iscontrolled,type=minecraft:cat] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Ocelot"}
execute if entity @e[tag=iscontrolled,type=minecraft:panda] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"articblitz"}
execute if entity @e[tag=iscontrolled,type=minecraft:parrot] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Parrot"}
execute if entity @e[tag=iscontrolled,type=minecraft:pig] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Pig"}
execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Pig"}
execute if entity @e[tag=iscontrolled,type=minecraft:piglin] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Piglin"}
execute if entity @e[tag=iscontrolled,type=minecraft:piglin_brute] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Piglin"}
execute if entity @e[tag=iscontrolled,type=minecraft:pufferfish] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Pufferfish"}
execute if entity @e[tag=iscontrolled,type=minecraft:rabbit] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Rabbit"}
execute if entity @e[tag=iscontrolled,type=minecraft:zombified_piglin] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_PigZombie"}
execute if entity @e[tag=iscontrolled,type=minecraft:sheep] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Sheep"}
execute if entity @e[tag=iscontrolled,type=minecraft:shulker] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Shulker"}
execute if entity @e[tag=iscontrolled,type=minecraft:skeleton] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Skeleton"}
execute if entity @e[tag=iscontrolled,type=minecraft:stray] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Skeleton"}
execute if entity @e[tag=iscontrolled,type=minecraft:slime] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Slime"}
execute if entity @e[tag=iscontrolled,type=minecraft:snow_golem] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_SnowGolem"}
execute if entity @e[tag=iscontrolled,type=minecraft:spider] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Spider"}
execute if entity @e[tag=iscontrolled,type=minecraft:squid] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Squid"}
execute if entity @e[tag=iscontrolled,type=minecraft:glow_squid] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Squid"}
execute if entity @e[tag=iscontrolled,type=minecraft:strider] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Strider"}
execute if entity @e[tag=iscontrolled,type=minecraft:turtle] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Turtle"}
execute if entity @e[tag=iscontrolled,type=minecraft:villager] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Villager"}
execute if entity @e[tag=iscontrolled,type=minecraft:vex] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Vex"}
execute if entity @e[tag=iscontrolled,type=minecraft:wither_skeleton] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_WSkeleton"}
execute if entity @e[tag=iscontrolled,type=minecraft:wither] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_WSkeleton"}
execute if entity @e[tag=iscontrolled,type=minecraft:witch] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Witch"}
execute if entity @e[tag=iscontrolled,type=minecraft:zombie] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Zombie"}
execute if entity @e[tag=iscontrolled,type=minecraft:zombie_villager] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Zombie"}
execute if entity @e[tag=iscontrolled,type=minecraft:drowned] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Zombie"}
execute if entity @e[tag=iscontrolled,type=minecraft:husk] run item replace entity @s armor.head with minecraft:player_head{SkullOwner:"MHF_Zombie"}


