#keep important chunks loaded
execute in minecraft:overworld run forceload add 0 0
execute in minecraft:the_nether run forceload add 0 0
execute in minecraft:the_end run forceload add 0 0




# when a player logs into the server
execute as @a[scores={mctrlmobs.isloggedin=0}] run function mctrlmobs:zzz/join

#detect who is logged into the server
scoreboard players set * mctrlmobs.isloggedin 0
scoreboard players set @a mctrlmobs.isloggedin 1

#first login
execute as @a unless score @s muserid = @s muserid run function mctrlmobs:zzz/firstjoin


#clear illegal items
kill @e[type=item,nbt={Item:{tag:{CustomTags:["mctrlmobs.illegal"]}}}]


#sleeping through the night requires only normal players to be in bed

scoreboard players set mctrlmobsmanager moperator 0
scoreboard players set mctrlmobsmanager moperand 0
execute as @a[nbt={Dimension:"minecraft:overworld"},gamemode=!spectator            ] run scoreboard players add mctrlmobsmanager moperator 1
execute as @a[nbt={Dimension:"minecraft:overworld"},gamemode=!spectator,tag=!imamob] run scoreboard players add mctrlmobsmanager moperand 100
scoreboard players operation mctrlmobsmanager moperand /= mctrlmobsmanager moperator

execute if score mctrlmobsmanager moperand matches 000..010 run gamerule playersSleepingPercentage 0
execute if score mctrlmobsmanager moperand matches 010..020 run gamerule playersSleepingPercentage 10
execute if score mctrlmobsmanager moperand matches 020..030 run gamerule playersSleepingPercentage 20
execute if score mctrlmobsmanager moperand matches 030..040 run gamerule playersSleepingPercentage 30
execute if score mctrlmobsmanager moperand matches 040..050 run gamerule playersSleepingPercentage 40
execute if score mctrlmobsmanager moperand matches 050..060 run gamerule playersSleepingPercentage 50
execute if score mctrlmobsmanager moperand matches 060..070 run gamerule playersSleepingPercentage 60
execute if score mctrlmobsmanager moperand matches 070..080 run gamerule playersSleepingPercentage 70
execute if score mctrlmobsmanager moperand matches 080..090 run gamerule playersSleepingPercentage 80
execute if score mctrlmobsmanager moperand matches 090..100 run gamerule playersSleepingPercentage 90
execute if score mctrlmobsmanager moperand matches 100..100 run gamerule playersSleepingPercentage 100


#------------------------------------------- TRIGGERS-----------------------------------------------------------
# hardcore mode
execute as @p[scores={mctrlmobs.options.hardcore=0..}] store result storage mctrlmobs:options hardcore byte 1 run scoreboard players get @s mctrlmobs.options.hardcore
execute as @p[scores={mctrlmobs.options.hardcore=0..}] run scoreboard players reset * mctrlmobs.options.hardcore

# crafting allowed
execute as @p[scores={mctrlmobs.options.craft=0..}] store result storage mctrlmobs:options craft byte 1 run scoreboard players get @s mctrlmobs.options.craft
execute as @p[scores={mctrlmobs.options.craft=0..}] run scoreboard players reset * mctrlmobs.options.craft




#-----------------------------------------------EVENTS----------------------------------------------------------------
# entering an entity
execute as @a[tag=ctrlmobs,gamemode=spectator] at @s if entity @e[distance=0,limit=1,type=#mctrlmobs:allmobs,type=!minecraft:ender_dragon] run function mctrlmobs:zzz/enter
execute as @a[tag=ctrlmobs,gamemode=spectator] at @s if entity @e[distance=0..10,limit=1,type=ender_dragon] run function mctrlmobs:zzz/dragon/enter


execute as @a[tag=dragontick] at @s run function mctrlmobs:zzz/dragon/tick

# on button press
execute as @a[scores={pressedbutton=1..}, tag=imamob] at @s run function mctrlmobs:zzz/pressedbutton
execute as @a[scores={pressedleave=1..}, tag=imamob ] at @s run function mctrlmobs:zzz/leave


#when a player dies
execute as @a[scores={mctrdeathcount=1..}] at @s run function mctrlmobs:zzz/ondeath

#when a player respawns
execute as @a[scores={mctrdeathcounter=1..,mctrdeathwait=1..,mctrdeathtick=1}] at @s run function mctrlmobs:zzz/onrespawn
scoreboard players set @a[scores={mctrdeathcounter=1..,mctrdeathwait=1..}] mctrdeathtick 1



#---------------------------------------SETTING HEALTH-------------------------------------------------------------------



#save player health for when the player leaves and rejoins the world
execute as @a[tag=imamob,scores={mhealed=1}] run scoreboard players operation @s mmobhealth = @s mhealth

#give player regen until they are at the correct health
execute as @a[tag=imamob] unless entity @s[scores={mhealed=1}] if score @s mmobhealth >= @s mhealth unless entity @s[nbt={ActiveEffects:[{Id:10b,Amplifier:5b}]}] run effect give @s regeneration 100000 5 true
execute as @a[tag=imamob] unless entity @s[scores={mhealed=1}] if score @s mmobhealth <= @s mhealth run effect clear @s minecraft:regeneration

#decrease player health if needed
execute as @a[tag=imamob] unless entity @s[scores={mhealed=1}] if score @s mmobhealth < @s mhealth run effect give @s poison 1 4 true
execute as @a[tag=imamob] unless entity @s[scores={mhealed=1}] if score @s mmobhealth >= @s mhealth run effect clear @s poison

execute as @a[tag=imamob] unless entity @s[scores={mhealed=1}] if score @s mmobhealth = @s mhealth run scoreboard players set @s mhealed 1





#keep the mobcontrollers hunger consistent
execute as @a[tag=imamob,scores={mfood=0..7}] run effect give @s saturation 1 1 true
execute as @a[tag=imamob,scores={mfood=15..}] run effect give @s hunger 10 128 true
execute as @a[tag=imamob,scores={mfood=..11}] run effect clear @s hunger



#making mobs not attack mobcontrollers
team join ctrlmobs @e[type=#mctrlmobs:hostileteam]
team join ctrlpiglins @e[type=#mctrlmobs:piglinteam]




#---------------------------------------------entity specific----------------------------------------

#floating tick
execute as @a[tag=imfloating] at @s run function mctrlmobs:zzz/floating/tick

# make iron golem attack mobcontrollers
execute as @e[type=minecraft:iron_golem] at @s run data modify entity @s AngryAt set from entity @p[distance=0..30,tag=imamonster] UUID
execute as @e[type=minecraft:iron_golem] at @s if entity @p[distance=0..30,tag=imamonster] run data merge entity @s {AngerTime:500} 


#elder guardian tick
execute as @a[tag=imanelder] run effect give @a[distance=0..50,tag=!imamob,gamemode=!spectator] mining_fatigue 300 2


#wither tick
execute as @a[tag=imawither] at @s run function mctrlmobs:zzz/wither/tick


#creeper tick
scoreboard players add @a[tag=imablow] creepertick 1
execute as @a[tag=imablow,scores={creepertick=0}] at @s run function mctrlmobs:zzz/buttons/creeper
execute as @a[tag=imablow,scores={creepertick=1}] at @s run kill @s

#spider tick
execute as @a[tag=imaspider] at @s anchored eyes rotated as @s unless block ^ ^ ^0.5 #mctrlmobs:air run effect give @s levitation 1 2 true
execute as @a[tag=imaspider] at @s anchored eyes rotated as @s unless block ~ ~2.5 ~ #mctrlmobs:air run effect give @s levitation 1 6 true
execute as @a[tag=imaspider] at @s anchored eyes rotated as @s unless block ^ ^1 ^0.3 #mctrlmobs:air run effect give @s levitation 1 0 true
execute as @a[tag=imaspider] at @s unless blocks ~-0.5 ~-0.5 ~-0.5 ~0.5 ~0 ~0.5 0 300 0 masked run effect give @s slow_falling 10000 0 true
execute as @a[tag=imaspider] at @s if blocks ~-0.5 ~0 ~-0.5 ~0.5 ~3.5 ~0.5 0 300 0 masked run effect clear @s levitation
execute as @a[tag=imaspider] at @s if blocks ~-0.5 ~0 ~-0.5 ~0.5 ~3.5 ~0.5 0 300 0 masked run effect clear @s slow_falling
#if player is looking down
execute as @a[tag=imaspider] at @s anchored eyes rotated as @s unless block ^ ^0.7 ^0.3 #mctrlmobs:air positioned ^ ^ ^1 if entity @s[distance=0..1.5] run effect clear @s levitation


#projectile tick
execute as @e[type=snowball] at @s run function mctrlmobs:zzz/projectiles/ptick

scoreboard players remove @a[scores={mctrlmobs.itemcooldown=1..}] mctrlmobs.itemcooldown 1


# evoker tick
execute as @a[tag=imanevoker] at @s unless entity @s[nbt={Inventory:[{id:"minecraft:vex_spawn_egg"}]}] unless entity @e[type=vex,distance=0..20] run give @s vex_spawn_egg{CustomTags:["mctrlmobs.illegal"]} 3

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


#---------------------------------OTHER TICK----------------------------------
execute as @a[tag=imamob] at @s run function mctrlmobs:zzz/mctrltick



# chest tick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^0.2 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^0.4 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^0.6 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^0.8 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^1.0 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^1.2 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^1.4 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^1.6 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^1.8 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^2.0 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^2.2 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^2.4 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^2.6 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^2.8 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^3.0 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^3.2 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^3.4 run function mctrlmobs:zzz/inventory/chesttick
execute as @a at @s anchored eyes rotated as @s positioned ^ ^ ^3.6 run function mctrlmobs:zzz/inventory/chesttick

