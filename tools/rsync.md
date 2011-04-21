# backup a dir

rsync -avb --delete /path/to/source/ /path/to/dest

# backup a remote dir to a local one

rsync -avb --delete drtoast@drtoast.com:toast.dj /volumes/wbackup
rsync -avb --delete drtoast@drtoast.com:dr.toast.dj/new /volumes/wbackup/dr.toast.dj
