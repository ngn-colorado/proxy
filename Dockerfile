FROM centos:7
MAINTAINER Matthew Monaco <matt@monaco.cx>

RUN yum -y install httpd mod_ssl \
 && yum -y clean all \
 && cp /etc/httpd/conf/httpd.conf{,-dist}

ADD ngn.cs.colorado.edu.key     /etc/pki/
ADD ngn.cs.colorado.edu.crt     /etc/pki/
ADD ngn.cs.colorado.edu.chain   /etc/pki/
ADD httpd.conf                  /etc/httpd/conf/

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
