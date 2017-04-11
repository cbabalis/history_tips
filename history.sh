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
