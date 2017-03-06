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
