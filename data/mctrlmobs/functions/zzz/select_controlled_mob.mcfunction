tag @e[tag=iscontrolled] remove iscontrolled
tag @e[tag=zselected] remove zselected

tag @s add zselected

# tag the right entity
execute as @e[tag=savedforlater] if score @p[tag=zselected] muserid = @s muserid run tag @s add iscontrolled