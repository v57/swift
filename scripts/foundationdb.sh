
# installing foundationdb client
wget https://www.foundationdb.org/downloads/6.1.8/ubuntu/installers/foundationdb-clients_6.1.8-1_amd64.deb
dpkg -i foundationdb-clients_6.1.8-1_amd64.deb

# installing foundationdb server
wget https://www.foundationdb.org/downloads/6.1.8/ubuntu/installers/foundationdb-server_6.1.8-1_amd64.deb
dpkg -i foundationdb-server_6.1.8-1_amd64.deb

cd "$(dirname "$0")"
mkdir /usr/lib/pkgconfig
cp libfdb.pc /usr/lib/pkgconfig/libfdb.pc
