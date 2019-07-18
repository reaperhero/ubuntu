# /etc/netplan/50-cloud-init.yaml
# netplan apply
network:
    ethernets:
        enp0s3:
            addresses:
            - 192.168.2.90/23
            dhcp4: false
            gateway4: 192.168.2.1
            nameservers:
                addresses: [ 192.168.2.1,8.8.8.8 ]
                search: []
    version: 2

