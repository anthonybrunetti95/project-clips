import json

def get_bot_data (filename):
	bot_data = {}

	with open(filename, "r") as datafile:
		bot_data = json.load(datafile)

	return bot_data
