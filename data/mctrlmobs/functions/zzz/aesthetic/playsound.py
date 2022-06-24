import json
with open('../../../tags/entity_types/allmobs.json', 'r') as f:
    allmobs = json.load(f)['values']
    
with open('../../../tags/entity_types/allmonsters.json', 'r') as f:
    allmonsters = json.load(f)['values']

with open('playsound.mcfunction', 'w') as f:
    for mob in allmobs:
        type = 'hostile' if mob in allmonsters else 'neutral'
        f.write(f'execute if entity @e[tag=iscontrolled, type={mob}] run playsound minecraft:entity.{mob}.ambient {type} @a ~ ~ ~\n')
        
    
    f.write(f'\nscoreboard players set @s mctrlmobs.tick.sound.ambient 300\n')