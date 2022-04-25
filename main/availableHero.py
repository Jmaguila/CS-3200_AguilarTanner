from OpenDota import openDota

link = "https://api.opendota.com/api/heroes"
openDota.connect(link=link)
openDota.print_result(num_rows=openDota.result.size - 1)

# Get list of heroes
heroes_names = [""]
with open('availableHeroes.txt') as f:
    heroes_names = f.read().split('\n')

# Match list of Heroes and unmatch
for ind in openDota.result.index:
    a = openDota.result['localized_name'][ind]
    if a not in heroes_names:
        openDota.result.drop([ind], axis=0, inplace=True)

# Filtered heroes/ currently available heroes
openDota.result.to_csv(index=False)
compression_opts = dict(method='zip', archive_name='out.csv')
openDota.result.to_csv('out.zip', index=False, compression=compression_opts)
print(openDota.result)
