#!/bin/sh

# put your playerid here (copy from dotabuff url pointing to your profile)
PLAYERID="12345"

#require w3m for conversion of website to raw text
command -v w3m >/dev/null 2>&1 || { echo "I require w3m but it's not installed. Aborting." >&2; exit 1; }

#only update dotastats.txt once a day, or dotabuff might get angry at us...
[ "$(stat -c %y /tmp/dotastats.txt 2> /dev/null | cut -d' ' -f1 )" != "$(date '+%Y-%m-%d')" ]
	w3m "https://www.dotabuff.com/players/$PLAYERID" > /tmp/dotastats.txt

#remove everything above Latest Matches and below
sed -n '/Latest Matches/,/Arbitrary Points/p' /tmp/dotastats.txt |
	sed '1,2d;$d' |
	# remove all line breaks
	tr '\n' ' ' |
	# new linebreak for each game
	sed 's/Hero /\n/g' |
	# pretty output with colors
	sed ''/Abandoned/s//`printf "\033[33mAbandoned;\033[0m"`/'' |
	sed ''/Won/s//`printf "\033[32mWon\033[0m"`/'' |
	sed ''/Lost/s//`printf "\033[31mLost\033[0m"`/'' |
	# some words we dont need
	sed 's/Result//g; s/Match//g; s/Duration//g; s/Type//g' |
	sed 's/ Low Skill/;Low Skill/g' |
	sed 's/ Normal Skill/;Normal Skill/g' |
	sed 's/ High Skill/;High Skill/g' |
	cut -f 2- -d ' ' |
	sed 's/  /;/g' |
	# make a nice table view
	column -t -s';'
