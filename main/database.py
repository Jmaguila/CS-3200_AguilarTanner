import pymysql
import pandas as pd


class Database:

    def __init__(self):
        self.conn = None
        self.cursor = None
        self.result = None
        self.result_parsed = None
        self.credentials = dict()
        self.get_credentials()
        self.start_connection(self.credentials["username"],
                              self.credentials["password"])

    def start_connection(self, username: str, password: str, db="FINAL") -> None:
        """
        Start a connection given username, password and specific db to connect
        :param username: username to connect to dbs server
        :param password: password use to connect to servers
        :param db: name of the db to connect to
        :return: None
        """
        # To connect MySQL database
        try:
            self.conn = pymysql.connect(
                host='localhost',
                user=username,
                password=password,
                db=db,
            )
        except NameError:
            raise TypeError("Unable to connect to DB")

        self.cursor = self.conn.cursor()

    def stop_connection(self) -> None:
        """
        Closes the connection
        :return: None
        """
        self.conn.close()

    def get_credentials(self):
        """
        Asks for the credentials to connect into the server hosting all DBS
        :return: None
        """
        # TODO: CHANGE BACK TO ASK FOR USERNAME & PASSWORD
        # self.credentials["username"] = input("Username: ")
        # self.credentials["password"] = pwinput.pwinput(prompt='PW: ', mask='*')
        self.credentials["username"] = "root"
        self.credentials["password"] = "Jmas0706574118"

    def run(self, proc=""):
        """
        Run SQL scripts or procedures stored in DB
        :param proc: string containing SQL query or procedure to run
        :return: None
        """
        if not proc:
            return

        sql = proc
        try:
            # Execute the SQL command
            self.cursor.execute(sql)
            # Fetch all the rows in a list of lists.
            self.result = self.cursor.fetchall()
        except ValueError:
            raise TypeError("Error: unable to run SQL script")

        self.conn.commit()  # This is necessary to publish changes in DB
        self.result_parsed = pd.DataFrame(self.result)

    def print(self):
        print(self.result_parsed)
