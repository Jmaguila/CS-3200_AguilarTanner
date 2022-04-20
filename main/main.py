# This is a sample Python script.
import requests
import json
import pandas as pd


steam_name = "ever so slightly horny"
link = "https://api.opendota.com/api/search?q={x}".format(x=steam_name)
r = requests.get(link)
data = json.loads(r.text)
df = pd.DataFrame(data)

id_number = df.account_id[0]

link2 = "https://api.opendota.com/api/players/{x}/matches".format(x=id_number)
print(link2)
r = requests.get(link2)
data2 = json.loads(r.text)
df2 = pd.DataFrame(data2)

pd.set_option('expand_frame_repr', False)
pd.set_option('display.max_columns', None)

print(df2[0:10])



