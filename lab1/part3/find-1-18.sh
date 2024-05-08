find / -name '*pass*'
find / -iname '*pass*'
find / -maxdepth 2 -name '*pass*'
find /home -name '*.bin'
find / -type f -name '*.bak' -delete
find / -type f \( -name '*.txt' -o -name '*.sh' \)
find . -maxdepth 1 -type f -printf "%f\t%u\t%g\t%n\t%s\n"
find . -type d -empty
find . -type d -empty -delete
find . -type f -empty -delete
find . -type f -links +1
find /etc ! -user root
find . -type f ! -name "*.sh"
find . -type f -links +2
find /usr/bin -type f -atime +90
find /usr/bin /usr/share -type f -mtime -10
find /tmp -type f -mtime +14 -delete
find /usr/bin -type f -perm /6000
