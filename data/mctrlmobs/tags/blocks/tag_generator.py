import json

def write_tag(filename, lst):
    with open(filename, 'w') as f:
        json.dump({'values': lst}, f, indent=4)

with open('../../../../blocks.json', 'r') as f:
    blockdata = json.load(f)


solid = [block['name'] for block in blockdata if block['boundingBox'] == 'block']

permeable = [block['name'] for block in blockdata if block['boundingBox'] == 'empty']


standable_on = []
for block in solid:
    if not ('wall' in block and 'wall_' not in block) and not ('fence' in block and 'fence_' not in block):
        standable_on.append(block)

write_tag('standable_on.json', standable_on)





not_standable_in = ['fire', 'soul_fire', 'lava']

standable_in = [x for x in permeable if x not in not_standable_in]

write_tag('standable_in.json', standable_in)


