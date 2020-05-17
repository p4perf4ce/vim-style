#!/bin/bash

BACKUP_DIR="$HOME/vim_backup"

echo "Undoing brainwashing ..."

dir_exists() {
	[ -d $1 ] && return 1 || return 0
}

file_exists() {
	[ -f $1 ] && return 1 || return 0 
}

yep() {
	[ $1 == "Y" ] && return 1 || return 0
	
}


# Is Backup 404
dir_exists $BACKUP_DIR
if [[ $? == 0 ]]; then
	echo "Default backup directory not found."
	echo -n "Use backup ? [Yn] "
	read ans
	yep $ans	
	# Use backup
	if [[ $? == 1 ]]; then
		echo -n "Backup directory: "
		read ans
		BACKUP_DIR=$ans
		dir_exists $BACKUP_DIR
		if [[ $? == 0 ]]; then
			echo "No such directory."
			echo "[ERROR] 1"
			exit 1;
		fi
		# Cleaning
		echo "Removing $HOME/.vim"
		rm -rf "$HOME/.vim"
		echo "Removing $HOME/.vimrc"
		echo "Removing $HOME/.config/coc"
		rm -rf "$HOME/.config/coc"

		# Rolling back
		dir_exists "$BACKUP_DIR/.vim.backup"
		if [[ $? == 1 ]]; then
			mv $BACKUP_DIR/.vim.backup $HOME/.vim
			echo "Restoring .vim"
		fi
		file_exists "$BACKUP_DIR/.vimrc.backup"
		if [[ $? == 1 ]]; then
			mv $BACKUP_DIR/.vimrc.backup  $HOME/.vimrc
		    	echo "Restored .vimrc"
		fi
		dir_exists "$BACKUP_DIR/coc.backup"
		if [[ $? == 1 ]]; then
			my $BACKUP_DIR/coc.backup $HOME/.config/coc
			echo "Restored coc plugins"
		fi
		# Delete backup
		echo "Removing backup ..."
		rm -rf $BACKUP_DIR
		echo "Rollback complete."
		exit 0;
	else
		echo -n "Removing all vim environment ? [Yn] "
		read ans
		yep $ans
		if [[ $? == 0 ]]; then
			echo "Leaving as it should be ..."
			exit 0;
		fi
		echo "Removing $HOME/.vim"
		rm -rf "$HOME/.vim"
		echo "Removing $HOME/.vimrc"
		rm -rf "$HOME/.vimrc"
		echo "Removing $HOME/.config/coc"
		rm -rf "$HOME/.config/coc"
		echo "Rollback complete."
		exit 0;
	fi
else
		# Cleaning
		echo "Removing $HOME/.vim"
		rm -rf "$HOME/.vim"
		echo "Removing $HOME/.vimrc"
		echo "Removing $HOME/.config/coc"
		rm -rf "$HOME/.config/coc"

		# Rolling back
		dir_exists "$BACKUP_DIR/.vim.backup"
		if [[ $? == 1 ]]; then
			mv $BACKUP_DIR/.vim.backup $HOME/.vim
			echo "Restoring .vim"
		fi
		file_exists "$BACKUP_DIR/.vimrc.backup"
		if [[ $? == 1 ]]; then
			mv $BACKUP_DIR/.vimrc.backup  $HOME/.vimrc
		    	echo "Restored .vimrc"
		fi
		dir_exists "$BACKUP_DIR/coc.backup"
		if [[ $? == 1 ]]; then
			my $BACKUP_DIR/coc.backup $HOME/.config/coc
			echo "Restored coc plugins"
		fi
		# Delete backup
		echo "Removing backup ..."
		rm -rf $BACKUP_DIR
		echo "Rollback complete."
		exit 0;
fi

