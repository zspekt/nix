#!/usr/bin/env bash

pick=$(
	sesh list -i | fzf-tmux -p 55%,60% \
		--no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
		--color=fg+:#fc9c3a,current-bg:-1,border:#fc9c3a,pointer:#f6758d,marker:#f6758d,prompt:#7eb041,label:#fc9c3a \
		--pointer=' ' --marker=' ' \
		--header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
		--bind 'tab:down,btab:up' \
		--bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list -i)' \
		--bind 'ctrl-t:change-prompt(  )+reload(sesh list -it)' \
		--bind 'ctrl-g:change-prompt(  )+reload(sesh list -ic)' \
		--bind 'ctrl-x:change-prompt(  )+reload(sesh list -iz)' \
		--bind 'ctrl-f:change-prompt(  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
		--bind 'ctrl-d:execute(tmux kill-session -t $(echo {} | awk "{ print \$2 }"))+change-prompt(⚡  )+reload(sesh list -i)'
)

if [[ -z "$pick" ]]; then
	exit
fi

exec sesh connect "$pick"
