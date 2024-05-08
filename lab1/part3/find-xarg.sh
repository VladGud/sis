find . -type f -name "*.txt" -print0 | xargs -0 cat | wc -l
find . -type f -name "*.sh" -exec chmod +x {} +
find /etc -type f -name "*.conf" -print0 | du --files0-from=- -hc

