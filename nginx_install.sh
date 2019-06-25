#!/bin/sh
set -x


DOWNDIR=/home/nginx/download
INSTALLDIR=/home/nginx/servers

##install essential files

if [ -e /etc/debian_version ];then
    sudo apt-get update
    sudo apt-get -y install build-essential openssl libssl-dev libpcre3 libpcre3-dev
else
    yum -y install gcc gcc-c++ make gdb automake autoconf libtool openssl openssl-devel pcre pcre-devel
fi


mkdir -p ${DOWNDIR}


##download nginx-purge
cd ${DOWNDIR}
PURGE_VERSION="2.3"
wget http://labs.frickle.com/files/ngx_cache_purge-${PURGE_VERSION}.tar.gz
tar vzxf ngx_cache_purge-${PURGE_VERSION}.tar.gz

##download nginx consisten hash
wget https://codeload.github.com/replay/ngx_http_consistent_hash/zip/master
unzip master

##download nginx
NGINX_VERSION="1.8.1"
wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar zxf nginx-${NGINX_VERSION}.tar.gz


cd ${DOWNDIR}/nginx-${NGINX_VERSION}
NGINX_INSTALL_DIR="${INSTALLDIR}/nginx-${NGINX_VERSION}"
./configure --prefix=${NGINX_INSTALL_DIR} --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-mail --with-mail_ssl_module --with-file-aio --with-ipv6 --with-cc-opt='-O2 -g' --add-module=../ngx_cache_purge-${PURGE_VERSION} --add-module=../ngx_http_consistent_hash-master
make && make install