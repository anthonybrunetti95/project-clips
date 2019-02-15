import requests
import json

class NetworkEngine:

	def send_get_request (self, url, headers={}, persistent=False):
		if persistent:
			with requests.Session() as session:
				self.get_req = session.get(url, headers=headers)
		else:
			self.get_req = requests.get(url, headers=headers)

		return self.get_req


	def send_post_request (self, url, file=None, filetype=None, persistent=False):
		if persistent:
			with requests.Session() as session:
				if file and filetype:
					self.post_req = session.post(url, files={filetype : open(file, "rb")})
				else:
					self.post_req = session.post(url)
		else:
			if file and filetype:
				self.post_req = requests.post(url, files={filetype : open(file, "rb")})
			else:
				self.post_req = requests.post(url)

		return self.post_req


	def get_json (self, url):
		self.content = self.send_get_request(self.url).content.decode("utf8")
		return json.loads(self.content)

