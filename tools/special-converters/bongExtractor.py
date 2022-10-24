import json, os, sys

for i in range(1, len(sys.argv)):
    jsonfile = os.path.split(sys.argv[i])[1]
    with open(jsonfile) as f:
        jsondata = f.read()

    lua = ""

    songdata = json.loads(jsondata.strip('\x00'))

    notes = songdata['song']['notes']

    arguments = ['mustHitSection', 'bpm', 'altAnim']

    bpm = songdata['song']['bpm']

    for j in notes:
        if len(j['sectionNotes']) > 0:
            for k in j['sectionNotes']:
                if k[1] == 8:
                    lua += (
                        'if musicTime >= ' + str(j['sectionNotes'][0][0]) + ' and musicTime < ' + str(j['sectionNotes'][0][0]+25) + ' then \n'
                        '\tbong()\n'
                        'end\n'
                        )

    with open('balls.lua', 'w') as f:
        f.write(lua)
