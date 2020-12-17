export DEBIAN_FRONTEND=noninteractive
# Startup commands go here


sudo sysctl -w net.ipv4.ip_forward=1

sudo ip addr add 192.168.1.1/30 dev enp0s9
sudo ip link set dev enp0s9 up

sudo ip link add link enp0s8 name vlan2 type vlan id 2
sudo ip link add link enp0s8 name vlan3 type vlan id 3

sudo ip addr add 192.168.2.1/24 dev vlan2
sudo ip addr add 192.168.3.1/24 dev vlan3
sudo ip link set dev enp0s8 up

sudo ip route add 192.168.4.0/26 via 192.168.1.2