#! /bin/sh

BASE_URL=http://netstorage.unity3d.com/unity
HASH=3829d7f588f3
VERSION=5.5.2f1

download() {
  file=$1
  url="$BASE_URL/$HASH/$package"

  echo "Downloading from $url: "
  curl -o `basename "$package"` "$url" —-retry 5
}

install() {
  package=$1
  download "$package"

  echo "Installing "`basename "$package"`
  sudo installer -dumplog -package `basename "$package"` -target /
}

# See $BASE_URL/$HASH/unity-$VERSION-$PLATFORM.ini for complete list
# of available packages, where PLATFORM is `osx` or `win`
# http://netstorage.unity3d.com/unity/3829d7f588f3/unity-5.5.2f1-osx.ini

install "MacEditorInstaller/Unity-$VERSION.pkg"