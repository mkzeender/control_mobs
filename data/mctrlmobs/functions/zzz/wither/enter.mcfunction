tag @s add imawither


effect give @s minecraft:slow_falling 100000 0 true
effect give @s minecraft:haste 100000 127 true
effect clear @s minecraft:slowness
effect give @s minecraft:jump_boost 100000 1 true
#more effects given in wither/tick function



gamemode survival


# if the wither was in invulnerability period, heal the player
execute unless entity @e[type=wither,tag=iscontrolled,nbt={Invul:0}] run scoreboard players set @s mmobhealth 300
execute unless entity @e[type=wither,tag=iscontrolled,nbt={Invul:0}] run scoreboard players set @s mhealed 0
execute unless entity @e[type=wither,tag=iscontrolled,nbt={Invul:0}] run effect give @s slowness 100000 2 true

execute if entity @e[type=wither,    tag=iscontrolled,nbt={Invul:0}] run tag @s add witherstarted


#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
#execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}


playsound minecraft:entity.wither.ambient hostile @a[distance=0..30] ~ ~ ~ 1 1 1

item replace entity @s armor.chest with leather_chestplate{Enchantments:[{id:"minecraft:vanishing_curse",lvl:1},{id:"blast_protection",lvl:20}],AttributeModifiers:[{AttributeName:"generic.armor",Amount:-20,Name:"generic.armor",UUID:[I;-122022,4608,14262,-9216]}]}
