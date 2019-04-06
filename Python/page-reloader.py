import webbrowser
import time
import os

url = input("Enter the URL: ")
refresh = input("Enter refresh time in seconds: ")
browser = input("Enter your browser: ")
count = input("How many views do you want?")

def openURL():
	os.system("taskkill -f -im " + browser + ".exe")
	webbrowser.open(url)
	time.sleep(int(refresh))
	
	for i in range(int(count)):
		print("Webpage has been viewed")
		openURL()

openURL()