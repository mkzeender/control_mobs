def line(f, l):
    f.write(l)
    f.write('\n')

with open('dropinventory.mcfunction', 'w') as f:
    for i in (list(range(36)) + [100, 101, 102, 103, -106]):
        n = str(i)
        line(f, "execute if entity @s[nbt={Inventory:[{Slot:" + n + "b}]}] unless entity @s[nbt={Inventory:[{Slot:" + n + "b,tag:{Enchantments:[{id:\"minecraft:vanishing_curse\"}]}}]}] unless entity @s[nbt={Inventory:[{Slot:" + n + "b,tag:{Enchantments:[{id:\"vanishing_curse\"}]}}]}] run summon item ~ ~ ~ {Tags:[\"mselected\"],Item:{Count:1b,id:\"minecraft:bedrock\"}}")
        line(f, "data modify entity @e[tag=mselected,limit=1] Item set from entity @s Inventory[{Slot:" + n + "b}]")
