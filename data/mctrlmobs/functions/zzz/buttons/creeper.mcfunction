tag @e[tag=mselected] remove mselected
tag @e[tag=zselected] remove zselected

advancement grant @s only mctrlmobs:challenges/creeperblowup

tag @s add zselected

setblock 1 0 1 oak_sign
data modify block 1 0 1 Text1 set value '{"selector":"@p[tag=zselected]"}'

execute at @s run summon minecraft:creeper ~ ~ ~ {Fuse:0,ignited:1,Tags:["mselected"]}
data modify entity @e[tag=mselected,limit=1] CustomName set from block 1 0 1 Text1

setblock 1 0 1 bedrock


# kill saved creeper

execute as @e[tag=savedforlater] if score @p[tag=zselected] muserid = @s muserid run kill @s