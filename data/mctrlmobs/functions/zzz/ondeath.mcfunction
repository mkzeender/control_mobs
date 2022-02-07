scoreboard players reset @s mctrdeathcount

kill @e[type=item,nbt={Item:{id:"minecraft:player_head"}}]

gamemode spectator @s[tag=ctrlmobs]
team leave @s

tag @e[tag=mselected] remove mselected
tag @e[tag=zselected] remove zselected

tag @s add zselected

# move the old entity back here
execute as @e[tag=savedforlater] if score @p[tag=zselected] muserid = @s muserid run tag @s add mselected
tp @e[tag=mselected] @s
execute as @e[tag=mselected] run data merge entity @s {PersistenceRequired:false,NoAI:false,Invulnerable:false}
kill @e[tag=mselected]



#if keepinventory is on, ignore it
execute as @s[tag=imamob] run tag @s add wasamob


#if you entered from survival mode:
gamemode survival @s[tag=imahypnotizer]
execute if entity @s[tag=imahypnotizer] run attribute @s minecraft:generic.max_health base set 20
execute if entity @s[tag=imahypnotizer] run attribute @s minecraft:generic.attack_damage base set 1



#hardcore mode!
execute if data storage mctrlmobs:options {hardcore:1b} run function mctrlmobs:mob_controller

# death messages

execute if entity @s[tag=imadragon] run function mctrlmobs:zzz/dragon/death
execute if entity @s[scores={gillair=300..},tag=imaquatic] run tellraw @a [{"selector":"@s"}, {"text":" choked like a fish out of water"}]

execute if entity @s[tag=imhydrophobic                         ] at @s if block ~ ~1 ~ water run tellraw @a [{"selector":"@s"}, {"text":" dissolved in water"}]
execute if entity @s[tag=imhydrophobic] at @s unless block ~ ~1 ~ water if block ~ ~ ~ water run tellraw @a [{"selector":"@s"}, {"text":" dissolved in water"}]

execute if entity @s[tag=imsunburned,scores={daytime=0..12000},nbt={Dimension:"minecraft:overworld"}] at @s if blocks ~ ~1 ~ ~ ~200 ~ 0 200 0 masked run tellraw @a [{"selector":"@s"}, {"text":" forgot sunscreen"}]


# get rid of old tags
function mctrlmobs:zzz/removetags

