FROM mariadb:10.1
ENV MYSQL_ROOT_PASSWORD qwe123

USER root

#Change db configuration as required by official install docs and Enable utf8 support
RUN echo "[mysqld]" >> /etc/mysql/conf.d/znuny.cnf &&\
    echo "max_allowed_packet=256M" >> /etc/mysql/conf.d/znuny.cnf &&\
    echo "query_cache_size=256M" >> /etc/mysql/conf.d/znuny.cnf &&\
    echo "innodb_log_file_size=256M" >> /etc/mysql/conf.d/znuny.cnf &&\
    echo "skip-character-set-client-handshake" >> /etc/mysql/conf.d/znuny.cnf &&\
    echo "init-connect='SET NAMES utf8'" >> /etc/mysql/conf.d/znuny.cnf &&\
    echo "init_connect='SET collation_connection = utf8_unicode_ci'" >> /etc/mysql/conf.d/znuny.cnf &&\
    echo "collation-server = utf8_general_ci" >> /etc/mysql/conf.d/znuny.cnf &&\
    echo "character-set-server = utf8" >> /etc/mysql/conf.d/znuny.cnf
