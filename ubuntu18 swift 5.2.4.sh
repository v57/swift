cd ~
version=5.2.4
os=ubuntu18.04

# removing dots from os for url (ubuntu16.04 will be ubuntu1604)
os2="${os//./}"

# if version is already downloaded so we don't need to do anything
if [ -e "swift/$os/$version.tar.gz" ]
then
  echo "Using local archive"
else
  # installing dependencies
  apt-get install clang libicu-dev libcurl4-openssl-dev libpython2.7 pkg-config uuid-dev openssl libssl-dev -y
  # creating directory
  mkdir -p "swift/$os"
  # downloading swift archive
  wget -O "swift/$os/$version.tar.gz" "https://swift.org/builds/swift-$version-release/$os2/swift-$version-RELEASE/swift-$version-RELEASE-$os.tar.gz"
  # extracting swift archive
  tar xzf "swift/$os/$version.tar.gz"
fi
# moving swift archive to /usr directory
rsync -avh "swift/$os/$version/usr" /
# printing swift version
swift --version
