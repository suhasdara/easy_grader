import appscript
from bs4 import BeautifulSoup
import urllib2
from subprocess import call
import sys

# URL for UT's site with list of all Unix hosts available
url = 'https://apps.cs.utexas.edu/unixlabstatus/'
site = urllib2.urlopen(url).read()

#Create Web Scraper instance
soup = BeautifulSoup(site, 'html.parser')

currMin = 1.0	# Current minimum load found
currMinUsers = 10	# Current minimum number of users found
currMinHost = ''	# Name of the best host found so far
for host in soup.find_all('tr'):	# Loop through all hosts on website
	text = host.get_text()	#Get the text for this item
	lines = text.splitlines();	#Split up text into an array of lines
		
	if len(lines) == 6: # Valid hosts take up 6 lines
		name = lines[1] 	#Get the name of the host
		status = lines[2]	# Can be either 'up' or 'down'
		# Make sure this isn't the table header and that the host is 'up'
		if name != 'Host' and status == 'up':	
			load = float(lines[5])
			users = int(float(lines[4]))
			#print(name + ' has ' + str(users) + ' users and load of ' +str(load)) 
			if load <= currMin and users <= currMinUsers: # Found a better host?
				currMin = load 	#Update current minimums
				currMinHost = name
				currMinUsers = users
			if load == 0.0 and currMinUsers == 0: # Found best possible option
				break;

if currMinHost != '':	# See if we updated the default value and found a host
	sys.stdout.write(currMinHost)
	sys.stdout.flush()
