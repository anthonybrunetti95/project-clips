
import json
import urllib
from bs4 import BeautifulSoup
from .network import NetworkEngine

class Engine (NetworkEngine):
	def __init__ (self, token):
		self.TOKEN = token
		self.URL = "https://api.telegram.org/bot{}/".format(self.TOKEN)

	def get_updates (self, offset=None, polling_timeout=120):
		assert type(polling_timeout) is int

		self.url = self.URL + "getUpdates?timeout={}".format(polling_timeout)

		if offset:
			self.url += "&offset={}".format(offset)

		# return self.get_json(self.url)
		self.request = self.send_get_request(self.url, headers={"Prefer": "wait=120"})
		return json.loads(self.request.content.decode("utf8"))


	def get_user_info (self, user_id, chat_id):
		self.url = self.URL + "getChatMember?chat_id={}&user_id={}".format(chat_id, user_id)
		self.user_info = self.get_json(self.url)

		self.status = self.user_info["result"]["status"]
		self.can_be_edited = self.user_info["result"]["can_be_edited"]
		self.can_change_info = self.user_info["result"]["can_change_info"]
		self.can_delete_messages = self.user_info["result"]["can_delete_messages"]
		self.can_invite_users = self.user_info["result"]["can_invite_users"]
		self.can_restrict_members = self.user_info["result"]["can_restrict_members"]
		self.can_promote_members = self.user_info["result"]["can_promote_members"]

		return (self.status, self.can_be_edited, self.can_change_info, self.can_delete_messages, self.can_invite_users, self.can_restrict_members, self.can_promote_members)

