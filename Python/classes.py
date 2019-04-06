import math

class Book(object):
	def __init__(self, title, first_name, last_name):
		self.title = title
		self.first_name = first_name
		self.last_name = last_name

	def get_author_full_name(self):
		return self.first_name + " " + self.last_name

	def get_description(self):
		return self.get_description()

traffic = Book("Traffic", "Tom", "Vandebolt")
crypto = Book("Applied Crytography", "Bruce", "Schnier")

print (traffic.get_author_full_name())