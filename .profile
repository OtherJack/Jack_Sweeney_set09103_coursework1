# ~/.profile: Executed by Bourne-compatible login SHells.
#
#clear
# Path to personal scripts and executables (~/.local/bin).
[ -d "$HOME/.local/bin" ] || mkdir -p "$HOME/.local/bin"
export PATH=$HOME/.local/bin:$PATH

ONDEMAND="$(cat /opt/.tce_dir)"/ondemand
[ -d "$ONDEMAND" ] && export PATH=$PATH:"$ONDEMAND"

# Environment variables and prompt for Ash SHell
# or Bash. Default is a classic prompt.
#
PS1='\u@\h:\w\$ '
PAGER='less -EM'
MANPAGER='less -isR'

`which editor >/dev/null` && EDITOR=editor || EDITOR=vim

export PS1 PAGER FILEMGR EDITOR MANPAGER

export BACKUP=1
[ "`id -un`" = "`cat /etc/sysconfig/tcuser`" ] && echo "$BACKUP" | sudo tee /etc/sysconfig/backup >/dev/null
#export FLWM_TITLEBAR_COLOR="B0:C4:DE"

if [ -f "$HOME/.ashrc" ]; then
   export ENV="$HOME/.ashrc"
   . "$HOME/.ashrc"
fi

TERMTYPE=`/usr/bin/tty`
[ ${TERMTYPE:5:3} == "tty" ] && (
[ ! -f /etc/sysconfig/Xserver ] ||
[ -f /etc/sysconfig/text ] ||
[ -e /tmp/.X11-unix/X0 ] || 
startx
)
#echo "[1;33mI'm trying to free your mind, but I can only show you the door.[00m You have walked"
#echo "through by logging into a [1;31mTerminal[00m, but now, you must experiment. Get back the"
#echo "menu with [1;37msh /etc/rc.local[00m. Go google the [1;37mls[00m and [1;37mcd[00m commands. Also, you may get"
#echo "privileged root access by typing [1;37msudo su[00m, and come back here by typing [1;37mexit[00m or"
#echo "or shut down the VM by typing [1;37mpoweroff[00m while root. You can't imagine the lengths"
#echo "admins used to go to in order to keep the keys to the kingdom out of your hands."
#echo "When you are ready, type [1;37mls[00m and hit Enter. Then, type [1;32m./drinkme.sh[00m"
#echo "
#"
echo "[1;33mI'm trying to free your mind, but I can only show you the door.[00m You have walked"
echo "through by logging into a [1;31mTerminal[00m, but now, you must experiment. Get back the"
echo "menu with [1;37msh /etc/rc.local[00m. Go google the [1;37mls[00m and [1;37mcd[00m commands. Also, you may get"
echo "privileged root access by typing [1;37msudo su[00m, and come back here by typing [1;37mexit[00m or"
echo "or shut down the VM by typing [1;37mpoweroff[00m while root. You can't imagine the lengths"
echo "admins used to go to in order to keep the keys to the kingdom out of your hands."
echo "When you are ready, type [1;37mls[00m and hit Enter. Then, type [1;32m./drinkme.sh[00m"
echo "
"
