import pymysql
import pwinput
import getpass


class Database:

    def __init__(self):
        self.conn = None
        self.cursor = None
        self.credentials = dict()
        self.get_credentials()
        self.start_connection(self.credentials["username"],
                              self.credentials["password"])

    def start_connection(self, username: str, password: str) -> None:
        # To connect MySQL database
        try:
            self.conn = pymysql.connect(
                host='localhost',
                user=username,
                password=password,
                db='sharkdb',  # TODO: CHANGE DB TO PROJECT'S DB
            )
        except NameError:
            raise TypeError("Unable to connect to DB")

        self.cursor = self.conn.cursor()

    def get_credentials(self):
        self.credentials["username"] = input("Username: ")
        self.credentials["password"] = pwinput.pwinput(prompt='PW: ', mask='*')
