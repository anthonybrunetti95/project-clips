#!/usr/bin/python2
# -*- coding: iso-8859-15 -*-
import time
from core import Engine
TOKEN = "631731871:AAHdRC1Cq1keXuz42249PA0twR4k5i8u_oI"

class GameBoardExpert (Engine):
		def __init__ (self, chat_id):
			self.TOKEN = TOKEN
			super().__init__(self.TOKEN)
			self.chat_id = chat_id
		


		def update (self, update):
			self.text, self.chat, self.update_id, self.sender_id, self.sender_uname, self.message_id, self.reply_message_id, self.reply_user_id, self.reply_username, self.first_name, self.last_name, self.data, self.cbid, self.chat_type = self.get_info(update)


			if "/start" in self.text:
					self.send_message("ciao", self.chat_id)
			print(self.text)


