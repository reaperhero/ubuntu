FROM centos:centos7.6.1810
RUN yum -y update
RUN yum -y install pcre-devel zlib-devel make gcc gcc-c++ openssl openssl-devel
RUN useradd -M -s /sbin/nologin nginx
ADD nginx-1.18.0.tar.gz /opt/
# wget https://codeload.github.com/yaoweibin/nginx_upstream_check_module/zip/master
COPY nginx_upstream_check_module-master /opt/nginx-1.18.0/nginx_upstream_check_module-master/
COPY ngx-http-t1k-module-t1k-3.4.0-1e5be1d0 /opt/nginx-1.18.0/ngx-http-t1k-module-t1k-3.4.0-1e5be1d0/
WORKDIR /opt/nginx-1.18.0
RUN mkdir /var/log/nginx/ /var/cache/nginx/client_temp -p
RUN ./configure --prefix=/etc/nginx --sbin-path=/usr/sbin/nginx --modules-path=/usr/lib64/nginx/modules --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx.pid --lock-path=/var/run/nginx.lock --http-client-body-temp-path=/var/cache/nginx/client_temp --http-proxy-temp-path=/var/cache/nginx/proxy_temp --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp --http-scgi-temp-path=/var/cache/nginx/scgi_temp --user=nginx --group=nginx --with-compat --with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module --with-http_dav_module --with-http_flv_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_mp4_module --with-http_random_index_module --with-http_realip_module --with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module --with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module --with-stream --with-stream_realip_module --with-stream_ssl_module --with-stream_ssl_preread_module --with-cc-opt='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -m64 -mtune=generic -fPIC' --with-ld-opt='-Wl,-z,relro -Wl,-z,now -pie' --add-module=./nginx_upstream_check_module-master --add-dynamic-module=./ngx-http-t1k-module-t1k-3.4.0-1e5be1d0
RUN make && make install && nginx -V
RUN mkdir /etc/nginx/modules -p && \
    cp /usr/lib64/nginx/modules/ngx_http_t1k_core_module.so /etc/nginx/modules
ADD build/login.defs /etc/login.defs
EXPOSE 80
EXPOSE 443
WORKDIR /root/nginx
CMD ["nginx", "-g", "daemon off;"]


