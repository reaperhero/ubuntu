


# 升级gcc到最新版本gcc-11.2.0
```
gcc --version
wget http://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.gz
tar -zxvf gcc-11.2.0.tar.gz
yum -y install bzip2 
// yum -y install gmp mpfr mpc isl bzip2 麒麟系统需要安装
cd gcc-11.2.0
./contrib/download_prerequisites
mkdir build
cd build/
../configure -enable-checking=release -enable-languages=c,c++ -disable-multilib
make
make install
gcc -v
yum -y remove gcc g++
ln -s /usr/local/bin/gcc /usr/bin/gcc
strings /usr/lib64/libstdc++.so.6 | grep CXXABI
rm -f /usr/lib64/libstdc++.so.6
ln -s /usr/local/lib64/libstdc++.so.6.0.29 /usr/lib64/libstdc++.so.6
strings /usr/lib64/libstdc++.so.6 | grep CXXABI
```
