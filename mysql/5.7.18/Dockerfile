FROM centos72

ENV MYSQL_VERSION 5.7.18
ENV MYSQL_BASEDIR /usr/local/mysql

# download from baiduyun
COPY run/my.cnf /etc/my.cnf
COPY mysql-$MYSQL_VERSION.tar.gz /
COPY boost_1_59_0.tar.bz2 /

RUN mkdir /data && cd /data && mv /mysql-$MYSQL_VERSION.tar.gz ./ \ 
 && yum -y update \ 
 && yum -y install make cmake gcc gcc-c++ bzip2 \ 
 && yum -y install ncurses-devel bison boost boost-devel \
 && tar -zxvf mysql-$MYSQL_VERSION.tar.gz && cd mysql-$MYSQL_VERSION && mkdir boost && cd boost && mv /boost_1_59_0.tar.bz2 ./ && tar -jxvf boost_1_59_0.tar.bz2 && rm -f boost_1_59_0.tar.bz2 && cd /data/mysql-$MYSQL_VERSION && rm -f mysql-$MYSQL_VERSION.tar.gz \
 && cmake -DCMAKE_INSTALL_PREFIX=$MYSQL_BASEDIR  -DMYSQL_DATADIR=/var/lib/mysql -DSYSCONFDIR=/etc  -DWITH_ARCHIVE_STORAGE_ENGINE=1 -DMYSQL_UNIX_ADDR=/var/run/mysql/mysql.sock -DDOWNLOAD_BOOST=1 -DWITH_BOOST=boost -DENABLED_LOCAL_INFILE=1 -DWITH_PARTITION_STORAGE_ENGINE=1  -DEXTRA_CHARSETS=all -DDEFAULT_CHARSET=utf8mb4  -DDEFAULT_COLLATION=utf8mb4_general_ci  -DWITH_DEBUG=0  -DMYSQL_MAINTAINER_MODE=0 -DWITH_SSL:STRING=bundled -DWITH_ZLIB:STRING=bundled \
 && make && make install \
 && useradd mysql \
 && chmod a+x $MYSQL_BASEDIR \
 && chown -R mysql.mysql $MYSQL_BASEDIR \
 && chmod 644 /etc/my.cnf \
 && yum clean all \                                                                                          
 && rm -rf /var/cache/yum/* \
 && yum -y remove make cmake gcc gcc-c++ autoconf* bzip2 \
 && cd / && rm -rf $MYSQL_BASEDIR/docs $MYSQL_BASEDIR/mysql-test /data \
 && sed -i 's/^\(bind-address\)/\#\1/g' /etc/my.cnf \
 && sed -i -e '/\[mysqld\]/{s|$|\nbind-address = 0.0.0.0|}' /etc/my.cnf 

# mysql initialize used openssl 
# RUN yum -y install openssl openssl-devel
 
ENV PATH $PATH:/usr/local/mysql/bin

# init mysql
# && $MYSQL_BASEDIR/bin/mysqld --initialize  --user=mysql --basedir=$MYSQL_BASEDIR --datadir=/var/lib/mysql \
# && chown -R root $MYSQL_BASEDIR \
# && chown -R mysql $MYSQL_BASEDIR/data \
# && $MYSQL_BASEDIR/bin/mysqladmin -u root password 'root' \

VOLUME /var/lib/mysql

COPY docker-entrypoint.sh /usr/local/bin/

RUN ln -s /usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh 

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]

 
