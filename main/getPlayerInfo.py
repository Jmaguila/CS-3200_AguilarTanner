#
#   This scripts queries openDota API to obtained id_numer, win/loss rate, mmr and most played hero
#
from OpenDota import openDota

steam_name = input("Input player name to add")

link = "https://api.opendota.com/api/search?q={x}".format(x=steam_name)
openDota.connect(self=openDota, link=link)
id_number = openDota.result.account_id[0]

link = "https://api.opendota.com/api/players/{account_id}/wl".format(account_id=id_number)
openDota.connect(self=openDota, link=link)
wins = openDota.result[1][0]
losses = openDota.result[1][1]

link = "https://api.opendota.com/api/players/{account_id}/heroes".format(account_id=id_number)
openDota.connect(self=openDota, link=link)
most_played_hero_id = openDota.result["hero_id"][0]

link = "https://api.opendota.com/api/players/{account_id}".format(account_id=id_number)
openDota.connect(self=openDota, link=link)
for index, row in openDota.result.iterrows():
    if type(row[0]) is not str:
        continue
    if row[0] == "mmr_estimate":
        mmr = row[1]['estimate']

data = {"name": [steam_name], "player_id": [id_number], "wins": [wins], "losses": [losses],
        "Most_played_hero": [most_played_hero_id], "mmr": [mmr]}

print(data)