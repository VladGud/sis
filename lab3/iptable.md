1. Разрешить все паĸеты, входящие с интерфейса eth0.
```bash
iptables -A INPUT -i eth0 -j ACCEPT
```

2. Запретить все паĸеты, входящие с интерфейса eth1
```bash
iptables -A INPUT -i eth1 -j DROP
```

3. Разрешить все паĸеты, входящие на порт 80
```bash
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
```

4. Запретить все паĸеты, входящие на порт 22
```bash
iptables -A INPUT -p tcp --dport 22 -j DROP
```

5. Запретить все паĸеты, исходящие на порт 22
```bash
iptables -A OUTPUT -p tcp --dport 22 -j DROP
```

6. Разрешить все паĸеты, отправленные на порт 443, тольĸо если они пришли с IP 192.168.1.1
```bash
iptables -A INPUT -p tcp --dport 443 -s 192.168.1.1 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j DROP
```

7. Перенаправить все паĸеты, отправленные на порт 80, на порт 8080
```bash
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
```