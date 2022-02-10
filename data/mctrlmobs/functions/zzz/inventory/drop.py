def line(f, l):
    f.write(l)
    f.write('\n')

inventory_slots = {i : f'hotbar.{i}' for i in range(0, 9)}

inventory_slots.update({i : f'inventory.{i-9}' for i in range(9, 36)})

inventory_slots.update({100 : 'armor.feet',
                        101 : 'armor.legs',
                        102 : 'armor.chest',
                        103 : 'armor.head',
                        -106: 'weapon.offhand'
                        })

#inventory_slots = list(range(36)) + [100, 101, 102, 103, -106]


commands = """
tag @e remove mselected
execute if entity @s[nbt={Inventory:[{Slot:%ib}]}] unless entity @s[nbt={Inventory:[{Slot:%ib,tag:{CustomTags:["mctrlmobs.illegal"]}}]}] run summon item ~ ~ ~ {Tags:["mselected"],Item:{Count:1b,id:"minecraft:bedrock"}}
data modify entity @e[tag=mselected,limit=1] Item set from entity @s Inventory[{Slot:%ib}]
item replace entity @s %s with minecraft:air
"""

with open('drop/all.mcfunction', 'w') as f_all:

    for slot, slot_name in inventory_slots.items():
        command = commands.replace('%i', str(slot)).replace('%s', str(slot_name))
        with open(f'drop/{slot_name}.mcfunction', 'w') as f:
            f.write(command)

        f_all.write(command)
        f_all.write('\n')

with open('drop/weapon.mainhand.mcfunction', 'w') as f:
    f.write("""
tag @e remove mselected
execute if entity @s[nbt={SelectedItem:{}}] unless entity @s[nbt={SelectedItem:{tag:{CustomTags:["mctrlmobs.illegal"]}}}] run summon item ~ ~ ~ {Tags:["mselected"],Item:{Count:1b,id:"minecraft:bedrock"}}
data modify entity @e[tag=mselected,limit=1] Item set from entity @s SelectedItem
item replace entity @s weapon.mainhand with minecraft:air
    """)
