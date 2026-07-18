apt purge -y '^ghc*'
apt purge -y '^dotnet-.*'
apt purge -y '^llvm-.*'
apt purge -y 'php.*'
apt purge -y '^temurin-.*-jdk'
apt purge -y azure-cli google-cloud-sdk hhvm google-chrome-stable microsoft-edge-stable firefox powershell mono-devel mysql* postgresql* mongodb* libpq-dev moby-* cabal* clang* gfortran-* powershell kubectl r-base
apt-get autoremove -y
apt-get autoclean -y
rm -rf /opt/*
rm -rf /imagegeneration
rm -rf /usr/share/dotnet/
rm -rf /usr/share/swift/
rm -rf /usr/share/kotlinc
rm -rf /usr/share/miniconda
rm -rf /usr/share/sbt
rm -rf /usr/local/lib/android/
rm -rf /usr/local/julia*
rm -rf /usr/local/share/phantomjs*
rm -rf /usr/local/share/boost
rm -rf /usr/local/aws-cli
rm -rf /usr/lib/jvm
rm -rf /usr/share/az_*
rm -rf /opt/pipx
rm -rf /opt/hostedtoolcache
remove_images() {
  images=$(docker image ls -q --filter "reference=$1")
  if [ -n "$images" ]; then
    docker rmi $images
  fi
}

remove_images "node*"
remove_images "buildpack*"
remove_images "alpine*"
remove_images "ubuntu*"
