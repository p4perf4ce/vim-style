#!/bin/bash

BACKUP_DIR="$HOME/vim_backup"
VIMENV="vimenv"
VIMRC="vimrc"
COC_PLUGIN_FILE="coc-plugins"
COC_DIR="$HOME/.config/coc"

echo "====== VIM STYLE APPLYER ======"
echo "Author: p4perf4ce"

VIM_VERSION=$(vim --version | head -1 | awk -F' ' '{print $5}')
IS_VERSION_INVALID=$(echo $VIM_VERSION | awk -F' ' '{print $0 < 8.2}')

if [[ $IS_VERSION_INVALID == 1 ]]; then
	echo "Vim Version: $VIM_VERSION ... INCORRECT"
	echo "[ERROR] 1"
	exit 1;
fi

echo "Vim Version: $VIM_VERSION ... CORRECT"

echo -n "Checking vimenv ... "
if [[ ! -f "$VIMENV" ]]; then
	echo "Missing"
	echo "Possible corruption detected. Terminating."
	exit 9;
else
	echo "OK"
fi

echo -n "Checking coc-plugins ... "
if [[ ! -f "$COC_PLUGIN_FILE" ]]; then
	echo "Missing"
	echo "Possible corruption detected. Terminating."
	exit 10;
else
	echo "OK"
fi

echo -n "Proceed ? [Yn] "
read ans
if [[ $ans != "Y" ]]; then
	echo "Canceled"
	exit 0;
fi

echo "1) \"ALL OF IT\""
echo "2) I just want coc plugins."
echo -n "Select: "
read ch
OPTION=$ch

echo "==============================="

echo "Begin applying new fetish to your editor ..."
if [[ -d $BACKUP_DIR ]]; then
	echo "Default backup directory path is used. [$BACKUP_DIR]"
	echo -n "Backup directory: "
	read buff
	BACKUP_DIR=buff
fi
mkdir $BACKUP_DIR
echo "Backup will be stored at $BACKUP_DIR"
if [[ -e "$HOME/.vimrc" ]]; then
	echo -n "Your previous fetish found, still going ? [Yn] "
	read ans
	if [[ $ans != "Y" ]]; then
		echo "Leaving your fetish as they were ..."
		exit 0;
	else
		mv $HOME/.vimrc $BACKUP_DIR/.vimrc.backup
		echo "Overwriting your previous fetish ..."
	fi
else
	echo "No previous kink was found. Welcome to the club."
fi

if [[ $OPTION == 1 ]]; then # SKIP

echo "Dee dud daa."
cp $VIMENV $HOME/.vimrc
echo "Daa dud dee."
if [[ -d "$HOME/.vim" ]]; then
	echo "Backup your fetish material ..."
	mv $HOME/.vim $BACKUP_DIR/.vim.backup
fi

echo "Downloading your fetish manager"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Downloading your fetish... This will take a moment."
sleep 1
vim +PlugInstall +only +PlugClean +qall
echo -n "All the fetishes are ready. Applying ..."
cp $VIMRC $HOME/.vimrc
echo "Done"

echo -n "Downloading Coc.nvim plugin ? [Yn] "
read ans
else
	ans="Y"
fi

if [[ $ans == "Y" ]]; then
	# Avoid coc.nvim interrupt
	mkdir -p $COC_DIR
	mkdir -p $COC_DIR/extensions
	if [[ ! -f "$COC_PLUGIN_FILE" ]]; then
		echo "Plugin list does not exists !!!"
		echo "Possible corruption detected, rollback ..."
		# Rollback
		echo "[ERROR] 2"
		exit 2;
	fi
	# Check if coc dir exists
	if [[ -f $COC_DIR ]]; then
		echo "Backup coc plugins ..."
		mv $COC_DIR $BACKUP_DIR/coc.backup
	fi
	# Install plugin
	plugins=(`cat $COC_PLUGIN_FILE`)
	echo "Plugin to be installed:"
	for plugin in "${plugins[@]}"; do
		echo "+ $plugin"
	done
	echo -n "Confirm ? [Yn] "
	read ans
	if [[ $ans != "Y" ]]; then
		echo "Cancle plugin installation ..."
		echo "Fetish applied partially."
		echo "Done."
	fi
	# Begin process
	echo "Begin plugin install ..."
	echo "Moving into $COC_DIR/extensions"
	cd $COC_DIR/extensions
	if [[ ! -f package.json ]];then
		echo '{"dependencies":{}}'> package.json
	fi
	for plugin in "${plugins[@]}"; do
		echo "Installing $plugin"
		npm install $plugin --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
	done
	echo "Fetish applied."
	echo "Done."
fi


	

