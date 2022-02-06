import json

with open('../../../../blocks.json', 'r') as f:
    blockdata = json.load(f)


solid = [block for block in blockdata if block['boundingBox'] == 'block']

permeable = [block for block in blockdata if block['boundingBox'] == 'empty']