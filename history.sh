# Remove git@ for submodule update
vim .gitmodules
vim .git/config
# copy only the .html files that are NOT already in the destination folder
cp -u *.html destination
ln -s source dest
type ls
whatis ls
alias testprep='cd ~/workspace/SDL_TestAutomation; http_proxy=; https_proxy=; HTTP_PROXY=; HTTPS_PROXY=; export python'
# have the 5th field of the first line where tmpfs is
df -h | grep -wm 1 "tmpfs" | awk '//{print $5}'
# sort the 15 biggest files into current directory
du -hsx * | sort -rh | head -15
# workaround for vim, in case colorschemes are failing
# place the themes into the following directory
/usr/share/vim/vim74/colors # 74 could be whatever
find ~ -type f -name *.jpg -size +1M | wc -l
zless foo.txt.gz "equivalent to" gunzip -c foo.txt | less
# to zip a directory (let it be playground) with ALL its subfolders (recursively) we do:
zip -r playground.zip playground
# to find any word of 5 letters with __j_r, you do:
grep -i '^..j.r$' /usr/share/dict/words
locate --regex 'bin/(bz|gz|zip)'

# text processing
sort file1.txt file2.txt file3.txt > final_sorted_list.txt
du -s /usr/share/* | sort -nr | head
ls -s /usr/bin | sort -nr -k 5 | head

##################### bashrc here	############################

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

export PS1="\[\e[36m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\]:\[\e[35m\]\A\[\e[m\]:\[\e[32m\]\w\[\e[m\]:\[\e[31m\]\`parse_git_branch\`\[\e[m\]\\$ "
#################### end of bashrc here	#############################

# difference between files
diff -u file1.txt file2.txt
# old_file and new_file are either single files or directories
diff -Naur old_file new_file > diff_file

# check spelling of the file
sudo dnf install aspell-en
aspell check file.txt

# add directory to the path by adding to .bashrc file:
export PATH=~/bin:"$PATH"
# source .bashrc equivalent:
. .bashrc

# transfer swap to memory (when mem available, but swap is full for some reason)
sudo swapoff -a
sudo swapon -a

#re-enable bluetooth connection via A2DP (xfce problems, usually)
sudo apt-get install pulseaudio-module-bluetooth
pactl load-module module-bluetooth-discover
# then just remove and connect to device (not pair! connect)

# vim 8.1 manual installation https://gist.github.com/yevrah/21cdccc1dc65efd2a4712781815159fb
git clone https://github.com/vim/vim.git
cd vim
#make distclean  # if you build Vim before
make -j8
sudo make install
cp src/vim /usr/bin

# for youcompleteme
#https://github.com/Valloric/YouCompleteMe#linux-64-bit

# for conflicts between different branch checkouts, use
git checkout -f

# for checking the limit of recursions in system:
ulimit -s
# for changing it
ulimit -s 16384 # ulimit -s <value>

# for setting up a working python environment out of the box
python3 -m venv env
source ./env/bin/activate

# change monitors orientation and set another primary display
xrandr --output HDMI-1 --left-of DP-2
xrandr --output DP-2 --primary
