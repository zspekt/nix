#!/usr/bin/env bash

notify-send -t 3500 'running pass backup...'
DIR=$(
	mktemp --tmpdir=/ram/ --directory dir.XXXX ||
		notify-send -u critical "pass backup failed: couldn't create tmpdir"
	exit 1
)
cd "$DIR" || notify-send -u critical "pass backup failed: couldn't cd into tmpdir" exit 1
FILENAME=$(date +%F_%T)
tar cf ./"$FILENAME" "$HOME/.password-store"
gpg --encrypt-files -r DBD82D52546CB3CD5D7C22EAAA9CE0C44FEB308D ./"$FILENAME"
rm ./"$FILENAME"
scp ./"$FILENAME.gpg" zspekt@nixpi.lan:/home/zspekt/
rm ./"$FILENAME.gpg"
cd ..
rmdir "$DIR"
exit
