# Import the necessary packages
from consolemenu import *
from consolemenu.items import *
import pandas as pd
from database import Database
from getPlayerInfo import *


def client_validation(database):
    correct_credentials = False
    while not correct_credentials:
        username = input("username")
        password = input("password")

        # Check for username and password validity in DB
        database.run(proc="SELECT username FROM CLIENT")
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

    print("Successfully verified")


def add_player(database) -> None:
    player_name = input("Player Username\n")
    player_data = get_info(player_name)
    procedure = "call addPlayer({}, '{}', {}, {}, {}, {})" \
        .format(player_data['player_id'][0], player_data['name'][0], player_data['mmr'][0],
                player_data['wins'][0], player_data['losses'][0], player_data['mph'][0])

    database.run(proc=procedure)


def remove_player(database) -> None:
    player_name = input("Player Username\n")
    p_list = get_all_players(database)
    for name in p_list:
        if player_name == name[0]:
            procedure = "DELETE FROM player WHERE username = '{}'".format(player_name)
            database.run(proc=procedure)
            print("Player found and deleted\n")
            return

    print("INVALID USERNAME ENTRY, PLEASE TRY AGAIN WITH A NEW PLAYER USERNAME TO DELETE\n")


def get_all_players(database) -> list:
    procedure = "SELECT username FROM player"
    database.run(proc=procedure)
    player_list = []
    for i in database.result[0:-1]:
        player_list.append(i)

    return player_list


def create_team(database):
    t_name = input("Input Team Name: ")
    c_name = input("Input Captain Name: ")
    procedure = "call createTeam('{}', '{}')".format(t_name, c_name)
    database.run(proc=procedure)


if __name__ == "__main__":
    db = Database()
    ##
    # WHILE()

    # 1) CONNECT
    # - USER NAME / PASSWORD
    #
    #   1) Player
    #       -a Add new player
    #       -b Delete Player
    #   2) Premade TEAM
    #       -a Create new team
    #       -b add player to team
    #       -c Delete player from team
    #       -d Change Captain
    #   3) Create Match
    #       -a Select teams
    #       -B generate match
    #   4) Hero List
    #       - a Look at all heroes
    #       - b look up hero by name

    # Create the menu
    menu = ConsoleMenu("MAIN MENU")

    # PLAYER SUBMENU
    menu_players = ConsoleMenu()
    menu_players.append_item(FunctionItem("ADD PLAYER TO POOL", function=add_player, args=[db]))
    menu_players.append_item(FunctionItem("REMOVE PLAYER FROM POOL", function=remove_player, args=[db]))

    player_list = pd.DataFrame(get_all_players(db))
    player_list.rename(columns={0: "Username"})
    menu_players.append_item(FunctionItem("SHOW PLAYER POOL", function=print, args=[player_list]))
    submenu_player = SubmenuItem("Players", menu_players, menu)

    # TEAM SUBMENU
    menu_teams = ConsoleMenu()
    menu_teams.append_item(FunctionItem("CREATE TEAM", function=create_team, args=[db]))
    submenu_teams = SubmenuItem("Teams", menu_teams, menu)

    # Once we're done creating them, we just add the items to the menu

    # APPENDING SUBMENUS INTO THE MAIN MANU
    menu.append_item(submenu_player)    # Players
    menu.append_item(submenu_teams)     # Teams

    menu.show()
    db.stop_connection()
