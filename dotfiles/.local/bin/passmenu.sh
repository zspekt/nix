#!/usr/bin/env bash

shopt -s nullglob globstar

typeit=0
if [[ $1 == "--type" ]]; then
	typeit=1
	prompt="pass 󰌾  : "
	shift
else
	prompt="pass 󰌾  : "
fi

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=("$prefix"/**/*.gpg)
password_files=("${password_files[@]#"$prefix"/}")
password_files=("${password_files[@]%.gpg}")

password=$(printf '%s\n' "${password_files[@]}" | rofi -dmenu "$@" -p "$prompt")

[[ -n $password ]] || exit

if [[ $typeit -eq 0 ]]; then
	# cliphist
	export CLIPBOARD_STATE="sensitive"
	pass show -c "$password" 2>/dev/null
	# unset CLIPBOARD_STATE
	notify-send -t 3500 'password copied. clearing in 45s...'
else
	notify-send -t 3500 'typing password...'
	pass show "$password" | {
		IFS= read -r pass
		printf %s "$pass"
	} | ydotool type -d 1 --file -
fi
