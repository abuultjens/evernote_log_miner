# evernote_log_miner

# Author
Andrew Buultjens

# Synopsis
Produces a list of Evernote note titles that have sync issues. Generate the log file by cicking the sync button and then  Help > Activity log.

# Usage
```
% sh evernote_log_miner.sh evernote.log
```
The TITLES.txt outfile will contain the titles of all notes that cannot be synced. Go to those notes, copy the contents to a new note and delete the original.
