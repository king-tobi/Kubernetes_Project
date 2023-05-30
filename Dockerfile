FROM centos:latest
MAINTAINER ojelade.oluwadaniel@gmail.com

# Copy the repository configuration file to the container
COPY CentOS-AppStream.repo /etc/yum.repos.d/CentOS-AppStream.repo

# Modify the repository configuration
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-AppStream.repo \
    && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-AppStream.repo \
    && sudo yum update -y


# Install required packages
RUN yum install -y httpd zip unzip

# Add your remaining commands for the pipeline
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip

# Start the Apache HTTP server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80 22


# FROM  centos:latest
# MAINTAINER ojelade.oluwadaniel@gmail.com
# RUN yum install -y httpd zip unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip photogenic.zip
# RUN cp -rvf photogenic/* .
# RUN rm -rf photogenic photogenic.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80 22


# FROM  centos:latest
# MAINTAINER ojelade.oluwadaniel@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
#  ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
#  WORKDIR /var/www/html/
#  RUN unzip shine.zip
#  RUN cp -rvf shine/* .
#  RUN rm -rf shine shine.zip
#  CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#  EXPOSE 80
