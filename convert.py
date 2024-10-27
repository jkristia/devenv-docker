import json
import yaml

def convert(filename:str):
	# Load JSON data from a file
	with open(f'{filename}.json', 'r') as json_file:
		json_data = json.load(json_file)

	# Convert JSON data to YAML and write to a file
	with open(f'{filename}.yaml', 'w') as yaml_file:
		yaml.dump(json_data, yaml_file, default_flow_style=False)

convert('proto/json_out/Person')
convert('proto/json_out/AddressBook')
print("JSON to YAML conversion done.")
