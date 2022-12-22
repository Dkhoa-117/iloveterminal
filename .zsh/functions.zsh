# FUNCTIONs
function noteinfile {
	echo "date: $(date)" >> $1/quick_note.txt
	echo "" >> $1/quick_note.txt
	open $1/quick_note.txt
}
function note {
	echo "date: $(date)" >> $HOME/Desktop/quicknote.txt
	echo "$@" >> $HOME/Desktop/quicknote.txt
	echo "" >> $HOME/Desktop/quicknote.txt
}
function makedir {
	mkdir -p "$1" && cd "$1"
}
function gitclone {
	git clone https://github.com/"$1"/"$2" && cd "$2"
}