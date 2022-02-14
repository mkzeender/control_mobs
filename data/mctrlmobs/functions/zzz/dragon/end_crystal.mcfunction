data modify entity @s BeamTarget.X set from entity @p[tag=imadragon,distance=0..32] Pos[0]
data modify entity @s BeamTarget.Y set from entity @p[tag=imadragon,distance=0..32] Pos[1]
data modify entity @s BeamTarget.Z set from entity @p[tag=imadragon,distance=0..32] Pos[2]


execute unless entity @p[tag=imadragon,distance=0..32,nbt={ActiveEffects:[{Id:10b}]}] run effect give @p[tag=imadragon,distance=0..32] regeneration 4 1
