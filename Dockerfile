FROM centos:latest
MAINTAINER ojelade.oluwadaniel@gmail.com

# Create the repository configuration file
RUN echo '[AppStream]' >> /etc/yum.repos.d/CentOS-AppStream.repo \
    && echo 'name=CentOS Linux $releasever - AppStream' >> /etc/yum.repos.d/CentOS-AppStream.repo \
    && echo 'mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=AppStream&infra=$infra' >> /etc/yum.repos.d/CentOS-AppStream.repo \
    && echo 'gpgcheck=1' >> /etc/yum.repos.d/CentOS-AppStream.repo \
    && echo 'enabled=1' >> /etc/yum.repos.d/CentOS-AppStream.repo \
    && echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial' >> /etc/yum.repos.d/CentOS-AppStream.repo

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
