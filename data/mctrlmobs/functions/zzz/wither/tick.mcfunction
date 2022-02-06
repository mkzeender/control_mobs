execute if entity @s[scores={mhealth=0..150}] run function mctrlmobs:zzz/wither/halfhealthtick
execute if entity @s[scores={mhealth=150..} ] run function mctrlmobs:zzz/wither/fullhealthtick

#invulnerability period ends and wither explodes

execute if entity @s[tag=!witherstarted,scores={mhealed=1}] run effect give @s resistance 1 4 true
execute if entity @s[tag=!witherstarted,scores={mhealed=1}] run effect clear @s minecraft:slowness
execute if entity @s[tag=!witherstarted,scores={mhealed=1}] run playsound minecraft:entity.wither.spawn hostile @a ~ ~ ~ 1 1 1
execute if entity @s[tag=!witherstarted,scores={mhealed=1}] run summon minecraft:creeper ~ ~ ~ {Fuse:0,ignited:1,ExplosionPower:7,CustomName:'{"text":"Wither"}'}
execute if entity @s[tag=!witherstarted,scores={mhealed=1}] run tag @s add witherstarted


#natural regen
execute unless entity @s[nbt={ActiveEffects:[{Id:10b}]}] run effect give @s regeneration 100000 0 true

#projectiles
execute if entity @s[scores={mhealed=1},tag=witherstarted] unless entity @s[nbt={Inventory:[{id:"minecraft:snowball"}]}] run give @s snowball{display:{Name:'[{"text":"Wither Skull","italic":false}]'},Enchantments:[{id:vanishing_curse,lvl:1}]}


# bossbar
bossbar set mctrlmobs:wither name {"selector":"@s"}
bossbar set mctrlmobs:wither players @a
execute store result bossbar mctrlmobs:wither value run data get entity @s Health


# two second block attack
scoreboard players add @s withertick 1
execute if entity @s[scores={withertick=60..},tag=witherstarted] positioned ~ ~1 ~ run function mctrlmobs:zzz/wither/break_blocks
execute if entity @s[scores={withertick=60..}] run scoreboard players set @s withertick 0