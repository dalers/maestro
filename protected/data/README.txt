use vm with bridged network connection
clone current maestro
copy in new files
set correct file permissions (executable, owner, ...)
git commit
git push back to origin

load_current.sh *should* work with cron if "tar -xzf" extracts to fully qualified directory name (rather than current dir)
- experiment by running from /root

###