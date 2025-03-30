FROM httpd:2.4

# Copiamos configuración y archivos necesarios
COPY default.conf /usr/local/apache2/conf/extra/httpd-ssl.conf
COPY ssl/ /usr/local/apache2/conf/ssl/
COPY html/ /usr/local/apache2/htdocs/

# Habilitamos los módulos necesarios
RUN echo "Include conf/extra/httpd-ssl.conf" >> /usr/local/apache2/conf/httpd.conf && \
    sed -i '/LoadModule ssl_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/LoadModule socache_shmcb_module/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    sed -i '/LoadModule http2_module/s/^#//g' /usr/local/apache2/conf/httpd.conf
