import time
import random
import math
from core import Engine

class GameboardExpert (Engine):
		self.TOKEN = TOKEN
		super().__init__(self.TOKEN)
		


		def update (self, update):
		self.text, self.chat, self.update_id, self.sender_id, self.sender_uname, self.message_id, self.reply_message_id, self.reply_user_id, self.reply_username, self.first_name, self.last_name, self.data, self.cbid, self.chat_type = self.get_info(update)

		if self.get_update_type(update) == "callback_query":
			self.data = self.get_callback_data(update)
			
			if self.data == "/start"


