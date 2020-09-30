cd ~

vv=$(lsb_release -rs)
case $vv in
16.04)
	os=ubuntu16.04
	;;
18.04)
	os=ubuntu18.04
	;;
20.04)
	os=ubuntu20.04
	;;
*)
  echo Unsupported version.
  echo Choose ubuntu version
  echo 0 - Ubuntu 16.04
  echo 1 - Ubuntu 18.04
  echo 2 - Ubuntu 20.04
  read INPUT_STRING
  case $INPUT_STRING in
  0)
  	os=ubuntu16.04
  	;;
  1)
  	os=ubuntu18.04
  	;;
  2)
  	os=ubuntu20.04
  	;;
  *)
	;;
esac
esac

echo "Enter swift version (5.2.4, 5.3, ...)"
read version

echo Will install swift $version on $os
echo Press enter to continue...
read

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
