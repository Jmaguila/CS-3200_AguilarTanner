#
#   This scripts queries openDota API to obtained id_numer, win/loss rate, mmr and most played hero
#
from OpenDota import openDota


def get_info(player_name: str) -> dict:
    """
    Given player id, it queries the DOTA API and returns a dict with relevant
    player's information
    :param player_name: string containing player name in game
    :return: dictionary containing player information
    """
    steam_name = player_name

    link = "https://api.opendota.com/api/search?q={x}".format(x=steam_name)
    openDota.connect(self=openDota, link=link)
    try:
        id_number = openDota.result.account_id[0]
    finally:
        id_number = openDota.result.account_id[1]

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
            "mph": [int(most_played_hero_id)], "mmr": [mmr]}

    return data
