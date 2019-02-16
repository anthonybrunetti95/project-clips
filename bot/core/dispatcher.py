#!/usr/bin/python2
# -*- coding: iso-8859-15 -*-
import sys
import time
import traceback
import logging
import threading
from .engine import Engine
from .datamanager import get_bot_data



def run (bot, token=None):

	chats = {}

	if token:
		engine = Engine(token)
	else:
		bot_data = get_bot_data(sys.argv[1])
		engine = Engine(bot_data["telegram_token"])

	first_run = True
	last_update_id = None

	
	while True:
		
		if last_update_id:
			telegram_update = engine.get_updates(last_update_id + 1)
		else:
			telegram_update = engine.get_updates()
		
		if engine.is_update_ok(telegram_update):
			update_list = telegram_update["result"]
			
			if update_list:
				for update in update_list:	# questa è una lista di json
					chat = engine.get_chat_id(update)
					last_update_id = engine.get_update_id(update)

					if chat:
						if chat not in chats:
							chats[chat] = bot(chat)

						if not first_run:
							threading.Thread(target=chats[chat].update, args=(update,)).start()
				
		if first_run:
			first_run = False

