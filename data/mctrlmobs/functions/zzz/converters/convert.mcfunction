# merge hand and armor items
data modify entity @e[tag=mctrlmobs.converted, limit=1] HandItems set from entity @e[tag=iscontrolled, limit=1] HandItems
data modify entity @e[tag=mctrlmobs.converted, limit=1] ArmorItems set from entity @e[tag=iscontrolled, limit=1] ArmorItems


# get rid of old mob
kill @e[tag=iscontrolled]

#leave old mob, just in time to enter new mob
function mctrlmobs:zzz/leave

# enter new mob
tp ~ ~-0.5 ~
execute if entity @e[distance=0,limit=1,type=#mctrlmobs:allmobs] run function mctrlmobs:zzz/enter
tp ~ ~0.5 ~

tag @e remove mctrlmobs.converted
advancement grant @s only mctrlmobs:challenges/converter