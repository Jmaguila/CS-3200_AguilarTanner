import string
import requests
import json
import pandas as pd

class OpenDota:
    result = None

    def __init__(self) -> None:
        self.connect(self)
        # self.print_result(self)

    def connect(self, link="https://api.opendota.com/api/status"):
        r = requests.get(link)
        data = json.loads(r.text)
        if type(data) is not list:  # Some responses may result in dicts due to low # of responses. DataFrame req Lists
            data = list(data.items())
        OpenDota.result = pd.DataFrame(data)

    def print_result(self, num_rows=None):
        if type(num_rows) is None:
            self.print_result(num_rows=20)

        print(OpenDota.result)


    def getResult(self):
        return self.result
        print(OpenDota.result[0:num_rows])



openDota = OpenDota
openDota.__init__(self=openDota)
