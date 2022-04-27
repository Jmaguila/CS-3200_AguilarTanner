# Import the necessary packages
from consolemenu import *
from consolemenu.items import *
import pandas as pd
from database import Database
from getPlayerInfo import *
from dataclasses import dataclass


def client_validation(database):
    correct_credentials = False
    print("WELCOME TO THE PROGRAM\nPLEASE VALIDATE CLIENT CREDENTIALS\n")
    while not correct_credentials:
        username = input("username: ")
        password = input("password: ")

        # Check for username and password validity in DB
        database.run(proc="SELECT DISTINCT username FROM CLIENT")
        username_info = pd.DataFrame.to_dict(database.result_parsed).values()
        for p_name in username_info:
            for i in range(len(p_name)):
                if username == p_name[i]:
                    correct_credentials = True
                    break
                else:
                    correct_credentials = False
                    continue

        database.run(proc="SELECT password FROM CLIENT")
        password_info = pd.DataFrame.to_dict(database.result_parsed).values()
        for p_name in password_info:
            for i in range(len(p_name)):
                if password == p_name[i]:
                    correct_credentials = True
                    break
                else:
                    correct_credentials = False
                    continue

        if not correct_credentials:
            print("Incorrect username/password")

    print("Successfully verified")


def add_player(database) -> None:
    player_name = input("Player Username\n")
    player_data = get_info(player_name)
    procedure = "call addPlayer({}, '{}', {}, {}, {}, {})" \
        .format(player_data['player_id'][0], player_data['name'][0], player_data['mmr'][0],
                player_data['wins'][0], player_data['losses'][0], player_data['mph'][0])

    database.run(proc=procedure)


def player_exist(database, player_name) -> bool:
    p_list = get_all_players(database)
    for name in p_list:
        if player_name == name[0]:
            return True

    return False


def remove_player(database) -> None:
    player_name = input("Player Username\n")

    if player_exist(database, player_name):
        procedure = "DELETE FROM player WHERE username = '{}'".format(player_name)
        database.run(proc=procedure)
        print("Player found and deleted\n")
        return

    print("INVALID USERNAME ENTRY, PLEASE TRY AGAIN WITH A NEW PLAYER USERNAME TO DELETE\n")


def get_all_players(database) -> list:
    procedure = "SELECT DISTINCT username FROM player"
    database.run(proc=procedure)
    player_list = []
    for i in database.result[0:]:
        player_list.append(i)

    return player_list


def create_team(database):
    t_name = input("Input Team Name: ")
    c_name = input("Input Captain Name: ")
    procedure = "call createTeam('{}', '{}')".format(t_name, c_name)
    database.run(proc=procedure)


def get_all_team(database):
    procedure = "SELECT DISTINCT team_name FROM team"
    database.run(proc=procedure)
    team_list = []
    for i in database.result[0:]:
        team_list.append(i)

    return team_list


def add_player_to_team(database):
    team_list=get_all_team(database)
    player_name = input("INPUT PLAYER NAME: ")
    while not player_exist(database, player_name):
        print("FAIL TO FIND PLAYER\nPLEASE INPUT NEW PLAYER...")
        player_name = input("INPUT PLAYER NAME: ")

    print("INPUT TEAM TO ADD PLAYER TO:")

    t = team_list[0][0]
    for name in team_list[1:]:
        t += ", " + name[0]

    print(t)
    team_name = input("TEAM SELECTION: ")

    while True:
        for name in team_list:
            if team_name == name[0]:
                procedure = "UPDATE player set team_name = '{}' WHERE username = '{}'"\
                    .format(team_name, player_name)
                database.run(proc=procedure)
                print("{} WAS ADDED TO {}!\n".format(player_name, team_name))
                return

        print("FAIL TO FIND TEAM: PLEASE SELECT TEAM FROM LIST BELLOW\n")
        print(t)
        team_name = input("TEAM SELECTION: ")


def delete_player_team(database):
    player_name = input("INPUT PLAYER NAME: ")
    while not player_exist(database, player_name):
        print("FAIL TO FIND PLAYER\nPLEASE INPUT NEW PLAYER...")
        player_name = input("INPUT PLAYER NAME: ")

    procedure = "UPDATE player set team_name = NULL WHERE username = '{}'" \
        .format(player_name)
    database.run(proc=procedure)
    print("{}'S TEAM WAS REMOVED\n".format(player_name))


def display_all_heroes(database):
    procedure = "SELECT DISTINCT name, attack_type FROM hero"
    database.run(proc=procedure)
    pd.set_option('display.max_rows', None)
    database.result_parsed.columns = ['Name', 'Attack Type']
    database.print()


def display_specific_hero(database):
    procedure = "SELECT DISTINCT name FROM hero"
    database.run(proc=procedure)
    hero_list = []
    for i in database.result[0:]:
        hero_list.append(i)

    hero_exist = False
    while not hero_exist:
        print("SELECT HERO: ")
        hero_sel = input()

        for name in hero_list:
            if hero_sel == name[0]:
                hero_exist = True
                break

        if not hero_exist:
            print("FAILED TO FIND HERO\n")

    procedure = "SELECT * FROM HERO as h LEFT JOIN HERO_STATS  " \
                "AS hs ON  hs.hero_id = h.hero_id WHERE h.name = '{}'"\
        .format(hero_sel)

    database.run(proc=procedure)
    pd.set_option('display.max_columns', None)
    pd.set_option('display.expand_frame_repr', False)

    database.result_parsed.columns = ['hero_id',
                                      'Name', 'Attack type', "lore", 'strength',
                                      'agility', 'intelligence', 'movement speed',
                                      'damage', 'armor', 'X']
    database.print()


def matchmaker(database):
    @dataclass
    class p_info:
        p_name: str
        mmr: float = None

    def get_mmr(name):
        procedure = "SELECT mmr FROM player_stats AS ps JOIN player AS p ON p.player_id = ps.player_id " \
                    "WHERE p.username = '{}'".format(name)
        database.run(proc=procedure)
        return database.result_parsed[0][0]

    available_players = get_all_players(database)

    # CHECK IF THERE"RE ENOUGH PLAYERS TO CREATE MATCH
    if len(available_players) < 10:
        print("UNABLE TO CREATE MATCH. PLEASE ADD AT LEAST 10 PLAYERS TO PLAYER'S POOL")
        return

    print('LIST OF AVAILABLE PLAYERS:')
    p = available_players[0][0]
    for name in available_players[1:]:
        p += ", " + name[0]

    print(p)
    p_list = []
    for i in range(10):
        player_name = input("INPUT PLAYER NAME: ")
        while not player_exist(database, player_name):
            print("FAIL TO FIND PLAYER\nPLEASE INPUT NEW PLAYER...")
            player_name = input("INPUT PLAYER NAME: ")
        mmr = get_mmr(player_name)
        p_list.append(p_info(player_name, mmr))

    sorted_array = sorted(p_list, key=lambda x: x.mmr, reverse=True)
    team1 = []
    team2 = []
    team1.append(sorted_array[0])
    team2.append(sorted_array[-1])
    team2.append(sorted_array[1])
    team2.append(sorted_array[2])
    team1.append(sorted_array[3])
    team1.append(sorted_array[4])
    team2.append(sorted_array[5])
    team2.append(sorted_array[6])
    team1.append(sorted_array[7])
    team1.append(sorted_array[8])

    t1 = pd.DataFrame(team1)
    t2 = pd.DataFrame(team2)
    print("\tTeam 1:")
    print(t1)

    print("\tTeam 2:")
    print(t2)


if __name__ == "__main__":
    db = Database()

    # VALIDATE USER
    client_validation(db)

    # Create the menu
    menu = ConsoleMenu("MAIN MENU")

    # PLAYER SUBMENU
    menu_players = ConsoleMenu()
    menu_players.append_item(FunctionItem("ADD PLAYER TO POOL", function=add_player, args=[db]))
    menu_players.append_item(FunctionItem("REMOVE PLAYER FROM POOL", function=remove_player, args=[db]))

    player_list = pd.DataFrame(get_all_players(db))
    player_list.columns = ['Player Name']

    menu_players.append_item(FunctionItem("SHOW PLAYER POOL", function=print, args=[player_list]))
    submenu_player = SubmenuItem("Players", menu_players, menu)

    # TEAM SUBMENU
    menu_teams = ConsoleMenu()
    menu_teams.append_item(FunctionItem("CREATE TEAM", function=create_team, args=[db]))
    menu_teams.append_item(FunctionItem("ADD PLAYER TO TEAM", function=add_player_to_team, args=[db]))
    menu_teams.append_item(FunctionItem("REMOVE PLAYER FROM TEAM", function=delete_player_team, args=[db]))
    submenu_teams = SubmenuItem("Teams", menu_teams, menu)

    # HERO SUBMENU
    menu_heroes = ConsoleMenu()
    menu_heroes.append_item(FunctionItem("DISPLAY ALL HEROES", function=display_all_heroes, args=[db]))
    menu_heroes.append_item(FunctionItem("DISPLAY SPECIFIC HERO", function=display_specific_hero, args=[db]))
    submenu_heroes = SubmenuItem("Heroes", menu_heroes, menu)

    # MATCHMAKING SUBMENU
    menu_matches = ConsoleMenu()
    menu_matches.append_item(FunctionItem("MATCH-MAKING", function=matchmaker, args=[db]))
    submenu_matches = SubmenuItem("Match making", menu_matches, menu)
    # Once we're done creating them, we just add the items to the menu

    # APPENDING SUBMENUS INTO THE MAIN MANU
    menu.append_item(submenu_player)    # Players
    menu.append_item(submenu_teams)     # Teams
    menu.append_item(submenu_heroes)    # Heroes
    menu.append_item(submenu_matches)   # Matchmaking

    menu.show()
    db.stop_connection()
