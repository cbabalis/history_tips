# owncloud locked files
# go to server, login
cd <owncloudfolder>
vim config/config.php
# append the following line:
'filelocking.enabled' => false,
