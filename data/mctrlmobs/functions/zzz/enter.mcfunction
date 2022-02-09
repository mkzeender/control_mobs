
tag @e[tag=iscontrolled] remove iscontrolled

tag @e[distance=0,limit=1,type=#mctrlmobs:allmobs,type=!ender_dragon] add iscontrolled
tag @e[tag=iscontrolled] add savedforlater

scoreboard players operation @e[tag=iscontrolled] muserid = @s muserid






tag @s add imamob


gamemode adventure
clear



data merge entity @e[tag=iscontrolled,limit=1] {PersistenceRequired:true,NoAI:true,Invulnerable:true}
tp @e[tag=iscontrolled] 0 500 0



# setting health
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
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:cube_mobs] run effect give @s slowness 100000 3 true





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

execute if entity @e[tag=iscontrolled,type=minecraft:blaze] run scoreboard players set @s mctrlmobs.itemcooldown 75
execute if entity @e[tag=iscontrolled,type=minecraft:blaze] run tag @s add imablaze

execute if entity @e[tag=iscontrolled,type=minecraft:chicken] run effect give @s slow_falling 100000 0 true


execute if entity @e[tag=iscontrolled,type=minecraft:creeper] run give @s minecraft:carrot_on_a_stick{display:{Name:'[{"text":"BOOM! (or cancel boom)"}]'},Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:creeper] run tag @s add imacreeper

execute if entity @e[tag=iscontrolled,type=minecraft:dolphin] run effect give @s minecraft:dolphins_grace 1000000 0 true


execute if entity @e[tag=iscontrolled,type=minecraft:drowned,nbt={HandItems:[{id:"minecraft:trident"}]}] run give @s trident{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1},{id:"loyalty",lvl:3}]}



execute if entity @e[tag=iscontrolled,type=minecraft:guardian      ] run function mctrlmobs:zzz/guardian/enter
execute if entity @e[tag=iscontrolled,type=minecraft:elder_guardian] run function mctrlmobs:zzz/guardian/enter
execute if entity @e[tag=iscontrolled,type=minecraft:elder_guardian] run tag @s add imanelder


execute if entity @e[tag=iscontrolled,type=minecraft:goat] run give @s stick{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1},{id:"knockback",lvl:4}],display:{Name:'{"text":"Super Goat Knockback Stick"}'},CustomTags:["mctrlmobs.illegal"]}

execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run give @s iron_sword{display:{Name:'[{"text":"Hoglin Tusk","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1},{id:knockback,lvl:2},{id:sharpness,lvl:1}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run item replace entity @s armor.head with leather_helmet{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run item replace entity @s armor.chest with leather_chestplate{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:hoglin] run item replace entity @s armor.feet with leather_boots{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}


execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run effect give @s minecraft:slowness 100000 1 true
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run give @s iron_sword{display:{Name:'[{"text":"Golem Arm","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1},{id:knockback,lvl:2},{id:sharpness,lvl:3}]} 1
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run item replace entity @s armor.head with iron_helmet{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run item replace entity @s armor.chest with iron_chestplate{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}
execute if entity @e[tag=iscontrolled,type=minecraft:iron_golem] run item replace entity @s armor.feet with iron_boots{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1}]}


execute if entity @e[tag=iscontrolled,type=minecraft:llama       ] run tag @s add imallama
execute if entity @e[tag=iscontrolled,type=minecraft:trader_llama] run tag @s add imallama


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



execute if entity @e[tag=iscontrolled,type=minecraft:ghast] run scoreboard players set @s mctrlmobs.itemcooldown 1
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


execute if entity @e[tag=iscontrolled,type=minecraft:axolotl            ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Axolotl\"}"},SkullOwner:{Id:[I;-1162309561,-2034087443,-1691605254,1529453424],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjFhMGEyMWZkNzczMDc0OTQ0NWIxODJlZTA3YWUwZjRjMjM3YjY0MjM2MDg2MWEyYTFmMDQzODRiMjg3ZjBlNiJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:bat                ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Bat\"}"},SkullOwner:{Id:[I;1331404383,-1076739259,-1376811539,1267859806],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjY4MWE3MmRhNzI2M2NhOWFlZjA2NjU0MmVjY2E3YTE4MGM0MGUzMjhjMDQ2M2ZjYjExNGNiM2I4MzA1NzU1MiJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:cat                ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Cat\"}"},SkullOwner:{Id:[I;690719649,935480772,-1428372959,-1977669414],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMmU2NTA1Y2RiODE0YjY4MDAwNDI5ODlmYTBjY2JkNWVkYWI3ZWMyYjA5OGIzZTNmOWEyYzBlMDBiOGUwYzk2In19fQ=="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:cod                ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Cod Fish\"}"},SkullOwner:{Id:[I;-690698428,112478858,-1132806736,1997255119],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzg5MmQ3ZGQ2YWFkZjM1Zjg2ZGEyN2ZiNjNkYTRlZGRhMjExZGY5NmQyODI5ZjY5MTQ2MmE0ZmIxY2FiMCJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:dolphin            ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Dolphin\"}"},SkullOwner:{Id:[I;-1954755219,920537056,-1923453081,-1715011912],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOGU5Njg4Yjk1MGQ4ODBiNTViN2FhMmNmY2Q3NmU1YTBmYTk0YWFjNmQxNmY3OGU4MzNmNzQ0M2VhMjlmZWQzIn19fQ=="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:donkey             ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Donkey\"}"},SkullOwner:{Id:[I;-1745554238,284970693,-2010992035,-1225031895],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzIwMTI0NWZjZGM2Y2M0MjY5NGQ4ZTY3ZTU2NjI4MmUwN2JjMDBhMGEzOTdmYzcyNjYwOWMyNzg5ZmQ5ZTZiMSJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:drowned            ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Drowned\"}"},SkullOwner:{Id:[I;-1943150917,724453901,-1528537058,1492972198],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzg0ZGY3OWM0OTEwNGIxOThjZGFkNmQ5OWZkMGQwYmNmMTUzMWM5MmQ0YWI2MjY5ZTQwYjdkM2NiYmI4ZTk4YyJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:salmon             ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Magikarp\"}"},SkullOwner:{Id:[I;1025159247,380653413,-1637659352,-1504023937],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzJhZDNjYzZkMzYzMWNhYTg4N2E5MWViYzVlNmE2NWNmMjU3ODAzYzdjN2FjZDU3ZDE5YTBhYzIyZmFlODQwMyJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:fox                ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Seapeekay\"}"},SkullOwner:{Id:[I;750261044,1404061100,-1876013444,1216826124],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTk1MDk0M2Q5NTRkNzQ2YzhhMjcxOTFjYzQyMGFmOTI5NzAzYTQxNTIwYjI4OGY5ODYzNDQyYmYxOWZlOGViOSJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:glow_squid         ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Glow Squid\"}"},SkullOwner:{Id:[I;487790670,-129546906,-1930880703,968875501],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTUwMTMzMWZlODNkZjY3ZjIzNGRkZDZjMDg5ZjMyMzFkM2I2MDIyOGQzNzIzNWNhOWViMWE5MWVkNjg3M2E4MiJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:goat               ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Goat\"}"},SkullOwner:{Id:[I;-632048996,2024818863,-1996415687,1785189839],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDU3YTBkNTM4ZmEwOGE3YWZmZTMxMjkwMzQ2ODg2MTcyMGY5ZmEzNGU4NmQ0NGI4OWRjZWM1NjM5MjY1ZjAzIn19fQ=="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:horse              ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Chestnut Horse\"}"},SkullOwner:{Id:[I;508939576,-1315487367,-2139029096,1866223783],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTk5NjM5OWZmZjljYmNmYjdiYTY3N2RkMGMyZDEwNDIyOWQxY2MyMzA3YTZmMDc1YTg4MmRhNDY5NGVmODBhZSJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:husk               ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Husk\"}"},SkullOwner:{Id:[I;-207171088,338838309,-1453827855,-1780856411],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMjY5Yjk3MzRkMGU3YmYwNjBmZWRjNmJmN2ZlYzY0ZTFmN2FkNmZjODBiMGZkODQ0MWFkMGM3NTA4Yzg1MGQ3MyJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:llama              ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"White Llama\"}"},SkullOwner:{Id:[I;-1273429067,1219708865,-1383883873,-948421712],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZGU3MDNhYjAzMWVkNjY2MjJmMTI5NTdlZjU5YThiNWM4YTI2OWNlYmQxOGY5MzI2MjQ4YjY4YzNiYmUyMDE2MyJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:mule               ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Mule\"}"},SkullOwner:{Id:[I;-627670924,-2130754063,-2062551842,43598499],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDZkY2RhMjY1ZTU3ZTRmNTFiMTQ1YWFjYmY1YjU5YmRjNjA5OWZmZDNjY2UwYTY2MWIyYzAwNjVkODA5MzBkOCJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:phantom            ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Phantom\"}"},SkullOwner:{Id:[I;-1836012072,-1030665638,-1886758577,374605475],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvN2U5NTE1M2VjMjMyODRiMjgzZjAwZDE5ZDI5NzU2ZjI0NDMxM2EwNjFiNzBhYzAzYjk3ZDIzNmVlNTdiZDk4MiJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:polar_bear         ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Polar Bear\"}"},SkullOwner:{Id:[I;1070247943,413812528,-1305975695,759230725],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzRmZTkyNjkyMmZiYjQwNmYzNDNiMzRhMTBiYjk4OTkyY2VlNDQxMDEzN2QzZjg4MDk5NDI3YjIyZGUzYWI5MCJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:ravager            ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Ravager\"}"},SkullOwner:{Id:[I;-988784499,1538476442,-1335897902,1631763943],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvY2QyMGJmNTJlYzM5MGEwNzk5Mjk5MTg0ZmM2NzhiZjg0Y2Y3MzJiYjFiZDc4ZmQxYzRiNDQxODU4ZjAyMzVhOCJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:silverfish         ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Silverfish\"}"},SkullOwner:{Id:[I;-1697533322,-1587590272,-1333797184,52998864],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTJlYzJjM2NiOTVhYjc3ZjdhNjBmYjRkMTYwYmNlZDRiODc5MzI5YjYyNjYzZDdhOTg2MDY0MmU1ODhhYjIxMCJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:skeleton_horse     ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Skeleton Horse\"}"},SkullOwner:{Id:[I;-1128471105,-2033955230,-1614476087,233393005],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDdlZmZjZTM1MTMyYzg2ZmY3MmJjYWU3N2RmYmIxZDIyNTg3ZTk0ZGYzY2JjMjU3MGVkMTdjZjg5NzNhIn19fQ=="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:strider            ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Strider\"}"},SkullOwner:{Id:[I;-1126660915,-2068430415,-1386167219,-2128510252],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNDAxYzgxNjU3ZGMyNjIyODE3ZmYzZmZkOGNiZjkwZTRlMjlkMGYxYjIzM2JlNzk1YzRjM2RlYTlhYWZhZjA1In19fQ=="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:trader_llama       ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Creamy Trader Llama\"}"},SkullOwner:{Id:[I;-1208012849,-228898058,-1798521208,1995825462],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNTYzMDdmNDJmYzg4ZWJjMjExZTA0ZWEyYmI0ZDI0N2I3NDI4YjcxMWRmOWE0ZTBjNmQxYjkyMTU4OWU0NDNhMSJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:tropical_fish      ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Tropical Fish (clownfish)\"}"},SkullOwner:{Id:[I;-552686986,691422508,-1109863954,-786161558],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMzYzODlhY2Q3YzgyODBkMmM4MDg1ZTZhNmE5MWUxODI0NjUzNDdjYzg5OGRiOGMyZDliYjE0OGUwMjcxYzNlNSJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:wandering_trader   ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Shot Wandering Trader\"}"},SkullOwner:{Id:[I;949186964,1952400342,-2020136730,499096214],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNWQyYjcyNDg2YzYxZjg5ZDQ1MTVmZTllMWRiZWU5YjE2NmE4MDYxZDQzYzI4OTk1MGIxMTdmMDA2ZmMwMjk1MyJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:wolf               ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Wolf\"}"},SkullOwner:{Id:[I;1744107341,533022957,-1537961745,1133912695],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMjhkNDA4ODQyZTc2YTVhNDU0ZGMxYzdlOWFjNWMxYThhYzNmNGFkMzRkNjk3M2I1Mjc1NDkxZGZmOGM1YzI1MSJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:zoglin             ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Zoglin\"}"},SkullOwner:{Id:[I;-1017211146,893928000,-1894613410,2050284576],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTY3ZTE4NjAyZTAzMDM1YWQ2ODk2N2NlMDkwMjM1ZDg5OTY2NjNmYjllYTQ3NTc4ZDNhN2ViYmM0MmE1Y2NmOSJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:zombie_horse       ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Zombie Horse\"}"},SkullOwner:{Id:[I;2077201833,-393329642,-1899575754,-1687535172],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjg5NmExZGJkZTFhMTk1NDBjZTczMzZjNmM5NGY1OTY1MmFhOThiYjEwNjhiMmVmOGM4ZmE2ZWY4NTgwNGY1NyJ9fX0="}]}}} 1
execute if entity @e[tag=iscontrolled,type=minecraft:zombie_villager    ] run item replace entity @s armor.head with minecraft:player_head{display:{Name:"{\"text\":\"Farmer Zombie Villager\"}"},SkullOwner:{Id:[I;957434107,1014189199,-2145518654,1129533418],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZTg3MzY1MDQxMGQ4NTU3YTgxYTI3YjliN2Q4NTU4N2RkNWQwNGZhNzFkMmMwZjY4NjZjZTQ4NDMwMjUyMDA4ZSJ9fX0="}]}}} 1


