#get rid of other wardens
tp @e[type=warden, distance=0..45, nbt={Invulnerable:1b}] ~ ~-127 ~
tp @e[type=warden, distance=0..15                       ] ~ ~-127 ~

# sonic boom item
execute unless entity @s[nbt={Inventory:[{Slot:1b,id:"minecraft:carrot_on_a_stick"}]}] unless entity @s[scores={mctrlmobs.itemcooldown=1..}] run item replace entity @s hotbar.1 with minecraft:carrot_on_a_stick{display:{Name:'[{"text":"Sonic Boom","bold":true}]'},CustomTags:["mctrlmobs.illegal"]} 1

#
scoreboard players remove @s mctrlmobs.tick.sound.warden 1
execute if score @s mctrlmobs.tick.sound.warden matches ..0 run function mctrlmobs:zzz/warden/heartbeat