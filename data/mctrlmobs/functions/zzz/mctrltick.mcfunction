tag @e[tag=iscontrolled] remove iscontrolled
tag @e[tag=zselected] remove zselected

tag @s add zselected

# tag the right entity
execute as @e[tag=savedforlater] if score @p[tag=zselected] muserid = @s muserid run tag @s add iscontrolled


#--------------------------depending on what entity the player is controlling, do these things each tick----------------------


# reset wither invulnerability
execute if entity @s[tag=witherstarted] run data merge entity @e[type=wither,tag=iscontrolled,limit=1] {Invul:0}

#ghast tick
execute if entity @e[tag=iscontrolled,type=ghast] if entity @e[type=fireball,distance=0..2] run summon minecraft:creeper ~ ~ ~ {Fuse:0,ignited:1,CustomName:'"Ghast"'}
execute if entity @e[tag=iscontrolled,type=ghast] run kill @e[type=fireball,distance=0..2]