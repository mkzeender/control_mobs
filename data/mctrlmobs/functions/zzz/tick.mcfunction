
# giving players a user id
execute as @a unless score @s muserid = @s muserid run function mctrlmobs:zzz/firstjoin



# entering an entity
execute as @a[tag=ctrlmobs,gamemode=spectator] at @s if entity @e[distance=0,limit=1,type=#mctrlmobs:allmobs,type=!minecraft:ender_dragon] run function mctrlmobs:zzz/enter
execute as @a[tag=ctrlmobs,gamemode=spectator] at @s if entity @e[distance=0..10,limit=1,type=ender_dragon] run function mctrlmobs:zzz/dragon/enter


execute as @a[tag=dragontick] at @s run function mctrlmobs:zzz/dragon/tick

# on button press
execute as @a[scores={pressedbutton=1..}, tag=ctrlmobs] at @s run function mctrlmobs:zzz/pressedbutton
execute as @a[scores={pressedleave=1..}, tag=ctrlmobs ] at @s run function mctrlmobs:zzz/leave


#when a player dies
execute as @a[scores={mctrdeathcount=1..}] at @s run function mctrlmobs:zzz/ondeath

#when a player respawns
execute as @a[scores={mctrdeathcounter=1..,mctrdeathwait=1..,mctrdeathtick=1}] at @s run function mctrlmobs:zzz/onrespawn
scoreboard players set @a[scores={mctrdeathcounter=1..,mctrdeathwait=1..}] mctrdeathtick 1



#make the mobcontrollers not have more health than the mobs they control
execute as @a[tag=ctrlmobs,gamemode=survival] unless entity @s[nbt={ActiveEffects:[{Id:6b}]}] if score @s mmobhealth < @s mhealth run effect give @s instant_damage 1 0 true
execute as @a[tag=ctrlmobs,gamemode=survival] unless entity @s[nbt={ActiveEffects:[{Id:6b}]}] if score @s mmobhealth < @s mhealth run stopsound @a[distance=0..16] * entity.player.hurt
execute as @a[tag=ctrlmobs,gamemode=survival] unless entity @s[nbt={ActiveEffects:[{Id:6b}]}] if score @s mmobhealth < @s mhealth run title @s actionbar "Automatically Adjusting Health..."
execute as @a[tag=ctrlmobs,gamemode=survival] unless entity @s[nbt={ActiveEffects:[{Id:6b}]}] if score @s mmobhealth >= @s mhealth run scoreboard players set @s mmobhealth 300

#keep the mobcontrollers hunger consistent
execute as @a[tag=ctrlmobs,scores={mfood=0..7}] run effect give @s saturation 1 1 true
execute as @a[tag=ctrlmobs,scores={mfood=15..}] run effect give @s hunger 10 128 true
execute as @a[tag=ctrlmobs,scores={mfood=..11}] run effect clear @s hunger



#making mobs not attack mobcontrollers
team join ctrlmobs @e[type=#mctrlmobs:hostileteam]
team join ctrlpiglins @e[type=#mctrlmobs:piglinteam]

# make iron golem attack mobcontrollers
execute as @e[type=minecraft:iron_golem] at @s run data modify entity @s AngryAt set from entity @p[team=ctrlmobs] UUID
execute as @e[type=minecraft:iron_golem] at @s if entity @p[team=ctrlmobs,distance=0..30] run data merge entity @s {AngerTime:500} 






#elder guardian tick
execute as @a[tag=ctrlmobs,tag=imanelder] run effect give @a[distance=0..50,tag=!ctrlmobs] mining_fatigue 300 2


#wither tick
execute as @a[tag=imawither] at @s run function mctrlmobs:zzz/wither/tick


#creeper tick
scoreboard players add @a[tag=imablow] creepertick 1
execute as @a[tag=imablow,scores={creepertick=0}] at @s run function mctrlmobs:zzz/buttons/creeper
execute as @a[tag=imablow,scores={creepertick=1}] at @s run kill @s

#spider tick
execute as @a[tag=imaspider] at @s anchored eyes rotated as @s unless block ^ ^ ^0.5 #mctrlmobs:air run effect give @s levitation 1 1 true

#projectile tick
execute as @e[type=snowball] at @s run function mctrlmobs:zzz/projectiles/ptick

# evoker tick
execute as @a[tag=imanevoker] at @s unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg"}]}] unless entity @e[type=vex,distance=0..30] run give @s vex_spawn_egg{Enchantments:[{id:vanishing_curse,lvl:1}]} 3

# wither immune tick
execute as @a[tag=idontwither] run effect clear @s minecraft:wither

# burn in sunlight tick
execute as @a[tag=imsunburned,scores={daytime=0..12000},nbt={Dimension:"minecraft:overworld"}] at @s if blocks ~ ~ ~ ~ ~200 ~ 0 200 0 masked run setblock ~ ~ ~ fire
execute store result score @a daytime run time query daytime

#drown in air tick
execute as @a[scores={gillair=300..},tag=imaquatic] run effect give @s wither 2 1 true
execute as @a[scores={gillair=..299},tag=imaquatic] run effect clear @s minecraft:wither
execute as @a[tag=imaquatic] at @s anchored eyes if block ^ ^ ^ #mctrlmobs:air run scoreboard players add @s gillair 1
execute as @a[tag=imaquatic] at @s anchored eyes if block ^ ^ ^ water run scoreboard players set @s gillair 0
execute as @a[tag=imaquatic] at @s anchored eyes if block ^ ^ ^ #mctrlmobs:air run title @s actionbar "You need water!!!"

#sickened by overworld tick
execute as @a[tag=imoverworldophobic,nbt= {Dimension:"minecraft:overworld"}] unless entity @s[nbt={ActiveEffects:[{Id:19b}]}] run effect give @s poison 4 0

#die in water tick
execute as @a[tag=imhydrophobic] at @s if block ~ ~1 ~ water run function mctrlmobs:zzz/hydrophobictick
execute as @a[tag=imhydrophobic] at @s if block ~ ~ ~ water run function mctrlmobs:zzz/hydrophobictick


# end crystal tick
execute as @e[type=end_crystal] at @s run function mctrlmobs:zzz/dragon/end_crystal_tick
execute as @a[tag=imadragon] at @s as @e[type=end_crystal,distance=0..32,sort=nearest,limit=1] run function mctrlmobs:zzz/dragon/end_crystal



#zombified_piglin tick
execute as @a[tag=imazpiglin] at @e[type=minecraft:zombified_piglin,sort=random,limit=1] run function mctrlmobs:zzz/zpiglinanger
execute as @a[tag=imazpiglin] run scoreboard players remove @s zpiglinanger 1
execute as @a[tag=imazpiglin,scores={zpiglinanger=1..}] run effect clear @s weakness
execute as @a[tag=imazpiglin,scores={zpiglinanger=..0}] run effect give @s weakness 100000 2 true




# chest tick
execute as @a at @s rotated as @s positioned ^ ^ ^0.2 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^0.4 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^0.6 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^0.8 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^1.0 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^1.2 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^1.4 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^1.6 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^1.8 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^2.0 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^2.2 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^2.4 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^2.6 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^2.8 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^3.0 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^3.2 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^3.4 run function mctrlmobs:zzz/chesttick
execute as @a at @s rotated as @s positioned ^ ^ ^3.6 run function mctrlmobs:zzz/chesttick

