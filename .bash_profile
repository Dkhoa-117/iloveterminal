export ANDROID_HOME="/Volumes/DanKhoa_SSD/Files/Library/Android/sdk"

# Setting PATH for Python 3.10
alias python=python3 
alias pip=pip3
PATH="/Library/Frameworks/Python.framework/Versions/3.10/bin:${PATH}"

# HANDY ALIASES
alias reload="source ~/.zshrc && source ~/.bashrc"
alias l="exa -lah"
alias ls=exa
alias serverthis="python3 -m http.server"
alias quicknote="open $HOME/Desktop/quicknote.txt"
alias rm=trash
alias startandroid="/Volumes/DanKhoa_SSD/Files/Library/Android/sdk/emulator/emulator @myandroid -netdelay none -netspeed full"
alias remindme="cat ~/commandsreminder.txt"

# FUNCTIONS
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

# CUSTOM BASH
export STARSHIP_CONFIG=~/.config/starship.bash.toml

LFILE="/etc/*-release"
MFILE="/System/Library/CoreServices/SystemVersion.plist"
if [[ -f $LFILE ]]; then
  _distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
elif [[ -f $MFILE ]]; then
  _distro="macos"
fi

case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *macos*)                 ICON="";;
    *)                       ICON="";;
esac
export STARSHIP_DISTRO="$ICON "
eval "$(starship init bash)"