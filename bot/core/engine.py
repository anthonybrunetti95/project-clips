#!/usr/bin/python2
# -*- coding: iso-8859-15 -*-
import json
import urllib
from bs4 import BeautifulSoup
from network import NetworkEngine

class Engine (NetworkEngine):
	def __init__ (self, token):
		self.TOKEN = token
		self.URL = "https://api.telegram.org/bot{}/".format(self.TOKEN)

	def get_updates (self, offset=None, polling_timeout=120):
		assert type(polling_timeout) is int

		self.url = self.URL + "getUpdates?timeout={}".format(polling_timeout)

		if offset:
			self.url += "&offset={}".format(offset)

		#return self.get_json(self.url)
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


	def get_chat_administrators (self, chat_id):
		self.admins= {}
		try:
			self.url = "{}getChatAdministrators?chat_id={}".format(self.URL, chat_id)
			self.result = self.get_json(self.url)
			for self.admin in self.result["result"]:
				self.admins[self.admin["user"]["id"]] = "@{}".format(self.admin["user"]["username"])

		except KeyError:
			pass

		return self.admins


	def user_is_admin (self, user_id, chat_id):
		self.url = self.URL + "getChatMember?chat_id={}&user_id={}".format(chat_id, user_id)
		return self.user_info["result"]["status"] in ("creator", "administrator")


	def get_update_id (self, update):
		return update["update_id"]


	def get_chat_id (self, update):
		self.chat_id = None
		self.update_type = list(update)[1] # in modo da capire il tipo di update


		if self.update_type == "message":
			self.chat_id = update["message"]["chat"]["id"]

		elif self.update_type == "callback_query":
			self.chat_id = update["callback_query"]["message"]["chat"]["id"]

		elif self.update_type == "edited_message":
			self.chat_id = update["edited_message"]["chat"]["id"]

		else:
			with open("chat_id_errors.log", "a") as file:
				file.write(str(update) + "\n\n")

		return self.chat_id


	def get_update_type (self, update):
		return list(update)[1]

	
	def get_text (self, update):
		return update["message"]["text"]

	def get_update_id (self, update):
		return update["update_id"]

	def get_sender_id (self, update):
		return update["message"]["from"]["id"]

	def get_sender_username (self, update):
		return "@" + update["message"]["from"]["username"]

	def get_sender_first_name (self, update):
		return update["message"]["from"]["first_name"]

	def get_sender_last_name (self, update):
		return update["message"]["from"]["last_name"]

	def get_message_id (self, update):
		return update["message"]["message_id"]

	def get_reply_message_id (self, update):
		return update["message"]["reply_to_message"]["message_id"]

	def get_reply_user_id (self, update):
		return "@" + update["message"]["reply_to_message"]["from"]["username"]

	def get_reply_username (self, update):
		return "@" + update["message"]["reply_to_message"]["from"]["username"]

	def get_callback_data (self, update):
		return update["callback_query"]["data"]

	def get_callback_request_id (self, update):
		return update["callback_query"]["id"]

	def get_chat_type (self, update):
		return update["chat"]["type"]

	def get_file_id (self, update, file_type, photo_number=3):
		assert type(file_type) is str

		if type(photo_number) is range:
			i = 0

			for pn in photo_number:
				file_id[i] = update["message"][file_type][pn]["file_id"]
				i += 1

		else:
			file_id = update["message"][file_type][photo_number]["file_id"]

		return file_id

	def get_file (self, file_id):
		url = self.URL + "getFile?file_id={}".format(file_id)

		return json.loads(self.send_get_request(url).content)


	def is_update_ok (self, update):
		return update["ok"]


	"""Questa funzione accetta un json di una lista del tipo updates["result"][0] updates["result"][1]... 
	Quello che fa è estrapolarne il contenuto che ci interessa in modo da poter 
	fare un loop che guarda tra tutti i messaggi invece che prendere solo l'ultimo"""
	def get_info (self, update):
		try:
			self.text = update["message"]["text"]
		except KeyError:
			self.text = ""
		self.chat_id = self.get_chat_id(update)
		self.update_id = update["update_id"]
		try:
			self.sender_id = update["message"]["from"]["id"]
		except KeyError:
			self.sender_id = None
		try:
			self.message_id = update["message"]["message_id"]
		except KeyError:
			self.message_id = None
		try:
			self.reply_message_id = update["message"]["reply_to_message"]["message_id"]
		except KeyError:
			self.reply_message_id = ""
		try:
			self.reply_user_id = update["message"]["reply_to_message"]["from"]["id"]
		except KeyError:
			self.reply_user_id = ""
		try:
			self.reply_username = "@{}".format(update["message"]["reply_to_message"]["from"]["username"])
		except KeyError:
			self.reply_username = ""
		try:
			self.sender_uname = "@{}".format(update["message"]["from"]["username"])
		except KeyError:
			self.sender_uname = ""
		try:
			self.first_name = update["message"]["from"]["first_name"]
		except KeyError:
			self.first_name = ""
		try:
			self.last_name = update["message"]["from"]["last_name"]
		except KeyError:
			self.last_name = ""
		try:
			self.data = update["callback_query"]["data"]
		except KeyError:
			self.data = ""
		try:
			self.cbid = update["callback_query"]["id"]
		except KeyError:
			self.cbid = ""
		try:
			self.chat_type = update["chat"]["type"]		# private, group, supergroup, channel
		except KeyError:
			self.chat_type = ""
		return (self.text, self.chat_id, self.update_id, self.sender_id, self.sender_uname, self.message_id,
				self.reply_message_id, self.reply_user_id, self.reply_username, self.first_name, self.last_name, self.data, self.cbid, self.chat_type)

	def get_callback (self, callback_query):
		self.callback_id = callback_query["id"]
		self.callback_message_id = callback_query["message"]["message_id"]
		self.callback_chat_id = callback_query["message"]["chat"]["id"]
		self.callback_data = callback_query["data"]
		return (self.callback_id, self.callback_message_id, self.callback_chat_id, self.callback_data)

	def answer_callback (self, callback_query_id, text=None, show_alert=False, url=None, cache_time=None):
		self.url = self.URL + "answerCallbackQuery?callback_query_id={}".format(callback_query_id)

		if text:
			self.url += "&text={}".format(text)
		if show_alert:
			self.url += "&show_alert=true"
		if url:
			self.url += "&url={}".format(url)
		if cache_time:
			self.url += "&cache_time={}".format(cache_time)

		return self.send_get_request(self.url)

	def edit_message_reply_markup (self, reply_markup, chat_id=None, message_id=None, inline_message_id=None):
		self.url = self.URL + "editMessageReplyMarkup?reply_markup={}".format(reply_markup)

		if chat_id and message_id:
			self.url += "&chat_id={}&message_id={}".format(chat_id, message_id)
		elif inline_message_id:
			self.url += "&inline_message_id={}".format(inline_message_id)

		return self.send_post_request(self.url)


	def send_message (self, text, chat_id, reply=None, reply_markup=None, disable_notification=False, parse_mode=None):
		self.text = urllib.parse.quote_plus(text)
		self.url = "{}sendMessage?text={}&chat_id={}&disable_notification={}".format(self.URL, self.text, chat_id, disable_notification)
		
		assert parse_mode in (None, "markdown", "HTML") # Non so se usarlo o no

		if reply:
			self.url += "&reply_to_message_id={}".format(reply)
		if reply_markup:
			self.url += "&reply_markup={}".format(reply_markup)
		if parse_mode:
			self.url += "&parse_mode={}".format(parse_mode)

		# TODO: fare un wrapper per questa riga esattamente come per il metodo get_json() presente in network
		return json.loads(self.send_get_request(self.url).content.decode("utf8"))
