#!/bin/bash

#----------------------------------------------------

#AUTHOR: Andrew Buultjens

#ABOUT:
# Produces a list of Evernote note titles that have sync issues
# Generate the log file by cicking the sync button and then  Help > Activity log.

#USAGE:
# sh evernote_log_miner.sh evernote.log

# the TITLES.txt outfile will contain the titles of all notes that cannot be synced. 
# go to those notes, copy the contents to a new note and delete the original.

#----------------------------------------------------

LOG=$1

grep " USN: 0" ${LOG} > DIRTY.txt
LEN=`wc -l DIRTY.txt | awk '{print $1}'`
seq 1 ${LEN} > seq_1-${LEN}.txt

for TAXA in $(cat seq_1-${LEN}.txt); do

	LINE_NUM=`head -${TAXA} DIRTY.txt | tail -1 | tr ':' '\n' | grep -n "Title" | cut -f 1 -d ':'`
	
	ONE=1
	let LINE=${ONE}+${LINE_NUM}

	TITLE=`head -${TAXA} DIRTY.txt | tail -1 | tr ':' '\n' | head -${LINE} | tail -1`		
	
	echo "${TITLE}" >> TITLES_TMP.txt
	
done

sort TITLES_TMP.txt | uniq > TITLES.txt

rm DIRTY.txt
rm seq_1-${LEN}.txt	
rm TITLES_TMP.txt	