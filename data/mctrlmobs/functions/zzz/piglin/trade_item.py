inventory_slots = {i : f'hotbar.{i}' for i in range(0, 9)}

inventory_slots.update({i : f'inventory.{i-9}' for i in range(9, 36)})

inventory_slots.update({100 : 'armor.feet',
                        101 : 'armor.legs',
                        102 : 'armor.chest',
                        103 : 'armor.head',
                        -106: 'weapon.offhand'
                        })




header = """
tag @s add mctrlmobs.searching

"""

commands = """
execute if entity @s[nbt={Inventory:[{Slot:%sb, id:"minecraft:gold_ingot"}]}] run tag @s remove mctrlmobs.searching

execute if entity @s[tag=!mctrlmobs.searching,scores={mctrlmobs.itemcooldown=0}] run loot give @p[tag=!imamob,gamemode=!spectator] loot minecraft:gameplay/piglin_bartering
execute if entity @s[tag=!mctrlmobs.searching,scores={mctrlmobs.itemcooldown=0}] run item modify entity @s %n mctrlmobs:decrease_count
execute if entity @s[tag=!mctrlmobs.searching,scores={mctrlmobs.itemcooldown=0}] run scoreboard players set @s mctrlmobs.itemcooldown 60

"""

footer = """
tag @s remove mctrlmobs.searching
"""
with open('trade_item.mcfunction', 'w') as f:
    f.write(header)

    for slot, slot_name in inventory_slots.items():
        f.write(commands.replace('%s', str(slot)).replace('%n', slot_name))

    f.write(footer)
