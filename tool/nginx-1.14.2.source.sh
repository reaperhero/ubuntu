#!/bin/bash
wget http://nginx.org/download/nginx-1.14.2.tar.gz
tar -zxvf nginx-1.14.2.tar.gz
yum -y install openssl openssl-devel
yum install -y gc gcc gcc-c++
yum -y install libxml2 libxml2-dev
yum -y install GeoIP GeoIP-devel GeoIP-data
yum -y install gcc-c++ autoconf automake
yum -y install libxslt-devel
yum install -y pcre-devel zlib-devel openssl-devel libxslt-devel GeoIP-devel perl-ExtUtils-Embed
cd nginx-1.14.2
./configure \
--prefix=/usr/local/nginx \
--with-file-aio \
--with-http_auth_request_module \
--with-http_ssl_module \
--with-http_v2_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_xslt_module=dynamic \
--with-http_geoip_module=dynamic \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_degradation_module \
--with-http_slice_module \
--with-http_stub_status_module \
--with-http_perl_module=dynamic \
--with-pcre --with-pcre-jit \
--with-stream=dynamic \
--with-stream_ssl_module

make && make install 
/usr/local/nginx -V
