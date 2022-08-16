if [ -z $1 ] | [ -z $2 ]; then
	echo "Usage: ./setup.bash <IP address> <Gateway>"
	exit 1
fi

sudo ip addr flush dev eth0
sudo ip addr add $1/24 dev eth0
sudo ip route add default via $2 dev eth0

sudo rm -f /etc/resolv.conf

echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf > /dev/null
echo "nameserver 8.8.4.4" | sudo tee -a /etc/resolv.conf > /dev/null
