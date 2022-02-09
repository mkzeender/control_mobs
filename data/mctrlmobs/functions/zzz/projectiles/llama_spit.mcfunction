# as snowball at self


summon llama_spit ~ ~ ~

tag @e remove selected
tag @e[type=minecraft:llama_spit,limit=1,sort=nearest] add selected
function mctrlmobs:zzz/projectiles/pdata




#set owner of projectile
data modify entity @e[type=minecraft:llama_spit,limit=1,sort=nearest] Owner set from entity @p[tag=imallama] UUID


playsound minecraft:entity.llama.spit hostile @a ~ ~ ~