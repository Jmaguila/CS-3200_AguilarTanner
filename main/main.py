# Import the necessary packages
from consolemenu import *
from consolemenu.items import *
import pandas as pd
from database import Database
from getPlayerInfo import get_info


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
    #   3) Hero List
    #       - a Look at all heroes
    #       - b look up hero by name
    #   3)
    #
    #

    # Create the menu
    menu = ConsoleMenu("CS-3200-Final Project", "DOTA2 matchmaking")
    # Create some items

    # MenuItem is the base class for all items, it doesn't do anything when selected
    menu_item = MenuItem("Menu Item")

    # A FunctionItem runs a Python function when selected
    function_item = FunctionItem("Verify", client_validation(db))

    # A SelectionMenu constructs a menu from a list of strings
    selection_menu = SelectionMenu(["1111", "222", "333"])

    # A SubmenuItem lets you add a menu (the selection_menu above, for example)
    # as a submenu of another menu
    submenu_item = SubmenuItem("Submenu item", selection_menu, menu)

    # Once we're done creating them, we just add the items to the menu
    menu.append_item(menu_item)
    menu.append_item(function_item)
    menu.append_item(submenu_item)
    menu.show()



# players_names = [""]
# players_names = open('players_list.txt').read().split('\n')
#
# print(type(players_names))
#
# for name in players_names:
#     print(name)
#     player_data = get_info(name)
#     procedure = "call addPlayer({}, '{}', {}, {}, {}, {})" \
#         .format(player_data['player_id'][0], player_data['name'][0], player_data['mmr'][0],
#                 player_data['wins'][0], player_data['losses'][0], player_data['mph'][0])
#
#     db.run(proc=procedure)
#
# db.run(proc="SELECT * FROM player JOIN player_stats")
#
# db.stop_connection()
