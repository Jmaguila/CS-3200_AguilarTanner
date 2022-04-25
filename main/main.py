# This is a sample Python script.
import requests
import json
import pandas as pd



#steam_name = input()
steam_name = "ever so slightly horny"
link = "https://api.opendota.com/api/search?q={x}".format(x=steam_name)
r = requests.get(link)
data = json.loads(r.text)
df = pd.DataFrame(data)

id_number = df.account_id[0]

link2 = "https://api.opendota.com/api/players/{account_id}/heroes".format(account_id=id_number)

print(link2)
r = requests.get(link2)
data = json.loads(r.text)
df = pd.DataFrame(data)
pd.set_option('expand_frame_repr', False)
pd.set_option('display.max_columns', None)
# data2 = json.loads(r.text)
# x = data2["mmr_estimate"]
# df1 = pd.DataFrame(x , index=['0',])


print(df)
#
# pd.set_option('expand_frame_repr', False)
# pd.set_option('display.max_columns', None)