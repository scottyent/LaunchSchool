# We are given the following list of energy sources.

energy = ['fossil', 'solar', 'wind', 'tidal', 'fusion']

# Write some code to remove 'fossil' from the list, then
# add 'geothermal' to the end of the list.

energy.remove('fossil')
energy.append('geothermal')

print(energy) # ['solar', 'wind', 'tidal', 'fusion', 'geothermal']
print(energy == ['solar', 'wind', 'tidal', 'fusion', 'geothermal'])