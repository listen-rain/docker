FROM centos72

ENV MYSQL_VERSION 5.5.56
ENV MYSQL_BASEDIR /usr/local/mysql

# download from baiduyun
COPY mysql-$MYSQL_VERSION.tar.gz /

RUN mkdir /data && cd /data && mv /mysql-$MYSQL_VERSION.tar.gz ./ \
 && yum -y update \                                                                      
 && yum -y install make cmake gcc gcc-c++ ncurses-devel openssl-devel autoconf* bison \
 && tar -zxvf mysql-$MYSQL_VERSION.tar.gz && rm -f mysql-$MYSQL_VERSION.tar.gz \
 && cd mysql-$MYSQL_VERSION \
 && cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/var/lib/mysql -DMYSQL_UNIX_ADDR=/tmp/mysql.sock -DDEFAULT_CHARSET=utf8mb4 -DDEFAULT_COLLATION=utf8mb4_general_ci -DWITHOUT_PARTITION_STORAGE_ENGINE=1 -DENABLED_LOCAL_INFILE=1 \ 
 && make && make install \
 && useradd mysql \
 && chmod -R +x /usr/local/mysql \
 && chown -R mysql.mysql /usr/local/mysql \
 && cp support-files/my-medium.cnf /etc/my.cnf \
 && yum -y remove cmake gcc gcc-c++ autoconf* && yum clean all \
 && cd / && rm -rf /var/cache/yum/* $MYSQL_BASEDIR/mysql-test $MYSQL_BASEDIR/sql-bench /data \
 && cp /usr/local/mysql/bin/mysqld /usr/local/bin \
 && cp /usr/local/mysql/bin/mysql  /usr/local/bin \
 && cp /usr/local/mysql/bin/mysql_tzinfo_to_sql /usr/local/bin \
 && cp /usr/local/mysql/scripts/mysql_install_db /usr/local/bin 	 
 
#init mysql
#&& useradd mysql
#&& chmod -R +x /usr/local/mysql
#&& chown -R mysql.mysql /usr/local/mysql
#&& /usr/local/mysql/scripts/mysql_install_db --user=mysql --basedir=/usr/local/mysql --datadir=/var/lib/mysql
#&& chown -R root /usr/local/mysql
#&& chown -R mysql /var/lib/mysql
#&& /usr/local/mysql/bin/mysqladmin -u root password 'root' \

VOLUME /var/lib/mysql

#COPY start.sh /usr/local/bin
COPY docker-entrypoint.sh /usr/local/bin/

#RUN ln -s usr/local/bin/start.sh /start.sh 
RUN ln -s /usr/local/bin/docker-entrypoint.sh /docker-entrypoint.sh && mkdir /docker-entrypoint-initdb.d 

#ENTRYPOINT ["start.sh"]
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306

CMD ["mysqld"]   

# docker cp mysql:/var/lib/mysql ./data
# docker cp mysql:/etc/my.cnf    ./my.cnf

