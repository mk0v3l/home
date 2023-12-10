#!/usr/bin/env bash

current_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $current_dir/utils.sh

IFS=' ' read -r -a hide_status <<<$(get_tmux_option "@dracula-git-disable-status" "false")
IFS=' ' read -r -a current_symbol <<<$(get_tmux_option "@dracula-git-show-current-symbol" "✓")
IFS=' ' read -r -a diff_symbol <<<$(get_tmux_option "@dracula-git-show-diff-symbol" "!")
IFS=' ' read -r -a no_repo_message <<<$(get_tmux_option "@dracula-git-no-repo-message" "")
IFS=' ' read -r -a no_untracked_files <<<$(get_tmux_option "@dracula-git-no-untracked-files" "false")
IFS=' ' read -r -a show_remote_status <<<$(get_tmux_option "@dracula-git-show-remote-status" "false")

# Get added, modified, updated and deleted files from git status
getChanges() {
	declare -i added=0
	declare -i modified=0
	declare -i updated=0
	declare -i deleted=0

	for i in $(git -C $path --no-optional-locks status -s); do
		case $i in
		'A')
			added+=1
			;;
		'M')
			modified+=1
			;;
		'U')
			updated+=1
			;;
		'D')
			deleted+=1
			;;

		esac
	done

	output=""
	[ $added -gt 0 ] && output+="${added}A"
	[ $modified -gt 0 ] && output+=" ${modified}M"
	[ $updated -gt 0 ] && output+=" ${updated}U"
	[ $deleted -gt 0 ] && output+=" ${deleted}D"

	echo $output
}

# getting the #{pane_current_path} from dracula.sh is no longer possible
getPaneDir() {
	nextone="false"
	for i in $(tmux list-panes -F "#{pane_active} #{pane_current_path}"); do
		if [ "$nextone" == "true" ]; then
			echo "$i"
			return
		fi
		if [ "$i" == "1" ]; then
			nextone="true"
		fi
	done
}

# check if the current or diff symbol is empty to remove ugly padding
checkEmptySymbol() {
	symbol=$1
	if [ "$symbol" == "" ]; then
		echo "true"
	else
		echo "false"
	fi
}

# check to see if the current repo is not up to date with HEAD
checkForChanges() {
	[ $no_untracked_files == "false" ] && no_untracked="" || no_untracked="-uno"
	if [ "$(checkForGitDir)" == "true" ]; then
		if [ "$(git -C $path --no-optional-locks status -s $no_untracked)" != "" ]; then
			echo "true"
		else
			echo "false"
		fi
	else
		echo "false"
	fi
}

# check if a git repo exists in the directory
checkForGitDir() {
	if [ "$(git -C $path rev-parse --abbrev-ref HEAD)" != "" ]; then
		echo "true"
	else
		echo "false"
	fi
}

# return branch name if there is one
getBranch() {
	if [ $(checkForGitDir) == "true" ]; then
		echo $(git -C $path rev-parse --abbrev-ref HEAD)
	else
		echo $no_repo_message
	fi
}

getRemoteInfo() {
	base=$(git -C $path for-each-ref --format='%(upstream:short) %(upstream:track)' "$(git -C $path symbolic-ref -q HEAD)")
	remote=$(echo "$base" | cut -d" " -f1)
	out=""

	if [ -n "$remote" ]; then
		out="...$remote"
		ahead=$(echo "$base" | grep -E -o 'ahead[ [:digit:]]+' | cut -d" " -f2)
		behind=$(echo "$base" | grep -E -o 'behind[ [:digit:]]+' | cut -d" " -f2)

		[ -n "$ahead" ] && out+=" +$ahead"
		[ -n "$behind" ] && out+=" -$behind"
	fi

	echo "$out"
}

# return the final message for the status bar
getMessage() {
	if [ $(checkForGitDir) == "true" ]; then
		#BA55D3
		# branch="#[fg=orange]#[fg=#BA55D3]$(getBranch)#[fg=#282a36]"
		# branch="#[fg=#999999]$(getBranch)#[fg=orange]#[fg=#282a36]"
		branch="#[fg=grey]$(getBranch)#[fg=orange]#[fg=#282a36]"
		output=""

		if [ $(checkForChanges) == "true" ]; then

			changes="$(getChanges)"

			if [ "${hide_status}" == "false" ]; then
				if [ $(checkEmptySymbol $diff_symbol) == "true" ]; then
					output=$(echo "${changes} $branch")
				else
					output=$(echo "#[fg=#ff8b8b]${changes} $branch$diff_symbol#[fg=#282a36]")
				fi
			else
				if [ $(checkEmptySymbol $diff_symbol) == "true" ]; then
					output=$(echo "$branch")
				else
					output=$(echo "$diff_symbol $branch")
				fi
			fi

		else
			if [ $(checkEmptySymbol $current_symbol) == "true" ]; then
				output=$(echo "$branch")
			else
				output=$(echo "$branch$current_symbol")
			fi
		fi

		[ "$show_remote_status" == "true" ] && output+=$(getRemoteInfo)
		# echo "#[fg=orange]󰊢#[fg=#999999] $output"
		echo "#[fg=orange]󰊢#[fg=grey] $output"
	else
		# echo $no_repo_message
		err="#[fg=#ff8b8b] #[fg=#282a36]"
		echo "#[fg=orange]󰊢#[fg=#999999] $err"
	fi
}
# nouveau_path=$(echo $variable_path | sed "s|^/home/mkovel|~|")
cyan='#8be9fd'
gray='#44475a'
dark_purple='#6272a4'
main() {
	res=$(tmux list-panes -F "#{pane_active} #{pane_current_path}; #{pane_current_command}" | grep "^1" | cut -c 3-)
	path=$(echo $res | cut -d';' -f1)
	command=$(echo $res | cut -d';' -f2)

	# echo "$res"
	if echo "$command" | grep -q "ssh"; then
		# if echo "$command" | grep -q "nvim"; then
		path=$(echo "󰀂$command")
		res=$(echo "#[fg=red]#[bg=red]#[fg=grey]$path #[fg=$gray]")
	else
		house="#[fg=#A52A2A]#[fg=grey]"
		path=$(echo $path | sed "s|^/home/mkovel|$house|")
		res=$(echo "#[fg=black]#[bg=black]#[fg=grey]$path #[fg=$gray]")
	fi
	echo $res
}

#run main driver program
main
