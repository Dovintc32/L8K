import json

data = {}
for y in range(50, -21, -1):
    y_key = f"{y}"
    data[y_key] = {}
    for x in range(0, 101):
        data[y_key][f"{x}"] = 0

with open('data/world.json', 'w') as f:
    json.dump(data, f, indent=4)