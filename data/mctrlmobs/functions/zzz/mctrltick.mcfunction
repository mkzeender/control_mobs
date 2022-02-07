function mctrlmobs:zzz/select_controlled_mob


#--------------------------depending on what entity the player is controlling, do these things each tick----------------------

#convert arrows to infinity arrows
execute if entity @e[tag=iscontrolled,type=#mctrlmobs:infinity_arrows] as @e[type=#minecraft:arrows,distance=0..10] run data merge entity @s {pickup:0b}


execute if entity @e[tag=iscontrolled,type=minecraft:dolphin] run effect give @a[distance=0.1..10] minecraft:dolphins_grace 5 0


# reset wither invulnerability
execute if entity @s[tag=witherstarted] run data merge entity @e[type=wither,tag=iscontrolled,limit=1] {Invul:0}

#ghast tick
execute if entity @e[tag=iscontrolled,type=ghast] if entity @e[type=fireball,distance=0..2] run summon minecraft:creeper ~ ~ ~ {Fuse:0,ignited:1,CustomName:'"Ghast"'}
execute if entity @e[tag=iscontrolled,type=ghast] run kill @e[type=fireball,distance=0..2]