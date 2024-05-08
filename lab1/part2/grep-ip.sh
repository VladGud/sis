grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $1 | sort | uniq | wc -l
