
execute unless entity @e[tag=dragonhost] run function mctrlmobs:zzz/dragon/createhost


spectate
gamemode survival

tp @e[type=ender_dragon] 0 -64 0
kill @e[type=ender_dragon]



bossbar set mctrlmobs:ender_dragon name {"selector":"@s"}




effect give @s minecraft:slowness 100000 3 true
effect give @s minecraft:strength 10000 1 true
effect give @s minecraft:slow_falling 100000 0 true
effect give @s minecraft:instant_health 100 100 true
effect give @s minecraft:fire_resistance 100000 0 true


attribute @s minecraft:generic.max_health base set 200
scoreboard players set @s mmaxhealth 200


# start in circling mode
scoreboard players set @s dragoncountdown 2400
scoreboard players set @s dragonsecond 120
scoreboard players set @s dragontick 0


tag @s add circling




item replace entity @s armor.head with minecraft:dragon_head{Enchantments:[{id:unbreaking,lvl:3},{id:vanishing_curse}]}
item replace entity @s armor.chest with minecraft:elytra{AttributeModifiers:[{AttributeName:"generic.knockback_resistance",Amount:100000,Slot:chest,Name:"generic.knockback_resistance",UUID:[I;-122023,1841,20647,-3682]}],Enchantments:[{id:unbreaking,lvl:3},{id:vanishing_curse}]}
give @s minecraft:firework_rocket{Enchantments:[{id:vanishing_curse}]} 256
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}
execute at @s run summon item ~ ~ ~ {Item:{id:snowball,Count:64b,tag:{display:{Name:'[{"text":"Dragon Fireball","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}}}



tag @s add dragontick
tag @s add imadragon