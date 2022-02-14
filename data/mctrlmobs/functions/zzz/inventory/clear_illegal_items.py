

inventory_slots = {i : f'hotbar.{i}' for i in range(0, 9)}

inventory_slots.update({i : f'inventory.{i-9}' for i in range(9, 36)})

inventory_slots.update({100 : 'armor.feet',
                        101 : 'armor.legs',
                        102 : 'armor.chest',
                        103 : 'armor.head',
                        -106: 'weapon.offhand'
                        })


    
commands = """
execute if entity @s[nbt={Inventory:[{Slot:%sb,tag:{CustomTags:["mctrlmobs.illegal"]}}]}] run item replace entity @s %n with minecraft:air
"""

with open('clear_illegal_items.mcfunction', 'w') as f:
    for slot_num, slot_name in inventory_slots.items():
        f.write(commands.replace('%s', str(slot_num)).replace('%n', slot_name))

