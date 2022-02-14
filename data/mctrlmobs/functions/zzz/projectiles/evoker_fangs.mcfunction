tag @e[type=evoker_fangs] remove mselected

execute positioned ^ ^ ^1 run summon minecraft:evoker_fangs ^ ^ ^ {Tags:["mselected"],Warmup:0}
execute positioned ^ ^ ^2 run summon minecraft:evoker_fangs ^ ^ ^ {Tags:["mselected"],Warmup:2}
execute positioned ^ ^ ^3 run summon minecraft:evoker_fangs ^ ^ ^ {Tags:["mselected"],Warmup:4}
execute positioned ^ ^ ^4 run summon minecraft:evoker_fangs ^ ^ ^ {Tags:["mselected"],Warmup:6}
execute positioned ^ ^ ^5 run summon minecraft:evoker_fangs ^ ^ ^ {Tags:["mselected"],Warmup:8}

execute at @e[tag=mselected,type=evoker_fangs] run data modify entity @e[tag=mselected,type=evoker_fangs,sort=nearest,limit=1] Owner set from entity @s UUID