# This is a sample Python script.
import os
from database import Database
from OpenDota import OpenDota

if __name__ == "__main__":

    print("Welcome to the application:\nPlease input your username and password to connect to the database:")
    db = Database()
    os.system('cls' if os.name == 'nt' else 'clear')

    print("done")