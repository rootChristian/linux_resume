#!/bin/bash
# Create a backup

readonly dir='backup'
readonly new_file='backup.tar.bz2'
readonly old_file='backup_old.tar.bz2'

if [ -d "/$dir" ] ; then 
    if [ ! -f "/$dir/$new_file" ] ; then touch /$dir/$new_file 
    fi

    echo -e "\nDirectory $dir and file $new_file exits!"
    
else 
    mkdir /$dir && cd /$dir && touch $new_file && cd ..
fi

mv /$dir/$new_file /$dir/$old_file
tar -jcvf /$dir/$new_file /home    # zip -r /backup/backup.zip /home
rm -rf /$dir/$old_file