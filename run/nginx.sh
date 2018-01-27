#!/bin/bash

cd /work/docker && mkdir nginx && mkdir nginx/logs && mkdir nginx/conf.d 

# edit the nginx/nginx.conf
##########################################

user  nginx;
worker_processes  1;

error_log  /etc/nginx/logs/error.log warn;
pid        /etc/nginx/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}

# edit the nginx/conf.d/defult.conf
#--------------------------------------------------
server {
    listen       80;
    server_name  localhost;

    #charset koi8-r;
    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    #location ~ \.php$ {
    #    root           html;
    #    fastcgi_pass   127.0.0.1:9000;
    #    fastcgi_index  index.php;
    #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
    #    include        fastcgi_params;
    #}

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}
#---------------------------------------------

# edit the nginx/conf.d/testphp.conf
#---------------------------------------------
server {
    listen  8081;
    server_name  testphp.cn;
    root   /www;
    index  index.html index.php;
	
    location / {
        try_files $uri @rewriteapp;
    }

    location @rewriteapp {
        rewrite ^(.*)$ /index.php/$1 last;
    }

    location ~ ^/.*\.php(/|$) {
        fastcgi_pass  mycentos72php:9000;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
#----------------------------------------------

##########################################

docker run -d -p 8080:8080 -p 8081:8081 -p 8082:8082  -v `pwd`/nginx/logs:/etc/nginx/logs -v `pwd`/nginx/conf.d:/etc/nginx/conf.d -v `pwd`/nginx/nginx.conf:/etc/nginx/nginx.conf --name=mynginx --link=mycentos72php:mycentos72php  --volumes-from mycentos72php nginx

